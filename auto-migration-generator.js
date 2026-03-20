const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

const DB_DIR = path.join(__dirname, "db");
const CHANGELOG_DIR = path.join(DB_DIR, "changelog");
const SNAPSHOT_DIR = path.join(__dirname, "db_snapshot");
const AUTHOR = "auto-system";
const DATE = new Date().toISOString().replace(/[-:T]/g, "").slice(0, 14);

// ===== SUMMARY TRACKER =====
const summary = {
  tables: [],
  indexes: [],
  sequences: [],
  views: [],
  packages: [],
  procedures: [],
  functions: [],
  triggers: [],
  synonyms: [],
  types: [],
  materialized_views: [],
  warnings: []
};

let rollbackSQL = "";


// ensure changelog folder
if (!fs.existsSync(CHANGELOG_DIR)) {
  fs.mkdirSync(CHANGELOG_DIR);
}

// ===== GIT OLD FILE =====
function getOldFile(filePath) {
  try {
    return execSync(`git show HEAD:${filePath}`, { encoding: "utf8" });
  } catch {
    return null;
  }
}

// ===== READ FILE =====
function readFile(filePath) {
  return fs.readFileSync(filePath, "utf8");
}

// ===== PARSE COLUMNS =====
function parseColumns(sql) {
  const match = sql.match(/\(([\s\S]*?)\)/);
  if (!match) return [];

  return match[1]
    .split(",")
    .map((line) => {
      const parts = line.trim().split(/\s+/);
      return {
        name: parts[0],
        type: parts.slice(1).join(" "),
      };
    })
    .filter(c => c.name);
}

// ===== DIFF ENGINE =====
function diffColumns(oldCols, newCols) {
  const changes = {
    added: [],
    modified: [],
    possibleRename: []
  };

  const oldMap = Object.fromEntries(oldCols.map(c => [c.name, c]));
  const newMap = Object.fromEntries(newCols.map(c => [c.name, c]));

  for (let col of newCols) {
    if (!oldMap[col.name]) {
      changes.added.push(col);
    } else if (oldMap[col.name].type !== col.type) {
      changes.modified.push({
        old: oldMap[col.name],
        new: col
      });
    }
  }

  if (changes.added.length === 1 && oldCols.length === newCols.length) {
    changes.possibleRename.push({
      from: oldCols.find(o => !newMap[o.name])?.name,
      to: changes.added[0].name
    });
  }

  return changes;
}

// ===== GENERATE SQL =====
function generateSQL(tableName, diff) {
  let sql = "";
  let rollback = "";

  if (diff.added.length > 0) {
    summary.tables.push(
      `${tableName} → Added columns: ${diff.added.map(c => c.name).join(", ")}`
    );
  }

  diff.added.forEach(col => {
    sql += `ALTER TABLE ${tableName} ADD (${col.name} ${col.type});\n`;
    rollback += `ALTER TABLE ${tableName} DROP COLUMN ${col.name};\n`;
  });

  diff.modified.forEach(c => {
    const msg = `Datatype change: ${tableName}.${c.old.name}`;
    console.warn(`⚠️ ${msg}`);
    summary.warnings.push(msg);
    sql += `-- MODIFY ${c.old.name} manually\n`;
  });

  diff.possibleRename.forEach(r => {
    const msg = `Possible rename: ${tableName} ${r.from} → ${r.to}`;
    console.warn(`⚠️ ${msg}`);
    summary.warnings.push(msg);
  });

  return { sql, rollback };
}

// ===== XML BUILDER =====
function buildChangeSet(id, sql, rollback, filePath, runOnChange) {
  if (filePath) {
    return `
<changeSet id="${id}" author="${AUTHOR}" ${runOnChange ? 'runOnChange="true"' : ""}>
    <sqlFile path="${filePath}"/>
</changeSet>`;
  }

  return `
<changeSet id="${id}" author="${AUTHOR}">
    <sql>
${sql}
    </sql>
    ${rollback ? `<rollback>\n${rollback}\n</rollback>` : ""}
</changeSet>`;
}

// ===== PROCESS FOLDER =====
function processFolder(folder) {
  const folderPath = path.join(DB_DIR, folder);
  if (!fs.existsSync(folderPath)) return "";

  const files = fs.readdirSync(folderPath).filter(f => f.endsWith(".sql"));
  let xml = "";

  files.forEach(file => {
    const fullPath = path.join(folderPath, file);
    const relativePath = `../${folder}/${file}`;
    const name = file.replace(".sql", "");

    const newSQL = readFile(fullPath);
    const oldSQL = getOldFile(`db/${folder}/${file}`);

    const id = `${folder}-${name}-${DATE}`;

    if (folder === "tables") {
      if (!oldSQL) {
        summary.tables.push(`${name} → New table created`);
        xml += buildChangeSet(id, null, null, relativePath, false);
        return;
      }

      const oldCols = parseColumns(oldSQL);
      const newCols = parseColumns(newSQL);
      const diff = diffColumns(oldCols, newCols);

      const { sql, rollback } = generateSQL(name, diff);

      if (sql) {
        xml += buildChangeSet(id, sql, rollback);
      }

    } else if (["indexes", "sequences"].includes(folder)) {
      if (!oldSQL) {
        summary[folder].push(`${name} → New ${folder}`);
        xml += buildChangeSet(id, null, null, relativePath, false);
      }

    } else {
      summary[folder].push(`${name} → Updated (runOnChange)`);
      xml += buildChangeSet(id, null, null, relativePath, true);
    }
  });

  return xml;
}

// ===== MAIN =====
const folders = [
  "tables",
  "indexes",
  "sequences",
  "views",
  "packages",
  "procedures",
  "functions",
  "triggers",
  "synonyms",
  "types",
  "materialized_views"
];

let xml = `<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog">\n`;

folders.forEach(folder => {
  const section = processFolder(folder);
  if (section) {
    xml += `\n<!-- ${folder.toUpperCase()} -->\n${section}\n`;
  }
});

xml += `</databaseChangeLog>`;

// ===== WRITE XML =====
const fileName = `V_${DATE}_auto.xml`;
const outputPath = path.join(CHANGELOG_DIR, fileName);

fs.writeFileSync(outputPath, xml);

// ===== GENERATE SUMMARY =====
function generateSummaryFile() {
  let text = `==== MIGRATION SUMMARY ====\n`;
  text += `DATE: ${DATE}\n\n`;

  Object.keys(summary).forEach(section => {
    if (summary[section].length > 0) {
      text += `--- ${section.toUpperCase()} ---\n`;
      summary[section].forEach(item => {
        text += `- ${item}\n`;
      });
      text += `\n`;
    }
  });

  const summaryPath = path.join(CHANGELOG_DIR, `migration-summary-${DATE}.txt`);
  fs.writeFileSync(summaryPath, text);

  console.log(`📄 Summary generated: ${summaryPath}`);
}

// ===== ROLLBACK PREVIEW =====
function generateRollbackPreview() {
  const content = `-- ROLLBACK PREVIEW\n-- DATE: ${DATE}\n\n${rollbackSQL}`;
  fs.writeFileSync(path.join(CHANGELOG_DIR, `rollback-preview-${DATE}.sql`), content);
}

// ===== SNAPSHOT =====
function saveSnapshot() {
  if (fs.existsSync(SNAPSHOT_DIR)) {
    fs.rmSync(SNAPSHOT_DIR, { recursive: true, force: true });
  }
  fs.cpSync(DB_DIR, SNAPSHOT_DIR, { recursive: true });
}

generateSummaryFile();
generateRollbackPreview();
saveSnapshot();

console.log(`🚀 XML Generated: ${fileName}`);