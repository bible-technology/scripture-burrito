const schemaIndex = require('../schema');
const fs = require('fs');
const Ajv = require('ajv');


const ajv = new Ajv({schemas: schemaIndex.schemas});


function validate(fn, data) {
    const validator = ajv.getSchema(schemaIndex.schemaId);
    if (validator(JSON.parse(data))) {
        console.log(fn + ': No errors.');
    } else {
        console.log(fn + ':', validator.errors);
    }
}

if (process.argv.length > 2) {
    for (const arg of process.argv.slice(2)) {
        validate(arg, fs.readFileSync(arg, "utf-8"));
    }
} else {
    const data = fs.readFileSync(0, "utf-8");
    validate("<stdin>", data);
}

