.. _burrito-structure:

######################################
Scripture Burrito Structure
######################################

Every Scripture Burrito consists of a ``metadata.json`` file and a set of
ingredient files. This page specifies the fields of ``metadata.json`` that are
common to all burritos regardless of flavor. Flavor-specific fields are covered
in the individual :ref:`flavor specifications <flavors-index>`.

=================
Top-Level Fields
=================

``format``
    MUST be the string ``"scripture burrito"``. Every conforming tool checks
    this field first.

``meta``
    REQUIRED. See `Meta`_.

``idAuthorities``
    REQUIRED. See `ID Authorities`_.

``identification``
    REQUIRED. See `Identification`_.

``confidential``
    REQUIRED. Boolean. Set to ``true`` if the project must not be publicly
    disclosed and the identities of project members must be kept confidential.
    Set to ``false`` otherwise.

``type``
    REQUIRED. Declares the flavor. See the :ref:`flavor specifications
    <flavors-index>`.

``copyright``
    REQUIRED. See `Copyright`_.

``ingredients``
    REQUIRED. See `Ingredients`_.

``languages``
    REQUIRED for ``scripture`` and ``gloss`` flavor types. See `Languages`_.

``agencies``
    OPTIONAL. See `Agencies`_.

``relationships``
    OPTIONAL. See :ref:`derived_flavor`.

``targetAreas``
    OPTIONAL. See `Target Areas`_.

``localizedNames``
    OPTIONAL. See `Localized Names`_.

``progress``
    OPTIONAL. See `Progress`_.

====
Meta
====

``meta.version``
    REQUIRED. The Scripture Burrito schema version this file conforms to
    (currently ``"1.0.0"``).

``meta.category``
    REQUIRED. MUST be ``"source"``, ``"derived"``, or ``"template"``. See
    :ref:`derived_flavor` for the distinction.

``meta.generator``
    OPTIONAL. Object describing the software and user that created this file:

    * ``softwareName`` (REQUIRED): name of the generating software
    * ``softwareVersion`` (REQUIRED): version of the generating software
    * ``userName`` (OPTIONAL): name of the user who triggered the generation

``meta.defaultLocale``
    REQUIRED. BCP-47 language tag for the default locale of all localized
    string fields in the burrito (e.g. ``identification.name``).

``meta.dateCreated``
    REQUIRED. ISO 8601 date or datetime string
    (e.g. ``"2025-11-04T09:00:00+01:00"``).

``meta.normalization``
    OPTIONAL. Unicode normalization form of the text ingredients. MUST be
    ``"NFC"`` or ``"NFD"`` if present.

``meta.comments``
    OPTIONAL. Array of free-text strings for human notes about this burrito.

==============
ID Authorities
==============

Declares one or more external identifier authorities so that
``identification.primary``, ``identification.upstream``, and
``agencies[*].id`` can reference them by short label.

Each key is a short label for the authority (e.g. ``"dbl"``,
``"paratext"``). Each value MUST be an object with:

* ``id`` (REQUIRED): a URL that uniquely identifies the authority
* ``name`` (OPTIONAL): a locale-map giving a human-readable name

Custom authority labels MUST be prefixed with ``"x-"``
(e.g. ``"x-atl"``).

Example::

    "idAuthorities": {
      "dbl": {
        "id": "https://thedigitalbiblelibrary.org",
        "name": {"en": "The Digital Bible Library"}
      }
    }

==============
Identification
==============

``identification.name``
    REQUIRED. A locale-map giving a human-readable name for the project
    (e.g. ``{"en": "Zarma New Testament", "dje": "Zarma Neeriya Koyra"}``).

``identification.description``
    OPTIONAL. A locale-map giving a longer description.

``identification.abbreviation``
    OPTIONAL. A locale-map giving a short abbreviation
    (e.g. ``{"en": "ZJNT"}``).

``identification.primary``
    REQUIRED. The registration of this burrito in one external authority.
    MUST contain exactly one key matching a label in ``idAuthorities``. The
    value maps an id string to an object with ``revision`` and ``timestamp``.

``identification.upstream``
    OPTIONAL. Identifiers of source burritos this was derived from. See
    :ref:`derived_flavor`.

