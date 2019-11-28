import sys
import os.path
import json
import jsonschema


schema_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'schema')
schema = json.load(open(os.path.join(schema_dir, 'metadata.schema.json')))
resolver = jsonschema.RefResolver(referrer=schema, base_uri='file://' + schema_dir.replace('\\', '/') + '/')


def validate(input):
    "Validates the given file-like object against the schema."
    data = json.load(input)
    jsonschema.validate(data, schema, resolver=resolver)


if __name__ == '__main__':
    files = sys.argv[1:]
    inputs = []
    for file in files:
        if file == '-':
            inputs.append(sys.stdin)
        else:
            inputs.append(open(file, 'r'))

    if not inputs:
        inputs.append(sys.stdin)

    for input in inputs:
        try:
            validate(input)
            print("{0}: No errors.".format(input.name))
        except Exception as ex:
            print("{0}: {1}".format(input.name, str(ex)))
