.. _scripture_audio_flavor:

################################
Scripture Audio Specification
################################

[:ref:`Tutorial <tutorial-audioTranslation>`]  [:ref:`Example <examples-audioTranslation>`]

This page covers fields specific to the Scripture Audio flavor. For fields common to all burritos see :ref:`burrito-structure`.

A Scripture Audio burrito contains a recorded audio translation of Scripture.
Audio files may be organised per-chapter or per-verse-range and MAY be
accompanied by timing files that align timecodes to scripture references.

===========
Type Fields
===========

``type.flavorType.name``
    MUST be ``"scripture"``.

``type.flavorType.flavor.name``
    MUST be ``"audioTranslation"``.

``type.flavorType.flavor.performance``
    MUST be present. MUST be a non-empty array. The array MUST contain
    exactly one voice-type value and exactly one delivery-style value:

    * Voice type (exactly one MUST be present):

      * ``"singleVoice"`` — one reader throughout
      * ``"multipleVoice"`` — multiple readers

    * Delivery style (exactly one MUST be present):

      * ``"reading"`` — straight reading
      * ``"drama"`` — dramatized production

    The following values MAY also be included:

    * ``"withMusic"`` — background or incidental music is present
    * ``"withEffects"`` — sound effects are present
    * ``"withHeadings"`` — section headings are read aloud

``type.flavorType.flavor.formats``
    MUST be present. MUST be a non-empty object. Each key is an arbitrary
    label; each value MUST be a format descriptor with:

    * ``compression`` (REQUIRED): MUST be ``"mp3"`` or ``"wav"``
    * ``trackConfiguration`` (OPTIONAL): one of ``"1/0 (Mono)"``,
      ``"Dual mono"``, ``"2/0 (Stereo)"``, ``"5.1 Surround"``
    * ``bitRate`` (OPTIONAL): integer, bits per second
    * ``bitDepth`` (OPTIONAL): integer
    * ``samplingRate`` (OPTIONAL): integer, Hz

``type.flavorType.currentScope``
    MUST be present. Keys MUST be valid USFM book codes. Values are arrays
    of chapter numbers as strings (e.g. ``["1", "2", "3"]``); an empty
    array means all chapters are present.

============
Ingredients
============

**Audio files**

At least one audio ingredient MUST be present. Audio ingredients MUST use one
of the following MIME types:

* ``"audio/mpeg"`` — MP3
* ``"audio/ogg;codecs=opus"`` — OGG Opus
* ``"audio/wav"`` — WAV

Audio ingredients MUST include a ``scope``. Scope values are chapter strings
(e.g. ``["1"]``) for chapter-level recordings, or verse-range strings
(e.g. ``["1:1-21"]``) for finer-grained recordings.

Every book and chapter declared in ``currentScope`` MUST be covered by at
least one audio ingredient.

**Timing files**

Timing files are OPTIONAL but RECOMMENDED when verse-level navigation is
needed. A timing file MUST carry ``"role": "timing"`` and
``"mimeType": "application/json"``. It MUST carry a ``scope`` matching the
audio file it annotates.

Timing files MUST conform to the
`Scripture Burrito Alignment Format <https://github.com/bible-technology/alignment-spec>`_,
using the ``audio-reference`` alignment type with ``vtt-timecode`` and
``u23003`` reference schemes.

===========
Conventions
===========

``contentResourcesByChapter``
    If present, confirms that every audio ingredient covers exactly one
    chapter. If absent, audio files MAY cover verse ranges, sections, or
    non-contiguous selections.

``bookDirs``
    If present, confirms that audio files follow the historical DBL directory
    layout: one directory per book, one file per chapter. This layout is not
    required — ingredient paths in ``metadata.json`` are authoritative.
