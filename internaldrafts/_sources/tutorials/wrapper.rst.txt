.. _tutorial-wrapper:

################
Wrapper Tutorial
################

[:ref:`Specification <wrapper_flavor>`]  [:ref:`Example <examples-wrapper>`]

A *wrapper* groups two or more related burritos together so that tools can
discover and process them as a set. A common case is a project that has both
an audio recording and a text transcription of the same Scripture: the two
burritos are separate projects with separate metadata files, but a wrapper
lets any tool know they belong together.

This tutorial walks through creating a ``wrapper.json`` file from scratch. By
the end you will have a valid wrapper that can be read by any conforming tool.

**Scenario:** The Spoken English Bible team has recorded a New Testament and
produced a text transcription from that recording. They have already packaged
each deliverable as its own burrito:

* ``audio/`` — the audio recording (source burrito, flavor ``audioTranslation``)
* ``text/`` — the text transcription derived from the audio (derived burrito,
  flavor ``textTranslation``)
* ``intellectualproperty/`` — legal and rights documentation (supplemental burrito)

Their project root currently looks like this::

   spoken-english-bible/
       audio/
           metadata.json
           ingredients/
               ...
       text/
           metadata.json
           ingredients/
               ...
       intellectualproperty/
           metadata.json
           ingredients/
               ...
       wrapper.json           ← we are building this

Each burrito is a self-contained Scripture Burrito package in its own
subdirectory. The ``wrapper.json`` file lives at the project root and records
which burritos belong to this project.

===========
1. Format
===========

Every wrapper file begins with the ``format`` field. This is the discriminator
that tells tools they are reading a wrapper rather than a regular burrito::

   {
     "format": "scripture burrito wrapper",

Any conforming tool checks this field first to identify the file type.

===============
2. Meta section
===============

The ``meta`` section records administrative information about the wrapper
itself — not about the individual burritos::

     "meta": {
       "name": {
         "en": "Spoken English Bible Burrito Wrapper"
       },
       "version": "0.0.1",
       "generator": {
         "name": "Audio Project Manager",
         "version": "4.5.0"
       },
       "dateCreated": "2026-05-21",
       "description": {
         "en": "A new burrito wrapper for Spoken English Bible Team"
       },
       "abbreviation": {
         "en": "ENGSEB2"
       },
       "defaultLocale": "en"
     },

Key fields:

* ``name`` — a localized human-readable name for the wrapper project.
* ``version`` — the semantic version of this wrapper file (not the burrito spec
  version). Start with ``"0.0.1"`` for a new project.
* ``generator.name`` — the software that created this file.
* ``generator.version`` — the version of that software.
* ``dateCreated`` — the ISO 8601 date this wrapper was first created
  (``YYYY-MM-DD``).
* ``description`` — a localized short description of the project.
* ``abbreviation`` — a localized short code for the project.
* ``defaultLocale`` — the BCP-47 language tag for the default locale of the
  localized text fields above.

===================
3. Contents section
===================

The ``contents`` section is the heart of the wrapper. It lists every burrito
that belongs to this project::

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
         },
         {
           "id": "ENGSEB2-intellectualProperty",
           "path": "intellectualproperty",
           "role": "supplemental"
         }
       ]
     }

Each entry in the ``burritos`` array has three required fields:

* ``id`` — a string that uniquely identifies this burrito within the wrapper.
  Choose something stable and descriptive; it does not need to match any field
  inside the burrito's own ``metadata.json``.
* ``path`` — the path to the burrito directory, relative to the wrapper root.
  This must be the directory that contains the burrito's ``metadata.json``.
* ``role`` — the relationship this burrito has to the others. Three standard
  values are defined:

  * ``"source"`` — the primary, editable content (e.g. the recorded audio).
  * ``"derived"`` — content produced from the source (e.g. the text
    transcription generated from the audio).
  * ``"supplemental"`` — supporting material that is not itself a Scripture
    deliverable (e.g. intellectual property documents, fonts, images).

  You may also use ``"x-"``-prefixed values for custom roles specific to your
  workflow (e.g. ``"x-mixdown"``).

The array must contain at least one entry.

=======================
4. The complete file
=======================

Putting it all together::

   {
     "format": "scripture burrito wrapper",
     "meta": {
       "name": {
         "en": "Spoken English Bible Burrito Wrapper"
       },
       "version": "0.0.1",
       "generator": {
         "name": "Audio Project Manager",
         "version": "4.5.0"
       },
       "dateCreated": "2026-05-21",
       "description": {
         "en": "A new burrito wrapper for Spoken English Bible Team"
       },
       "abbreviation": {
         "en": "ENGSEB2"
       },
       "defaultLocale": "en"
     },
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
         },
         {
           "id": "ENGSEB2-intellectualProperty",
           "path": "intellectualproperty",
           "role": "supplemental"
         }
       ]
     }
   }

Save this file as ``wrapper.json`` in the project root (the directory that
contains the burrito subdirectories).

=========================
5. Validating the wrapper
=========================

The Scripture Burrito toolkit includes a validator for wrapper files. From the
repository root::

   python code/validate_wrapper.py docs/examples/artifacts/wrapper.json

A valid file prints ``No errors.`` If you see validation errors, check:

* ``format`` is exactly ``"scripture burrito wrapper"`` (not ``"scripture burrito"``).
* All ``meta`` fields listed as required are present.
* Every ``burritos`` entry has ``id``, ``path``, and ``role``.
* ``role`` is one of ``"source"``, ``"derived"``, ``"supplemental"``, or a
  value beginning with ``"x-"``.

==============
Next steps
==============

* See :ref:`examples-wrapper` for the full example file used in this tutorial.
* For the complete field reference see :ref:`schema_docs-wrapper-metadata`.
