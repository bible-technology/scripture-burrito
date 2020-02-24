const schemaIndex = require('../schema');
const fs = require('fs');
const Ajv = require('ajv');


const ajv = new Ajv({schemas: schemaIndex.schemas});


function validate(fn, data) {
    const validator = ajv.getSchema(schemaIndex.schemaIds.metadata);
    if (validator(JSON.parse(data))) {
        console.log(fn + ': No errors.');
        return true;
    } else {
        console.log(fn + ':', validator.errors);
        return false;
    }
}

let success = true;
if (process.argv.length > 2) {
    for (const arg of process.argv.slice(2)) {
        if (!validate(arg, fs.readFileSync(arg, "utf-8"))) {
            success = false;
        }
    }
} else {
    const data = fs.readFileSync(0, "utf-8");
    success = validate("<stdin>", data);
}
if (!success) {
    process.exit(1);
}
