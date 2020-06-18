master:[![Documentation Status](https://readthedocs.org/projects/scripture-burrito/badge/?version=latest)](https://docs.burrito.bible/en/latest/?badge=latest)
![CI](https://github.com/bible-technology/scripture-burrito/workflows/CI/badge.svg?branch=master)

develop:[![Documentation Status](https://readthedocs.org/projects/scripture-burrito/badge/?version=develop)](https://docs.burrito.bible/en/latest/?badge=develop)
![CI](https://github.com/bible-technology/scripture-burrito/workflows/CI/badge.svg?branch=develop)

# Scripture Burrito Documentation

A data interchange format for Bible-centric content.
  
See https://docs.burrito.bible/ (or https://scripture-burrito.readthedocs.io/) for the documentation, this repo is the source files.

If you want to suggest a change, please fork this repo and create a PR, or create an Issue.

## Building

Install the sphinx engine

    sudo apt-get install python-sphinx
    pip install sphinx-jsonschema

Then run the build script from the docs/ directory.

> NOTE: this top level makefile is just a shorcut to building the html.

    make

## Documentation Format

The docs are written in [reStructuredText](http://www.sphinx-doc.org/en/master/rest.html), processed by [Sphinx](http://www.sphinx-doc.org/en/master/index.html), and hosted online by [Read the Docs](https://readthedocs.org/).

See the [reStructuredText Primer](http://www.sphinx-doc.org/en/master/rest.html) and the [Docutils reStructuredText Directives](http://docutils.sourceforge.net/docs/ref/rst/directives.html) documentation to learn how to use the syntax.

## Schema Documentation

The specific schema documentation is generated from the schema itself using [sphinx-jsonschema](https://sphinx-jsonschema.readthedocs.io/en/latest/). Take special care to define the `title` and `description` attributes well as they will be the primary method of documentation for the specification. Also, wherever possible, include `examples` as that aids in comprehension.

One special note, any section that needs to be linked to from another section should have a special `$$target` attribute as well as a `title` attribute for sphinx-jsonschema to work properly.

Also, note that there is a script which automatically takes the schema and creates the `.rst` files for Sphinx to process. This should be done anytime changes are made to the schema (and should probably be part of the sphinx builder).

    cd docs/schema_docs
    ./gen_schema_docs.sh

A similar script is used for the examples.

    cd docs/examples
    ./gen_example_docs.sh

## Validation

### Scripted

An [automated Github Action](https://github.com/bible-technology/scripture-burrito/blob/jag3773-patch-1/.github/workflows/main.yml) runs on each push that validates the metadata samples. This uses both a Python and JavaScript utility included in `code/` to validate JSON documents against the schema. You can run these locally as well.

The Python script requires `jsonschema` (run `pip install jsonschema`)  and may be run as follows:

    python code/validate.py docs/examples/artifacts/*.json

The JavaScript scriptt requires `node` and `ajv` to run.

    npm install ajv
    node code/validate.js metadata docs/examples/artifacts/*.json

### For Real Time Editing

The VS Code [documentation](https://code.visualstudio.com/docs/languages/json#_json-schemas-and-settings) explains how to setup VS Code for real time validation of JSON files using a schema.

In short, create a `.vscode/settings.json` file in your `scripture-burrito` working directory with the following:

```
{
    "json.schemas": [
        {
            "fileMatch": [
                "*.json"
            ],
            "url": "file:///Users/jesse/vcs/scripture-burrito/schema/metadata.schema.json"
        }
    ]
}
```

Of course, use the actual local path on *your system* for `metadata.schema.json`.

To test, open up `schema/scriptureText.json` and make something invalid, and see the result, like this:
![image](https://user-images.githubusercontent.com/194842/71215968-6ced3300-22b9-11ea-95a7-ca84de8287da.png)
