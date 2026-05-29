.. _tutorial-audioAlignment:

#############################
Audio–Text Alignment Tutorial
#############################

[:ref:`Specification <alignment_flavor>`]  [:ref:`Example <examples-audioAlignment>`]

This tutorial walks through creating an alignment burrito that synchronises an
audio recording with a text translation. By the end you will understand how
audio timecodes and scripture text references are aligned, and how to package
that data as a Scripture Burrito.

**Scenario:** A team has produced an audio recording of Ephesians
(``ephesians.mp3``) read from the English ULB. They want to publish an
alignment file that maps every timecode range in the recording to the
corresponding scripture element — verses, section headings, footnotes — so
that tools can synchronise audio playback with text display, or let listeners
jump to a specific verse.

The directory looks like this::

   ephesians-audio-alignment/
       alignments/
           ephesians-audio-text.json

===================
1. Format and meta
===================

::

   {
     "format": "scripture burrito",
     "meta": {
       "version": "1.0.0",
       "category": "source",
       "generator": {
         "softwareName": "AudioAligner",
         "softwareVersion": "1.2.0"
       },
       "defaultLocale": "en",
       "dateCreated": "2025-11-10T08:00:00Z"
     },

==========================
2. Identification section
==========================

::

     "identification": {
       "name": {
         "en": "Ephesians Audio–Text Alignment"
       },
       "description": {
         "en": "Timecode alignment of Ephesians ULB audio recording to scripture text references"
       }
     },

=====================
3. Languages section
=====================

::

     "languages": [
       {
         "tag": "en",
         "name": {"en": "English"}
       }
     ],

===============
4. Type section
===============

::

     "type": {
       "flavorType": {
         "name": "alignment",
         "flavor": {
           "name": "alignment"
         }
       }
     },

====================
5. Agencies section
====================

::

     "agencies": [
       {
         "id": "https://www.unfoldingword.org",
         "roles": ["rightsHolder", "content"],
         "url": "https://www.unfoldingword.org",
         "name": {"en": "unfoldingWord"},
         "abbr": {"en": "uW"}
       }
     ],

======================
6. Ingredients section
======================

The alignment file is the only ingredient::

     "ingredients": {
       "alignments/ephesians-audio-text.json": {
         "checksum": {"md5": "a1b2c3d4e5f60001..."},
         "mimeType": "application/json",
         "size": 8400,
         "scope": {"EPH": []}
       }
     }

Note that the audio file itself (``ephesians.mp3``) is not an ingredient of
this burrito — it belongs to a separate audio translation burrito. This
alignment burrito links the two together.

==========================================
7. Structure of the alignment content file
==========================================

The file ``ephesians-audio-text.json`` follows the alignment format. The
alignment type here is ``audio-reference``, with roles ``timecode`` (source)
and ``text-reference`` (target)::

   {
     "format": "alignment",
     "version": "0.4",
     "groups": [
       {
         "type": "audio-reference",
         "documents": [
           {"scheme": "vtt-timecode", "docid": "ephesians.mp3"},
           {"scheme": "u23003"}
         ],
         "roles": ["timecode", "text-reference"],
         "records": [
           {"references": [["00:00.000 --> 00:01.927"], ["en+ulb.EPH:0"]]},
           {"references": [["00:01.927 --> 00:03.756"], ["en+ulb.EPH 1:0"]]},
           {"references": [["00:03.756 --> 04:23.239"], ["en+ulb.EPH 1"]]},
           {"references": [["00:03.756 --> 00:05.604"], ["en+ulb.EPH 1:1!s1"]]},
           {"references": [["00:05.604 --> 00:08.289"], ["en+ulb.EPH 1:1:0"]]},
           {"references": [["00:08.289 --> 00:16.671"], ["en+ulb.EPH 1:1"]]},
           {"references": [["00:16.671 --> 00:28.805"], ["en+ulb.EPH 1:1!f"]]},
           {"references": [["00:28.805 --> 00:30.943"], ["en+ulb.EPH 1:2:0"]]},
           {"references": [["00:30.943 --> 00:35.558"], ["en+ulb.EPH 1:2"]]}
         ]
       }
     ]
   }

**Reference schemes**

``vtt-timecode``
    A timecode range in `WebVTT <https://www.w3.org/TR/webvtt1/>`_ format:
    ``"MM:SS.mmm --> MM:SS.mmm"``. The ``docid`` is the audio filename. Each
    record maps a span of the recording to a scripture element.

``u23003``
    A scripture reference scheme with sub-verse granularity. The selector
    embeds both the document identity and the scripture address:

    .. list-table::
       :header-rows: 1
       :widths: 40 60

       * - Selector
         - Meaning
       * - ``en+ulb.EPH:0``
         - Book header / title of Ephesians
       * - ``en+ulb.EPH 1:0``
         - Chapter 1 heading
       * - ``en+ulb.EPH 1``
         - All of chapter 1 (span record)
       * - ``en+ulb.EPH 1:1!s1``
         - Section heading before verse 1:1
       * - ``en+ulb.EPH 1:1:0``
         - Verse number label for 1:1
       * - ``en+ulb.EPH 1:1``
         - Body text of verse 1:1
       * - ``en+ulb.EPH 1:1!f``
         - Footnote associated with verse 1:1

**Overlapping timecodes**

Notice that some timecode ranges overlap. ``00:03.756 --> 04:23.239`` covers
the whole of chapter 1 while the records that follow cover individual verses
within it. This is intentional: the alignment is a hypergraph, not a flat
sequence. Tools can query at different granularities — "which chapter is
playing?" and "which verse is playing?" are both answerable from the same file.

=======================
8. The complete file
=======================

::

   {
     "format": "scripture burrito",
     "meta": {
       "version": "1.0.0",
       "category": "source",
       "generator": {
         "softwareName": "AudioAligner",
         "softwareVersion": "1.2.0"
       },
       "defaultLocale": "en",
       "dateCreated": "2025-11-10T08:00:00Z"
     },
     "identification": {
       "name": {
         "en": "Ephesians Audio–Text Alignment"
       },
       "description": {
         "en": "Timecode alignment of Ephesians ULB audio recording to scripture text references"
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
         "name": "alignment",
         "flavor": {
           "name": "alignment"
         }
       }
     },
     "agencies": [
       {
         "id": "https://www.unfoldingword.org",
         "roles": ["rightsHolder", "content"],
         "url": "https://www.unfoldingword.org",
         "name": {"en": "unfoldingWord"},
         "abbr": {"en": "uW"}
       }
     ],
     "ingredients": {
       "alignments/ephesians-audio-text.json": {
         "checksum": {"md5": "a1b2c3d4e5f60001..."},
         "mimeType": "application/json",
         "size": 8400,
         "scope": {"EPH": []}
       }
     }
   }

==============
Next steps
==============

* Add a ``relationships`` section to link this alignment burrito to the audio
  translation burrito containing ``ephesians.mp3`` and to the text burrito
  containing the ULB.
* Multiple alignment groups can coexist in one file — for example, a second
  group could align the same timecodes to a different translation of the same
  passage.
* For the alignment content file format reference, see the
  `Scripture Burrito Alignment Format specification <https://github.com/bible-technology/alignment-spec>`_.
* For the complete metadata field reference see :ref:`alignment_flavor`.
