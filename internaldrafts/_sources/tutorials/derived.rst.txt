.. _tutorial-derived:

########################
Derived Burrito Tutorial
########################

[:ref:`Specification <derived_flavor>`]  [:ref:`Example <examples-textTranslation_derived>`]

This tutorial walks through creating a derived burrito — a burrito produced
from an existing burrito rather than created directly. The example is an
English back-translation of Matthew produced from the Zarma New Testament.

**Scenario:** A translation consultant needs an English back-translation of
Matthew to check the Zarma text. The Zarma NT is already registered in the
Digital Bible Library as ``a3f9c12e887b4d01``. The back-translation lives in
a directory called ``zarma-nt-bt/``::

    zarma-nt-bt/
        ingredients/
            40MATBACKTR.SFM
        metadata.json

==========
1. Format
==========

The ``format`` field is the same for all burritos::

    {
      "format": "scripture burrito",

==================
2. Meta: category
==================

The key difference from a source burrito is ``meta.category``::

      "meta": {
        "version": "1.0.0",
        "category": "derived",
        "generator": {
          "softwareName": "MyTranslationTool",
          "softwareVersion": "2.3.1",
          "userName": "David Okonkwo"
        },
        "defaultLocale": "en",
        "dateCreated": "2025-11-20T14:00:00+01:00",
        "normalization": "NFC"
      },

Setting ``category`` to ``"derived"`` tells consuming tools that this burrito
was produced from another. A tool that receives an update to the source Zarma
NT can flag that this back-translation may need to be regenerated.

================================
3. Identification and upstream
================================

The ``identification.upstream`` field records which external burrito this was
derived from. Its structure mirrors ``identification.primary``: keys are
authority names from ``idAuthorities``, values are arrays of source identifiers::

      "idAuthorities": {
        "dbl": {
          "id": "https://thedigitalbiblelibrary.org",
          "name": {"en": "The Digital Bible Library"}
        }
      },
      "identification": {
        "name": {
          "en": "Back-Translation of the Zarma New Testament (Matthew)"
        },
        "description": {
          "en": "English back-translation of Zarma Matthew for consultant checking"
        },
        "abbreviation": {"en": "ZJNT-BT"},
        "upstream": {
          "dbl": [
            {
              "a3f9c12e887b4d01": {
                "revision": "1",
                "timestamp": "2025-11-04T09:00:00+01:00"
              }
            }
          ]
        }
      },

* ``upstream`` is optional if the source is not registered in an external
  authority. In that case use ``relationships`` (see step 7).

=====================
4. Languages
=====================

A back-translation is typically in the consultant's language::

      "languages": [
        {
          "tag": "en",
          "name": {"en": "English"}
        }
      ],

===========
5. Type
===========

The type section uses the same flavor as the source but sets ``projectType``
to ``"backTranslation"``::

      "type": {
        "flavorType": {
          "name": "scripture",
          "flavor": {
            "name": "textTranslation",
            "usfmVersion": "3.1",
            "translationType": "newTranslation",
            "audience": "basic",
            "projectType": "backTranslation"
          },
          "currentScope": {
            "MAT": []
          }
        }
      },

* ``projectType: "backTranslation"`` — signals that this is a back-translation
  for checking, not an independent translation.
* ``audience: "basic"`` — back-translations are typically simplified prose.
* ``translationType: "newTranslation"`` — it is a fresh rendering, not a
  revision of an existing English text.

==============
6. Agencies
==============

::

      "agencies": [
        {
          "id": "https://seedcompany.com",
          "roles": ["content"],
          "url": "https://seedcompany.com",
          "name": {"en": "Seed Company"},
          "abbr": {"en": "SC"}
        }
      ],

================
7. Ingredients
================

The back-translation file is listed the same way as any other text
ingredient::

      "ingredients": {
        "ingredients/40MATBACKTR.SFM": {
          "checksum": {"md5": "c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8"},
          "mimeType": "text/x-usfm",
          "size": 98000,
          "scope": {"MAT": []}
        }
      },

==================
8. Relationships
==================

The ``relationships`` array formally declares the link to the source burrito.
This complements ``identification.upstream`` and is useful even when the source
is not registered externally, because it lets any tool follow the provenance::

      "relationships": [
        {
          "relationType": "source",
          "flavor": "textTranslation",
          "id": "dbl::a3f9c12e887b4d01",
          "revision": "1"
        }
      ]

* ``relationType: "source"`` — the related burrito is the original from which
  this back-translation was produced.
* ``flavor`` — the flavor of the source burrito.
* ``id`` — prefixed with the ``dbl`` authority declared in ``idAuthorities``.

======================
9. The complete file
======================

Putting it all together::

    {
      "format": "scripture burrito",
      "meta": {
        "version": "1.0.0",
        "category": "derived",
        "generator": {
          "softwareName": "MyTranslationTool",
          "softwareVersion": "2.3.1",
          "userName": "David Okonkwo"
        },
        "defaultLocale": "en",
        "dateCreated": "2025-11-20T14:00:00+01:00",
        "normalization": "NFC"
      },
      "idAuthorities": {
        "dbl": {
          "id": "https://thedigitalbiblelibrary.org",
          "name": {"en": "The Digital Bible Library"}
        }
      },
      "identification": {
        "name": {
          "en": "Back-Translation of the Zarma New Testament (Matthew)"
        },
        "description": {
          "en": "English back-translation of Zarma Matthew for consultant checking"
        },
        "abbreviation": {"en": "ZJNT-BT"},
        "upstream": {
          "dbl": [
            {
              "a3f9c12e887b4d01": {
                "revision": "1",
                "timestamp": "2025-11-04T09:00:00+01:00"
              }
            }
          ]
        }
      },
      "languages": [
        {
          "tag": "en",
          "name": {"en": "English"}
        }
      ],
      "type": {
        "flavorType": {
          "name": "scripture",
          "flavor": {
            "name": "textTranslation",
            "usfmVersion": "3.1",
            "translationType": "newTranslation",
            "audience": "basic",
            "projectType": "backTranslation"
          },
          "currentScope": {
            "MAT": []
          }
        }
      },
      "agencies": [
        {
          "id": "https://seedcompany.com",
          "roles": ["content"],
          "url": "https://seedcompany.com",
          "name": {"en": "Seed Company"},
          "abbr": {"en": "SC"}
        }
      ],
      "ingredients": {
        "ingredients/40MATBACKTR.SFM": {
          "checksum": {"md5": "c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8"},
          "mimeType": "text/x-usfm",
          "size": 98000,
          "scope": {"MAT": []}
        }
      },
      "relationships": [
        {
          "relationType": "source",
          "flavor": "textTranslation",
          "id": "dbl::a3f9c12e887b4d01",
          "revision": "1"
        }
      ]
    }

=============
Next steps
=============

* Add more books to ``currentScope`` and ``ingredients`` as the back-translation
  grows.
* If the source Zarma NT is updated, bump the ``revision`` in both
  ``upstream`` and ``relationships`` to track which version you are working from.
* For the complete field reference see :ref:`derived_flavor`.
* For creating a custom flavor (e.g. sign-language video) see :ref:`custom_flavors`.
