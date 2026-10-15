.. You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Scripture Burrito Specification
================================

:Status: Working Draft
:Version: 2.0.0
:Date: |today|

.. image:: ../logo/burrito_logo.png
   :width: 625px

Scripture Burrito is a standard for exchanging Bible translation projects between tools. At the core is a metadata file — the *burrito* — that describes every file in a project: what it contains, what part of Scripture it covers, and what role it plays. The same burrito can be stored as a zip file, a directory, a GitHub repository, a database, or delivered via API.

All burritos share a common structure — see :ref:`burrito-structure`. Flavor-specific fields are documented below.

This Scripture Burrito specification defines these flavors:

.. Note: flavor names below are plain text (not :ref: links) to avoid showing
   "Scripture Text Specification" as a redundant link — the Specification link
   already appears in the [Specification | Example] bracket.

- Scripture Text — USFM, USX, or USJ text translations
  [:ref:`Specification <scripture_text_flavor>` | :ref:`Example <examples-textTranslation>`]
- Scripture Audio — recorded audio translations
  [:ref:`Specification <scripture_audio_flavor>` | :ref:`Example <examples-audioTranslation>`]
- Alignment — word-level or timecode alignment between two texts
  [:ref:`Specification <alignment_flavor>` | :ref:`Example <examples-alignment>`]
- Wrapper — groups related burritos together, such as a text and audio burrito for the same translation
  [:ref:`Specification <wrapper_flavor>` | :ref:`Example <examples-wrapper>`]

Any flavor can also be extended:

- Derived — burritos produced from other burritos, such as back-translations and publication artifacts
  [:ref:`Specification <derived_flavor>` | :ref:`Example <examples-textTranslation_derived>`]
- Custom — defining your own nonstandard flavor using the ``x-`` prefix
  [:ref:`Specification <custom_flavors>`]

The following beta flavors are defined in Scripture Burrito v2.0.0.  When a beta flavor reaches release status, it will be added to this specification.

- `Scripture Print (beta) <https://docs.burrito.bible/en/v1.0.0/flavors/scripture_print_flavor.html>`_
- `Scripture Sign Language (beta) <https://docs.burrito.bible/en/v1.0.0/flavors/scripture_sign_language_flavor.html>`_
- `Scripture Braille (beta) <https://docs.burrito.bible/en/v1.0.0/flavors/scripture_braille_flavor.html>`_
- `Scriptural Text Stories (beta) <https://docs.burrito.bible/en/v1.0.0/flavors/scriptural_text_stories_flavor.html>`_

Documentation
=============

.. toctree::
   :maxdepth: 1

   introduction/index
   Structure <introduction/structure>
   schema_docs/index
   flavors/index
   examples/index
   glossary
