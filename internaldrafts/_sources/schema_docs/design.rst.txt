.. _schema_docs-design:

##############
Overall Design
##############

A Scripture Burrito is a ``metadata.json`` file together with the files it describes. The metadata file is the manifest: it tells software what every file in the project is, what format it uses, what part of Scripture it covers, and what role it plays. Without it, a directory of translation files is bewildering — no software has a starting point for understanding what it contains.

The metadata file must be named ``metadata.json`` and placed at the root of the burrito. All other files should be in the same directory or subdirectories. Large media files may be referenced by URL instead, but a burrito is a snapshot — maintaining external resources is out of scope.

Files must be encoded as UTF-8.

.. _schema_docs-design-toplevel:

Top-Level Structure
===================

A ``metadata.json`` has these top-level fields:

.. list-table::
   :header-rows: 1
   :widths: 20 80

   * - Field
     - Purpose
   * - ``format``
     - Always the string ``"scripture burrito"``
   * - ``meta``
     - Metadata about this metadata file: schema version, category, generator, timestamps
   * - ``idAuthorities``
     - External identifier systems used (e.g. the Digital Bible Library)
   * - ``identification``
     - Human-readable names, descriptions, abbreviations, and primary IDs
   * - ``type``
     - Flavor type and flavor — determines what kind of content this burrito contains
   * - ``languages``
     - Languages present in this burrito (BCP-47 tags)
   * - ``agencies``
     - Organizations involved: rights holders, content creators, etc.
   * - ``copyright``
     - Copyright statements
   * - ``ingredients``
     - The file manifest: every file with its size, checksum, MIME type, scope, and role
   * - ``confidential``
     - Boolean flag
   * - ``targetAreas``
     - Geographic codes indicating the intended audience
   * - ``localizedNames``
     - Localized display names for Scripture books
   * - ``relationships``
     - Optional links to upstream or derived burritos

.. _schema_docs-design-categories:

Categories
==========

Every burrito has a category, set in ``meta.category``:

* **source** — original content. Requires full metadata: identification, type, ingredients, agencies, copyright.
* **derived** — content processed from a source burrito (e.g. a published edition derived from a working translation).
* **template** — a skeleton burrito with no actual content, used to pre-populate settings for new projects.

The category drives which fields are required. A ``template`` can be minimal:

.. code-block:: json

   {
     "format": "scripture burrito",
     "meta": {
       "version": "1.0.0",
       "category": "template",
       "templateName": {"en": "New Testament Template"},
       "defaultLocale": "en",
       "dateCreated": "2024-01-01T00:00:00Z"
     },
     "copyright": {
       "shortStatements": [{"statement": "Public domain", "mimetype": "text/plain", "lang": "en"}]
     }
   }

A ``source`` burrito requires considerably more, including identification and at least one ingredient.

.. _schema_docs-design-type:

The Type Section
================

The ``type`` field determines the shape of the burrito. It contains a ``flavorType`` object with three fields:

* ``name`` — the flavor type (currently ``"scripture"`` for all defined flavors)
* ``flavor`` — an object whose ``name`` field identifies the specific flavor, with additional flavor-specific fields
* ``currentScope`` — which books (and optionally chapters/verses) are present

A Scripture Text burrito looks like this:

.. code-block:: json

   "type": {
     "flavorType": {
       "name": "scripture",
       "flavor": {
         "name": "textTranslation",
         "usfmVersion": "3.1",
         "translationType": "revision",
         "audience": "common",
         "projectType": "standard"
       },
       "currentScope": {
         "MAT": [],
         "MRK": [],
         "LUK": [],
         "JHN": []
       }
     }
   }

An empty array in ``currentScope`` means the entire book is present. To record a partial book, list the included verse ranges::

   "currentScope": {
     "GEN": ["1:1-11:26"],
     "PSA": ["1-50"]
   }

New flavors can be added using the ``x-`` extension mechanism without changing the core schema.

.. _schema_docs-design-ingredients:

Ingredients
===========

The ``ingredients`` object is the heart of the manifest. Each key is a relative path to a file; each value describes that file:

.. code-block:: json

   "ingredients": {
     "release/41MATNIV11.SFM": {
       "checksum": {"md5": "d18bbee39a1bc150decaac420c7f59da"},
       "mimeType": "text/x-usfm",
       "size": 160897,
       "scope": {"MAT": []}
     },
     "release/versification.json": {
       "checksum": {"md5": "a4c3b2e1f09d8c7b6a5e4d3c2b1a0f9e"},
       "mimeType": "application/json",
       "size": 27334,
       "role": "versification"
     },
     "release/en.ldml": {
       "checksum": {"md5": "b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7"},
       "mimeType": "application/xml",
       "size": 3492,
       "role": "localedata"
     }
   }

``size`` and ``mimeType`` are required for every ingredient. ``checksum`` is required for source burritos. ``scope`` identifies which Scripture content the file contains. ``role`` gives the file a semantic label (e.g. ``versification``, ``localedata``, ``styleSheet``).

.. _schema_docs-design-identification:

Identification
==============

The ``identification`` section gives the burrito a name and connects it to external identifier systems declared in ``idAuthorities``. The ``primary`` field records the burrito's canonical ID in one or more of those systems:

.. code-block:: json

   "idAuthorities": {
     "dbl": {
       "id": "https://thedigitalbiblelibrary.org",
       "name": {"en": "The Digital Bible Library"}
     }
   },
   "identification": {
     "primary": {
       "dbl": {
         "2880c78491b2f8ce": {
           "revision": "91",
           "timestamp": "2018-02-15T22:33:50.875547+00:00"
         }
       }
     },
     "name": {"en": "New Readers Version"},
     "description": {"en": "Simplified English New Testament"},
     "abbreviation": {"en": "NRV"}
   }

This design allows a burrito to carry IDs from multiple external systems simultaneously, supporting lossless roundtripping between ecosystems.
