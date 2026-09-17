.. _wrapper_flavor:

########################################
Scripture Burrito Wrapper Specification
########################################


Wrapper Flavor
==========================

Overview
------------

A Scripture Burrito Wrapper provides a way to group multiple related
Scripture Burritos into a single project or distribution. Each contained
burrito remains an independent, self-contained Scripture Burrito with its
own metadata and flavour.

A wrapper does not define or alter the flavour of the contained burritos.
Instead, it identifies the burritos that belong together and describes
their relationship to the overall project.

A wrapper can contain different Scripture Burrito flavours, allowing
related resources such as audio translations, text translations, project
management data, intellectual property information, and other supported
flavours to be distributed together.

The wrapper is represented by a `wrapper.json` file located at the root
of the wrapper package.

The following example shows a complete Scripture Burrito Wrapper and is
used to illustrate the various parts of this specification.

.. admonition:: Full Scripture Burrito Wrapper
   :class: example

   .. code-block:: json

      {
        "meta": {
          "name": {
            "en": "Sample Burrito Burrito Wrapper"
          },
          "version": "0.0.1",
          "generator": {
            "name": "Audio Project Manager Train",
            "version": "4.6.0.alpha.0"
          },
          "dateCreated": "2026-08-13",
          "description": {
            "en": "A new burrito wrapper for Sample Burrito"
          },
          "abbreviation": {
            "en": "SEHSAM"
          },
          "defaultLocale": "en"
        },
        "format": "scripture burrito wrapper",
        "contents": {
          "burritos": [
            {
              "id": "SEHSAM-aPMData",
              "path": "apmdata",
              "role": "supplemental"
            },
            {
              "id": "SEHSAM-text",
              "path": "text",
              "role": "derived"
            },
            {
              "id": "SEHSAM-audio",
              "path": "audio",
              "role": "source"
            },
            {
              "id": "SEHSAM-intellectualProperty",
              "path": "intellectualproperty",
              "role": "supplemental"
            }
          ]
        }
      }



Wrapper Structure
-----------------

A wrapper MUST contain the following top-level properties:

* `meta`
* `format`
* `contents`

The `meta` property contains metadata describing the wrapper itself.

The `format` property MUST have the value::

"format": "scripture burrito wrapper"

The `contents` property identifies the Scripture Burritos contained
within the wrapper.

2.1 Meta
------------

The ``meta`` object describes the wrapper and MUST contain:

* ``name``
* ``version``
* ``generator``
* ``dateCreated``

It MAY also contain:

* ``description``
* ``abbreviation``
* ``defaultLocale``

The metadata applies to the *wrapper*, rather than to the individual
burritos contained within it. Each contained burrito MUST provide its own
``metadata.json``.

2.1.1 Name
~~~~~~~~~~~~~~~~~~~~~~~~

The ``name`` property contains one or more localized names for the
wrapper.

The property is an object in which each property name is a language or
locale code, and the corresponding property value is the human-readable
name of the wrapper in that language or locale.

For example::

    "name": {
      "en": "Sample Burrito Burrito Wrapper"
    }

A wrapper MAY provide names in multiple languages or locales::

    "name": {
      "en": "Sample Scripture Project",
      "fr": "Projet biblique exemple"
    }

The language or locale codes SHOULD follow the conventions defined by
the Scripture Burrito specification.

2.1.2 Version
--------------

The ``version`` property identifies the version of the wrapper.

The value MUST be a string. The version applies to the wrapper itself and
does not determine the version of any contained Scripture Burritos.

For example::

    "version": "0.0.1"

2.1.3 Generator
---------------

The ``generator`` property identifies the software or process that
created the wrapper.

The ``generator`` object MUST contain:

* ``name``
* ``version``

For example::

    "generator": {
      "name": "Audio Project Manager Train",
      "version": "4.6.0.alpha.0"
    }

2.1.4 Date Created
--------------------

The ``dateCreated`` property identifies the date on which the wrapper
was created.

The value MUST be represented as a date in the format ``YYYY-MM-DD``.

For example::

    "dateCreated": "2026-08-13"

The ``dateCreated`` property applies to the wrapper itself and does not
necessarily represent the creation date of the contained burritos.

2.1.5 Description
--------------------

The optional ``description`` property provides a human-readable
description of the wrapper.

The description MAY be provided in multiple languages or locales.

For example::

    "description": {
      "en": "A new burrito wrapper for Sample Burrito"
    }

2.1.6 Abbreviation
-------------------

The optional ``abbreviation`` property provides a short name or
abbreviation for the wrapper.

The abbreviation MAY be provided in multiple languages or locales.

For example::

    "abbreviation": {
      "en": "SEHSAM"
    }

2.1.7 Default Locale
---------------------

The optional ``defaultLocale`` property identifies the default language
or locale to use when localized metadata is available.

For example::

    "defaultLocale": "en"

The value SHOULD correspond to a language or locale used by one or more
of the localized metadata properties.


2.2 Contents
------------

The `contents` object MUST contain a `burritos` array.

Each entry identifies one Scripture Burrito contained within the wrapper.


.. admonition:: Contents Example
   :class: example

   .. code-block:: json

      "contents": {
        "burritos": [
          {
            "id": "ENGSEB2-audio",
            "path": "audio",
            "role": "source"
          },
          {
            "id": "ENGSEB2-text",
            "path": "text",
            "role": "derived"
          }
        ]
      }


The `burritos` array MUST contain at least one entry. Each entry MUST
contain:

* `id`
* `path`
* `role`

The `path` is relative to the directory containing `wrapper.json`.

