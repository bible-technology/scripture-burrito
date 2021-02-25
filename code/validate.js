const schemaIndex = require("../schema");
const fs = require("fs");
const Ajv = require("ajv");

const ajv = new Ajv({ schemas: schemaIndex.schemas });

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

let success = true;
if (process.argv.length > 3) {
    for (const arg of process.argv.slice(3)) {
        if (!validate(process.argv[2], arg, fs.readFileSync(arg, "utf-8"))) {
            success = false;
        }
    }
} else {
    const data = fs.readFileSync(0, "utf-8");
    success = validate(process.argv[2], "<stdin>", data);
}
if (!success) {
    process.exit(1);
}
