const fs = require("fs");
const path = require("path");

function validateChangelog(inputPath) {
  let filesToCheck = [];

  const stat = fs.statSync(inputPath);

  if (stat.isDirectory()) {
    const files = fs.readdirSync(inputPath, { recursive: true });

    filesToCheck = files
      .filter((f) => f.endsWith(".xml"))
      .map((f) => path.join(inputPath, f));
  } else {
    filesToCheck = [inputPath];
  }

  const hasValidContent = filesToCheck.some((file) => {
    const content = fs.readFileSync(file, "utf-8");
    return content.includes("<changeSet") || 
           content.includes("<include") || 
           content.includes("<includeAll");
  });

  if (!hasValidContent) {
    throw new Error("No valid Liquibase content (changeSet, include, includeAll) found");
  }

  console.log("Changelog valid");
}

module.exports = { validateChangelog };