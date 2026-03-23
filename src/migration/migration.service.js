// require("dotenv").config();
// const { execSync } = require("child_process");

// const walletPath = "C:\\Users\\Dell\\Desktop\\Apex\\Wallet_NQW6I39M89RA0ZRJ";

// const SQLCL_CMD = `sql -thin -tnsadmin "${walletPath}" ${process.env.DB_USERNAME}/${process.env.DB_PASSWORD}@nqw6i39m89ra0zrj_high`;

// class MigrationService {
//   runUpdate() {
//     try {
//       console.log("🚀 Running update via SQLcl...");
//       const cmd = `echo "lb update -changelog-file ${process.env.CHANGELOG_FILE}" | ${SQLCL_CMD}`;
//       execSync(cmd, { stdio: "inherit", shell: "powershell.exe" });
//       console.log("✅ Update successful");
//     } catch (err) {
//       console.error("Update failed");
//       process.exit(1);
//     }
//   }

//   runStatus() {
//     try {
//       console.log("📊 Checking status via SQLcl...");
//       const cmd = `echo "lb status -changelog-file ${process.env.CHANGELOG_FILE}" | ${SQLCL_CMD}`;
//       execSync(cmd, { stdio: "inherit", shell: "powershell.exe" });
//     } catch (err) {
//       console.error("Status check failed");
//       process.exit(1);
//     }
//   }

//   rollbackLast() {
//     try {
//       console.log("⏪ Rolling back via SQLcl...");
//       const cmd = `echo "lb rollback-count -changelog-file ${process.env.CHANGELOG_FILE} -count 1" | ${SQLCL_CMD}`;
//       execSync(cmd, { stdio: "inherit", shell: "powershell.exe" });
//     } catch (err) {
//       console.error("Rollback failed");
//       process.exit(1);
//     }
//   }
// }

// module.exports = new MigrationService();

require("dotenv").config();
const { execSync } = require("child_process");

const WALLET_PATH = process.env.DB_WALLET;

const envConfig = {
  PATH: process.env.PATH,
  TNS_ADMIN: WALLET_PATH,
  JAVA_TOOL_OPTIONS: `-Doracle.net.tns_admin=${WALLET_PATH} -Doracle.net.wallet_location=${WALLET_PATH}`,
};

class MigrationService {
  runUpdate() {
    console.log("🚀 Running update...");
    execSync(
      `npx liquibase --url="${process.env.DB_URL}" --username="${process.env.DB_USERNAME}" --password="${process.env.DB_PASSWORD}" --changeLogFile="${process.env.CHANGELOG_FILE}" update`,
      { stdio: "inherit", env: envConfig }
    );
  }

  runStatus() {
    console.log("📊 Checking status...");
    execSync(
      `npx liquibase --url="${process.env.DB_URL}" --username="${process.env.DB_USERNAME}" --password="${process.env.DB_PASSWORD}" --changeLogFile="${process.env.CHANGELOG_FILE}" status`,
      { stdio: "inherit", env: envConfig }
    );
  }

  rollbackLast() {
    console.log("⏪ Rolling back last change...");
    execSync(
      `npx liquibase --url="${process.env.DB_URL}" --username="${process.env.DB_USERNAME}" --password="${process.env.DB_PASSWORD}" --changeLogFile="${process.env.CHANGELOG_FILE}" rollbackCount 1`,
      { stdio: "inherit", env: envConfig }
    );
  }

  tag(version) {
    console.log(`🏷️ Tagging version: ${version}`);
    execSync(
      `npx liquibase --url="${process.env.DB_URL}" --username="${process.env.DB_USERNAME}" --password="${process.env.DB_PASSWORD}" --changeLogFile="${process.env.CHANGELOG_FILE}" tag ${version}`,
      { stdio: "inherit", env: envConfig }
    );
  }

  rollbackToTag(version) {
    console.log(`⏪ Rolling back to version: ${version}`);
    execSync(
      `npx liquibase --url="${process.env.DB_URL}" --username="${process.env.DB_USERNAME}" --password="${process.env.DB_PASSWORD}" --changeLogFile="${process.env.CHANGELOG_FILE}" rollback ${version}`,
      { stdio: "inherit", env: envConfig }
    );
  }
}

module.exports = new MigrationService();