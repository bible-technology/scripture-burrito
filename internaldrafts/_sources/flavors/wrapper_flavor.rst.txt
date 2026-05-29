.. _wrapper_flavor:

#######################
Wrapper Specification
#######################

[:ref:`Tutorial <tutorial-wrapper>`]  [:ref:`Example <examples-wrapper>`]

This page covers the Wrapper format. For the base burrito structure see :ref:`burrito-structure`.

A wrapper groups two or more related burritos so that tools can discover and
process them as a set. Common uses include bundling a text translation with its
audio recording, or bundling a source burrito with derived and supplemental
content.

A wrapper is stored as a ``wrapper.json`` file. It is distinct from a regular
burrito: the ``format`` field is ``"scripture burrito wrapper"``, not
``"scripture burrito"``.

================
Top-Level Fields
================

``format``
    MUST be the string ``"scripture burrito wrapper"``.

``meta``
    MUST be present. MUST be an object containing:

    * ``name`` (REQUIRED): a locale-map object giving a human-readable name
      for the project (e.g. ``{"en": "My Project"}``).
    * ``version`` (REQUIRED): a semantic version string for this wrapper
      file (e.g. ``"0.0.1"``). This is the version of the wrapper data,
      not the Scripture Burrito spec version.
    * ``generator`` (REQUIRED): an object with:

      * ``name`` (REQUIRED): name of the software that created this file
      * ``version`` (REQUIRED): version of that software

    * ``dateCreated`` (REQUIRED): ISO 8601 date or datetime string.
    * ``description`` (OPTIONAL): a locale-map object.
    * ``abbreviation`` (OPTIONAL): a locale-map object.
    * ``defaultLocale`` (OPTIONAL): BCP-47 tag for the default locale of
      the localized fields above.

``contents``
    MUST be present. MUST be an object with a ``"burritos"`` key whose
    value is a non-empty array. Each element MUST be an object with:

    * ``id`` (REQUIRED): a string that uniquely identifies this burrito
      within the wrapper. MUST be stable across revisions of the wrapper.
    * ``path`` (REQUIRED): path to the burrito directory, relative to the
      directory containing ``wrapper.json``. The referenced directory MUST
      contain a ``metadata.json`` file.
    * ``role`` (REQUIRED): the relationship of this burrito to the others.
      MUST be one of:

      * ``"source"`` — primary, editable content
      * ``"derived"`` — content produced from a source burrito
      * ``"supplemental"`` — supporting material not itself a Scripture
        deliverable

      Custom roles MAY be used and MUST be prefixed with ``"x-"``.

===========
Constraints
===========

* The ``contents.burritos`` array MUST contain at least one entry.
* ``id`` values MUST be unique within a single wrapper.
* Each ``path`` MUST resolve to a directory containing a valid
  ``metadata.json`` or ``wrapper.json`` (nested wrappers are allowed).
* Circular references through nested wrappers are NOT permitted.
