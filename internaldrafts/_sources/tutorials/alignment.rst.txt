.. _tutorial-alignment:

##################
Alignment Tutorial
##################

[:ref:`Specification <alignment_flavor>`]  [:ref:`Example <examples-alignment>`]

This tutorial walks through creating a Scripture Burrito metadata file for a
word alignment project. By the end you will have a valid ``metadata.json`` and
understand the structure of the alignment content files it describes.

**Scenario:** The Zarma translation team (from :ref:`tutorial-textTranslation`)
wants to publish word alignments between their Zarma New Testament and the
SBL Greek New Testament (SBLGNT). An automatic aligner has produced one
JSON alignment file per book. We want to package these as an alignment burrito.

The directory looks like this::

   zarma-alignment/
       alignments/
           40MAT-dje-sblgnt.json
           41MRK-dje-sblgnt.json
           43JHN-dje-sblgnt.json
           44ACT-dje-sblgnt.json

We will build the ``metadata.json`` file section by section.

=====================
1. Format and meta
=====================

Every burrito begins the same way::

   {
     "format": "scripture burrito",
     "meta": {
       "version": "1.0.0",
       "category": "source",
       "generator": {
         "softwareName": "AutoAligner",
         "softwareVersion": "1.0.0",
         "userName": "Fatima Maïga"
       },
       "defaultLocale": "en",
       "dateCreated": "2025-11-05T10:00:00+01:00"
     },

==========================
2. Identification section
==========================

Name the project so tools and people can identify it::

     "identification": {
       "name": {
         "en": "Zarma NT — SBLGNT Word Alignment"
       },
       "description": {
         "en": "Word-level alignment of the Zarma New Testament against the SBLGNT"
       },
       "abbreviation": {
         "en": "ZJNT-SBLGNT-align"
       }
     },

=====================
3. Languages section
=====================

An alignment burrito typically involves two languages. List both::

     "languages": [
       {
         "tag": "dje",
         "name": {"en": "Zarma"}
       },
       {
         "tag": "grc",
         "name": {"en": "Ancient Greek"}
       }
     ],

===============
4. Type section
===============

The ``type`` section declares this as an alignment burrito::

     "type": {
       "flavorType": {
         "name": "alignment",
         "flavor": {
           "name": "alignment"
         }
       }
     },

* ``flavorType.name`` is ``"alignment"`` — this is what distinguishes an
  alignment burrito from a text translation or audio burrito.
* ``flavor.name`` is also ``"alignment"``.
* Unlike scripture burritos, ``currentScope`` is not required — the alignment
  files themselves record which references are covered.

===================
5. Agencies section
===================

::

     "agencies": [
       {
         "id": "https://seedcompany.com",
         "roles": ["rightsHolder", "content"],
         "url": "https://seedcompany.com",
         "name": {"en": "Seed Company"},
         "abbr": {"en": "SC"}
       }
     ],

======================
6. Ingredients section
======================

Each alignment file is listed as an ingredient::

     "ingredients": {
       "alignments/40MAT-dje-sblgnt.json": {
         "checksum": {"md5": "a1b2c3d4e5f60001..."},
         "mimeType": "application/json",
         "size": 184200,
         "scope": {"MAT": []}
       },
       "alignments/41MRK-dje-sblgnt.json": {
         "checksum": {"md5": "a1b2c3d4e5f60002..."},
         "mimeType": "application/json",
         "size": 112500,
         "scope": {"MRK": []}
       },
       "alignments/43JHN-dje-sblgnt.json": {
         "checksum": {"md5": "a1b2c3d4e5f60003..."},
         "mimeType": "application/json",
         "size": 161800,
         "scope": {"JHN": []}
       },
       "alignments/44ACT-dje-sblgnt.json": {
         "checksum": {"md5": "a1b2c3d4e5f60004..."},
         "mimeType": "application/json",
         "size": 245600,
         "scope": {"ACT": []}
       }
     }

* ``mimeType`` is ``application/json`` for all alignment files.
* ``scope`` records which book each file covers. This is the same book-scope
  pattern used in text translation ingredients.

=========================================
7. Structure of an alignment content file
=========================================

The ingredient files follow the
`Scripture Burrito Alignment Format <https://github.com/bible-technology/alignment-spec>`_.
Here is an excerpt from ``40MAT-dje-sblgnt.json`` showing alignment records for
Matthew 6:9::

   {
     "format": "alignment",
     "version": "0.4",
     "groups": [
       {
         "type": "translation",
         "meta": {
           "creator": "AutoAligner/1.0.0",
           "timestamp": "2025-11-05T10:00:00Z"
         },
         "documents": [
           {"scheme": "BCVWP", "docid": "SBLGNT"},
           {"scheme": "BCVWP", "docid": "ZarmaNT"}
         ],
         "roles": ["source", "target"],
         "records": [
           {
             "references": [["400060090011"], ["400060090011"]],
             "meta": {"confidence": 0.97}
           },
           {
             "references": [["400060090021"], ["400060090021", "400060090031"]],
             "meta": {"confidence": 0.88}
           }
         ]
       }
     ]
   }

Key points:

* ``format`` and ``version`` identify this as an alignment format file.
* Each ``group`` collects related alignment records. Here the type is
  ``"translation"`` and the roles are ``"source"`` (Greek) and ``"target"``
  (Zarma).
* ``documents`` hoists the reference scheme and document identifiers so they
  do not have to be repeated in every record. The ``BCVWP`` scheme identifies
  words by a 12-character ``BBCCCVVVWWWP`` string (book, chapter, verse, word,
  part). ``400060090011`` is Matthew 6:9, word 1, part 1.
* ``roles`` hoists the role names so each ``references`` array is positional:
  ``references[0]`` is the source unit, ``references[1]`` is the target unit.
* A reference unit with two selectors (``["400060090021", "400060090031"]``)
  means that Greek word 2 aligns to the combination of Zarma words 2 and 3 —
  a one-to-many mapping.
* ``meta.confidence`` records the aligner's confidence for each record.
  Individual records can add or override metadata hoisted from the group.

=======================
8. The complete file
=======================

Putting the metadata together::

   {
     "format": "scripture burrito",
     "meta": {
       "version": "1.0.0",
       "category": "source",
       "generator": {
         "softwareName": "AutoAligner",
         "softwareVersion": "1.0.0",
         "userName": "Fatima Maïga"
       },
       "defaultLocale": "en",
       "dateCreated": "2025-11-05T10:00:00+01:00"
     },
     "identification": {
       "name": {
         "en": "Zarma NT — SBLGNT Word Alignment"
       },
       "description": {
         "en": "Word-level alignment of the Zarma New Testament against the SBLGNT"
       },
       "abbreviation": {
         "en": "ZJNT-SBLGNT-align"
       }
     },
     "languages": [
       {
         "tag": "dje",
         "name": {"en": "Zarma"}
       },
       {
         "tag": "grc",
         "name": {"en": "Ancient Greek"}
       }
     ],
     "type": {
       "flavorType": {
         "name": "alignment",
         "flavor": {
           "name": "alignment"
         }
       }
     },
     "agencies": [
       {
         "id": "https://seedcompany.com",
         "roles": ["rightsHolder", "content"],
         "url": "https://seedcompany.com",
         "name": {"en": "Seed Company"},
         "abbr": {"en": "SC"}
       }
     ],
     "ingredients": {
       "alignments/40MAT-dje-sblgnt.json": {
         "checksum": {"md5": "a1b2c3d4e5f60001..."},
         "mimeType": "application/json",
         "size": 184200,
         "scope": {"MAT": []}
       },
       "alignments/41MRK-dje-sblgnt.json": {
         "checksum": {"md5": "a1b2c3d4e5f60002..."},
         "mimeType": "application/json",
         "size": 112500,
         "scope": {"MRK": []}
       },
       "alignments/43JHN-dje-sblgnt.json": {
         "checksum": {"md5": "a1b2c3d4e5f60003..."},
         "mimeType": "application/json",
         "size": 161800,
         "scope": {"JHN": []}
       },
       "alignments/44ACT-dje-sblgnt.json": {
         "checksum": {"md5": "a1b2c3d4e5f60004..."},
         "mimeType": "application/json",
         "size": 245600,
         "scope": {"ACT": []}
       }
     }
   }

==============
Next steps
==============

* Add a ``relationships`` section to link this alignment burrito to the Zarma
  text translation burrito it was produced from — use ``"relationType": "source"``.
* To record which alignments were manually reviewed, add per-record metadata
  in the alignment content files (e.g. ``"meta": {"curated": true}``).
* For the alignment content file format reference, see the
  `Scripture Burrito Alignment Format specification <https://github.com/bible-technology/alignment-spec>`_.
* For the complete metadata field reference see :ref:`alignment_flavor`.
