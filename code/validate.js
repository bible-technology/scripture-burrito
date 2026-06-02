const schemaIndex = require("../schema");
const fs = require("fs");
const globSync = require("glob").globSync;
const path = require("path");
const Ajv = require("ajv");
const addFormats = require("ajv-formats");

const ajv = new Ajv({ schemas: schemaIndex.schemas });

ajv.addKeyword("$$target");
ajv.addKeyword("revision");
ajv.addKeyword("timestamp");
addFormats(ajv);

function validate(schemaName, fn, data) {
  const validator = ajv.getSchema(schemaIndex.schemaIds[schemaName]);
  if (validator(JSON.parse(data))) {
    console.log(fn + ": No errors.");
    return true;
  } else {
    console.log(fn + ":", validator.errors);
    return false;
  }
}

function FindFiles(pattern) {
  const fullPath = path.join(__dirname, "..", pattern);
  const fileDir = path.dirname(fullPath);
  const files = globSync(path.basename(fullPath), { nodir: true, cwd: fileDir });
  return files.map(file => path.join(fileDir, file));
}

let success = true;

if (process.argv.length > 3) {
  for (const arg of process.argv.slice(3)) {
    for (const fPat of FindFiles(arg)) {
      const fNm = path.basename(fPat);
      if (!validate(process.argv[2], fNm, fs.readFileSync(fPat, "utf-8"))) {
        success = false;
      }
    }
  }
} else {
  const data = fs.readFileSync(0, "utf-8");
  success = validate(process.argv[2], "<stdin>", data);
}
if (!success) {
  process.exit(1);
}