2.3 Contained Burritos
-----------------------

Each entry in ``contents.burritos`` MUST identify a valid Scripture
Burrito or another valid Scripture Burrito Wrapper.

The ``path`` is relative to the directory containing ``wrapper.json`` and
MUST identify the directory containing the burrito's ``metadata.json`` or,
in the case of a nested wrapper, its ``wrapper.json``.

Nested wrappers are permitted, but circular references MUST NOT occur.

The flavour of a contained burrito is determined by its own
``metadata.json``. The wrapper MUST NOT duplicate or override the flavour
information.

This allows a wrapper to contain burritos of different flavours.

For example::

    project/
    ├── wrapper.json
    ├── audio/
    │   └── metadata.json
    ├── text/
    │   └── metadata.json
    ├── apmdata/
    │   └── metadata.json
    └── intellectualproperty/
        └── metadata.json


2.4 Burrito Roles
------------------

The ``role`` property describes the relationship of a contained burrito
to the other burritos in the wrapper.

The standard roles are:

+-------------------+-----------------------------------------------------------+
| Role              | Description                                               |
+===================+===========================================================+
| ``source``        | Primary or source content.                                |
+-------------------+-----------------------------------------------------------+
| ``derived``       | Content produced from another burrito.                    |
+-------------------+-----------------------------------------------------------+
| ``supplemental``  | Supporting material that is not itself the primary        |
|                   | Scripture deliverable.                                    |
+-------------------+-----------------------------------------------------------+

Custom roles MAY be used where supported by the Scripture Burrito
specification. Custom roles SHOULD begin with ``x-``.

The role is a property of the relationship within the wrapper and does
not determine the flavour of the contained burrito.


2.5 Supporting Multiple Flavours
---------------------------------

A wrapper MAY contain any combination of supported Scripture Burrito
flavours.

For example, an audio Scripture project could contain:

* `audioTranslation`
* `textTranslation`
* `intellectualProperty`
* `apmData`

The wrapper therefore provides a mechanism for grouping related
Scripture Burritos without requiring the individual flavours to be
merged into a single burrito.

The flavour of each contained burrito is determined by its own
`metadata.json`.

.. admonition:: Multiple Flavors
   :class: example

   .. code-block:: json
      {
        "id": "SEHSAM-audio",
        "path": "audio",
        "role": "source"
      }


The flavour of this burrito is determined by:

audio/metadata.json



.. admonition:: Contained Burrito Example
   :class: example

   .. code-block:: json

      {
        "id": "SEHSAM-text",
        "path": "text",
        "role": "derived"
      }

gets its flavour from:

text/metadata.json


This separation allows each flavour to evolve independently while still
allowing related resources to be distributed together.

2.6 Wrapper and Contained Burrito Independence
------------------------------------------------

The wrapper and the contained Scripture Burritos have separate scopes.

The wrapper describes the collection of resources and the relationships
between them. It MUST NOT modify, override, or replace the metadata of a
contained burrito.

Each contained Scripture Burrito remains independently defined and
validated according to its own flavour specification.

For example, information describing an audio translation belongs in the
metadata of the audio Scripture Burrito, rather than being duplicated in
the wrapper.

The wrapper SHOULD contain only information that applies to the
collection as a whole or describes the relationship between the
contained resources.


2.7 Wrapper Flavour 
---------------------

A wrapper MUST NOT make assumptions about the flavour of a contained
burrito. The flavour MUST be determined from the metadata of the
contained burrito.

A wrapper MAY contain multiple burritos of the same flavour or burritos
of different flavours.

This allows the wrapper to group related resources while keeping each
Scripture Burrito flavour independently defined and validated.


2.8 Nested Wrappers
---------------------

A Scripture Burrito Wrapper MAY contain another Scripture Burrito
Wrapper.

A nested wrapper MUST itself be a valid Scripture Burrito Wrapper and
MUST contain its own ``wrapper.json``.

For example::

    project/
    ├── wrapper.json
    ├── translations/
    │   ├── wrapper.json
    │   ├── audio/
    │   │   └── metadata.json
    │   └── text/
    │       └── metadata.json
    └── supporting/
        └── wrapper.json

The ``path`` of a nested wrapper MUST identify the directory containing
the nested ``wrapper.json``.

A wrapper MUST NOT directly or indirectly contain itself. Circular
references between wrappers are not permitted.


2.9 Validation
------------------

A Scripture Burrito Wrapper MUST be independently valid according to
this specification.

Validation of a wrapper MUST verify that:

* ``wrapper.json`` exists at the root of the wrapper package.
* The ``format`` property has the value ``scripture burrito wrapper``.
* The required ``meta`` properties are present.
* The ``contents`` object contains a ``burritos`` array.
* The ``burritos`` array contains at least one entry.
* Each burrito entry contains ``id``, ``path``, and ``role``.
* Each ``path`` identifies a valid Scripture Burrito or Scripture Burrito
  Wrapper within the wrapper package.
* A contained Scripture Burrito contains its required ``metadata.json``.
* A contained Scripture Burrito Wrapper contains its required
  ``wrapper.json``.
* No circular references exist between nested wrappers.

Validation of each contained Scripture Burrito MUST be performed
according to the specification for that burrito's flavour.

The wrapper therefore provides a mechanism for validating the
relationship and structure of the collection, while the individual
burrito specifications remain responsible for validating the contents of
each burrito.


2.10 Additional Examples
-------------------------

Additional examples and sample Scripture Burrito audio translation
packages can be found in the ``sb_audioTranslation`` GitHub repository::

    https://github.com/bible-technology/sb_audioTranslation
