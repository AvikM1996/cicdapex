const migrationService = require("./migration.service");
const { validateChangelog } = require("./migration.validator");

const command = process.argv[2];
const arg = process.argv[3];

switch (command) {
  case "update":
    validateChangelog("liquibase");
    migrationService.runUpdate();
    break;

  case "status":
    migrationService.runStatus();
    break;

  case "rollback":
    migrationService.rollbackLast();
    break;

  case "tag":
    migrationService.tag(arg);
    break;

  case "rollbackTo":
    migrationService.rollbackToTag(arg);
    break;

  default:
    console.log(`
Usage:
  node src/migration/migration.runner.js update
  node src/migration/migration.runner.js status
  node src/migration/migration.runner.js rollback
  node src/migration/migration.runner.js tag v1.0
  node src/migration/migration.runner.js rollbackTo v1.0
    `);
}