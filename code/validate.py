#!/usr/bin/env python3
import sys
import os.path
import json
import jsonschema


if int(jsonschema.__version__.split('.', 1)[0]) < 3:
    raise RuntimeError("Please update jsonschema to 3.0.0 or later.")


schema_uri_prefix = 'https://burrito.bible/schema/'
schema_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'schema')
schema = json.load(open(os.path.join(schema_dir, 'metadata.schema.json')))


def http_handler(uri):
    """Resolves URLs like https://burrito.bible/schema/... to disk"""

    assert uri.startswith(schema_uri_prefix)
    path = uri[len(schema_uri_prefix):].replace('/', os.sep)
    path = os.path.join(schema_dir, path)
    return json.load(open(path, encoding='utf-8'))


resolver = jsonschema.RefResolver(
    handlers={'http': http_handler, 'https': http_handler},
    referrer=schema,
    base_uri='file://' + schema_dir.replace('\\', '/') + '/',
)


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

    success = True

    for input in inputs:
        try:
            validate(input)
            print("{0}: No errors.".format(input.name))
        except Exception as ex:
            print("{0}: {1}".format(input.name, str(ex)))
            success = False

    if not success:
        sys.exit(1)
