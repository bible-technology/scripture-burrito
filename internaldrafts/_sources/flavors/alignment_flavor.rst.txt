.. _alignment_flavor:

#########################
Alignment Specification
#########################

[:ref:`Tutorial: Word Alignment <tutorial-alignment>`]  [:ref:`Tutorial: Audio–Text Alignment <tutorial-audioAlignment>`]  [:ref:`Example: Word Alignment <examples-alignment>`]  [:ref:`Example: Audio–Text Alignment <examples-audioAlignment>`]

This page covers fields specific to the Alignment flavor. For fields common to all burritos see :ref:`burrito-structure`.

An alignment burrito contains word-level or timecode-level alignment data
between two texts or between audio and text. Content files follow the
`Scripture Burrito Alignment Format <https://github.com/bible-technology/alignment-spec>`_.

===========
Type Fields
===========

``type.flavorType.name``
    MUST be ``"alignment"``.

``type.flavorType.flavor.name``
    MUST be ``"alignment"``.

``type.flavorType.currentScope``
    OPTIONAL. If present, keys MUST be valid USFM book codes and values
    MUST be arrays of chapter strings or an empty array meaning the whole
    book.

============
Ingredients
============

At least one alignment ingredient MUST be present. Alignment ingredients
MUST use ``"mimeType": "application/json"``.

Alignment ingredients SHOULD include a ``scope`` indicating which Scripture
content they cover.

Each alignment ingredient MUST be a valid alignment format file. A valid
alignment format file:

* MUST have ``"format": "alignment"``
* MUST have ``"version": "0.4"``
* MUST have a ``"groups"`` array
* Within each group, every record MUST have either a ``"references"`` array
  or named role keys (e.g. ``"source"`` and ``"target"``)
* Reference units MUST be lists of string selectors when ``scheme`` is
  hoisted to the group's ``documents`` array; otherwise they MUST be objects
  with ``scheme``, ``docid``, and ``selectors``

===============
Alignment Types
===============

The alignment format is extensible. The following alignment types are defined
in the specification and MAY be used:

* ``"translation"`` — target is a translation of source;
  roles: ``"source"``, ``"target"``
* ``"audio-reference"`` — maps audio timecodes to text references;
  roles: ``"timecode"``, ``"text-reference"``
* ``"related"`` — generic undirected relationship; no roles
* ``"directed"`` — generic directed relationship; roles: ``"from"``, ``"to"``

Custom alignment types MAY be used; they SHOULD be prefixed with ``"x-"``.

=================
Reference Schemes
=================

The alignment format is extensible. The following reference schemes MAY be
used:

* ``"BCVWP"`` — word-level biblical reference using a 12-character
  ``BBCCCVVVWWWP`` string (book, chapter, verse, word, part)
* ``"vtt-timecode"`` — WebVTT timecode range ``"MM:SS.mmm --> MM:SS.mmm"``;
  ``docid`` is the audio filename
* ``"u23003"`` — scripture reference with sub-verse granularity; ``docid``
  is embedded in the selector (e.g. ``"en+ulb.EPH 1:1"``)
* ``"ws-token"`` — whitespace-tokenised offset; ``docid`` is the filename
* ``"nfc-char"`` — Unicode NFC character offset range; ``docid`` is the
  filename

Custom reference schemes MAY be used.
