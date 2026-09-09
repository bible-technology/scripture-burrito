Scripture Burrito Wrapper Specification
=====================================

1. Introduction
----------------

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

The wrapper is represented by a ``wrapper.json`` file located at the root
of the wrapper package.


2. Wrapper Structure
--------------------

A wrapper MUST contain the following top-level properties:

* ``format``
* ``meta``
* ``contents``

The ``format`` property MUST have the value::

    "format": "scripture burrito wrapper"

The ``meta`` property contains metadata describing the wrapper itself.

The ``contents`` property identifies the Scripture Burritos contained
within the wrapper.


2.1 Meta
~~~~~~~~

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


2.2 Contents
~~~~~~~~~~~~

The ``contents`` object MUST contain a ``burritos`` array.

Each entry identifies one Scripture Burrito contained within the wrapper.

For example::

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

The ``burritos`` array MUST contain at least one entry. Each entry MUST
contain:

* ``id``
* ``path``
* ``role``

The ``path`` is relative to the directory containing ``wrapper.json``.


2.3 Contained Burritos
~~~~~~~~~~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~

The ``role`` property describes the relationship of a contained burrito
to the other burritos in the wrapper.

The standard roles are:

+----------------+--------------------------------------------------------------+
| Role           | Description                                                  |
+================+==============================================================+
| ``source``     | Primary, editable content                                    |
+----------------+--------------------------------------------------------------+
| ``derived``    | Content produced from another burrito                         |
+----------------+--------------------------------------------------------------+
| ``supplemental`` | Supporting material that is not itself the primary         |
|                | Scripture deliverable                                         |
+----------------+--------------------------------------------------------------+

Custom roles MAY be used where supported by the Scripture Burrito
specification. Custom roles SHOULD begin with ``x-``.

The role is a property of the relationship within the wrapper and does
not determine the flavour of the contained burrito.


2.5 Supporting Multiple Flavours
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A wrapper MAY contain any combination of supported Scripture Burrito
flavours.

For example, an audio Scripture project could contain:

* ``audioTranslation``
* ``textTranslation``
* ``intellectualProperty``
* ``apmData``

The wrapper therefore provides a mechanism for grouping related Scripture
Burritos without requiring the individual flavours to be merged into a
single burrito.

The flavour of each contained burrito is determined by its own
``metadata.json``.

For example::

    {
      "id": "SEHSAM-audio",
      "path": "audio",
      "role": "source"
    }

The flavour of this burrito is determined by::

    audio/metadata.json

Similarly::

    {
      "id": "SEHSAM-text",
      "path": "text",
      "role": "derived"
    }

gets its flavour from::

    text/metadata.json

This separation allows each flavour to evolve independently while still
allowing related resources to be distributed together.


2.6 Example
~~~~~~~~~~~

The following example demonstrates a wrapper containing audio, text,
APM data, and intellectual property burritos::

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


2.7 Wrapper Flavour Independence
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A wrapper MUST NOT make assumptions about the flavour of a contained
burrito. The flavour MUST be determined from the metadata of the
contained burrito.

A wrapper MAY contain multiple burritos of the same flavour or burritos
of different flavours.

This allows the wrapper to group related resources while keeping each
Scripture Burrito flavour independently defined and validated.


2.8 Additional Examples
~~~~~~~~~~~~~~~~~~~~~~~

Additional examples and sample Scripture Burrito audio translation
packages can be found in the ``sb_audioTranslation`` GitHub repository::

    https://github.com/bible-technology/sb_audioTranslation
