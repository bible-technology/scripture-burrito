.. _custom_flavors:

############################
Custom Flavors Specification
############################

[:ref:`Example <examples-xScripture>`]

The ``x-`` prefix allows tools to define custom flavor names and ingredient
roles without conflicting with standard Scripture Burrito names. Tools
encountering an unrecognised ``x-`` value SHOULD treat it as unknown content
but MUST NOT reject the burrito solely on that basis.

====================
Custom Flavor Names
====================

``type.flavorType.flavor.name``
    A custom flavor name MUST start with ``"x-"`` followed by a lowercase
    letter and zero or more alphanumeric characters.
    Pattern: ``^x-[a-z][a-zA-Z0-9]*$``

    A custom flavor MUST still declare a valid ``type.flavorType.name``
    (e.g. ``"scripture"``, ``"parascriptural"``).

    The ``flavor`` object of a custom flavor MAY include any additional
    properties beyond ``name``; the schema does not restrict them.

Example::

    "type": {
      "flavorType": {
        "name": "scripture",
        "flavor": {
          "name": "x-signLanguageVideo",
          "videoFormat": "mp4"
        },
        "currentScope": { "MAT": [] }
      }
    }

=======================
Custom Ingredient Roles
=======================

Standard ingredient roles are defined by the Scripture Burrito schema. A
custom ingredient role MUST be prefixed with ``"x-"`` followed by at least
one non-whitespace character.
Pattern: ``^x-\S.*\S$``

Example::

    "ingredients/mat-signs.mp4": {
      "mimeType": "video/mp4",
      "size": 524288000,
      "scope": {"MAT": []},
      "role": "x-signLanguage"
    }

================================
Relationships to Custom Flavors
================================

The ``flavor`` field in a ``relationships`` entry MAY use an ``x-`` prefixed
name to reference a custom-flavor burrito.

======================
Proposing a New Flavor
======================

If a custom flavor proves broadly useful, it can be proposed as a standard
flavor by opening an issue in the Scripture Burrito repository:
https://github.com/bible-technology/scripture-burrito/issues