=========
Copyright
=========

REQUIRED. At least one of ``publicDomain``, ``shortStatements``, or
``licenses`` MUST be present.

``copyright.publicDomain``
    Set to ``true`` if the contents are in the public domain.

``copyright.shortStatements``
    An array of short copyright notices. Each entry MUST have:

    * ``statement`` (REQUIRED): text of up to 500 characters
    * ``mimetype`` (OPTIONAL): ``"text/plain"`` (default) or ``"text/html"``
    * ``lang`` (OPTIONAL): BCP-47 tag if this statement is language-specific

``copyright.licenses``
    An array of license references. Each entry MUST have exactly one of:

    * ``url``: a URL pointing to the license text
    * ``ingredient``: a path to a license ingredient file within the burrito

=========
Languages
=========

REQUIRED for ``scripture`` and ``gloss`` flavor types. An array with one
entry per language present in the translation. Each entry MUST have:

* ``tag`` (REQUIRED): a BCP-47 language tag (e.g. ``"dje"``, ``"en"``,
  ``"es-419"``)
* ``name`` (REQUIRED): a locale-map giving a human-readable name

Optional fields per entry:

* ``scriptDirection``: ``"ltr"`` or ``"rtl"``
* ``rod``: Rosetta Online Database code
* ``numberingSystem``: the numbering system used in the text

========
Agencies
========

OPTIONAL. An array of organizations involved in producing or managing this
burrito. Each entry MUST have:

* ``id`` (REQUIRED): a prefixed identifier (e.g. ``"dbl::54650cfa"``), or a
  stable URL for organizations not registered in a declared authority
* ``name`` (REQUIRED): a locale-map giving the organization's name
* ``roles`` (REQUIRED): a non-empty array containing one or more of:
  ``"rightsHolder"``, ``"rightsAdmin"``, ``"content"``, ``"publication"``,
  ``"management"``, ``"finance"``, ``"qa"``

Optional fields per entry:

* ``abbr``: a locale-map giving a short abbreviation
* ``url``: the organization's website

===========
Ingredients
===========

REQUIRED. A JSON object mapping file paths to ingredient descriptors. Paths
are relative to the burrito root and MUST use forward slashes.

Each ingredient descriptor MUST have:

* ``mimeType`` (REQUIRED): the MIME type of the file
* ``size`` (REQUIRED): file size in bytes

Each ingredient descriptor SHOULD have:

* ``checksum``: an object with an ``"md5"`` key and a 32-character lowercase
  hex digest. Consuming tools use this to verify file integrity.

Optional fields:

* ``scope``: maps USFM book codes to arrays of chapter or chapter:verse
  selectors. An empty array means all chapters of that book.
* ``role``: a semantic role for this file. Standard roles include
  ``"versification"``, ``"localedata"``, ``"timing"``, ``"introduction"``,
  ``"copyrightStatement"``. Custom roles MUST be prefixed with ``"x-"``.
  See :ref:`custom_flavors`.
* ``lang``: BCP-47 tag if this ingredient is language-specific.

============
Target Areas
============

OPTIONAL. An array of geographic areas representing the primary target
audience. Each entry MUST have:

* ``code`` (REQUIRED): an ISO 3166-1 alpha-2 country code or UN M.49
  numeric region code
* ``name`` (REQUIRED): a locale-map giving a human-readable name

===============
Localized Names
===============

OPTIONAL. A map of keys to localized name objects, used to provide
translated names for books, introductions, and other named units. Each
value MUST have:

* ``short`` (REQUIRED): a locale-map for the short display name

Optional per entry:

* ``long``: a locale-map for the full name
* ``abbr``: a locale-map for an abbreviated form

Conventional keys: ``"book-gen"``, ``"book-mat"``, etc. for biblical books;
``"intot"``, ``"intnt"`` for testament introductions.

========
Progress
========

OPTIONAL. Records when work on this burrito was started or completed. At
least one field MUST be present:

* ``dateStarted`` (OPTIONAL): ISO 8601 timestamp
* ``dateCompleted`` (OPTIONAL): ISO 8601 timestamp
