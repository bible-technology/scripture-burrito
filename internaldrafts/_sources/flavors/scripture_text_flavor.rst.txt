.. _scripture_text_flavor:

##############################
Scripture Text Specification
##############################

[:ref:`Tutorial <tutorial-textTranslation>`]  [:ref:`Example <examples-textTranslation>`]

This page covers fields specific to the Scripture Text flavor. For fields common to all burritos see :ref:`burrito-structure`.

A Scripture Text burrito contains a Scripture translation or original-language
edition in **USFM**, **USX**, or **USJ** format.

===========
Type Fields
===========

``type.flavorType.name``
    MUST be ``"scripture"``.

``type.flavorType.flavor.name``
    MUST be ``"textTranslation"``.

``type.flavorType.flavor.projectType``
    MUST be present. MUST be one of:

    * ``"standard"`` — a normal translation or edition
    * ``"daughter"`` — derived from a parent translation
    * ``"studyBible"`` — a full study Bible
    * ``"studyBibleAdditions"`` — commentary or helps supplementing a study Bible
    * ``"backTranslation"`` — a reverse translation for checking
    * ``"auxiliary"`` — supplemental or experimental
    * ``"transliterationManual"`` — manual transliteration
    * ``"transliterationWithEncoder"`` — automatically generated transliteration

``type.flavorType.flavor.translationType``
    MUST be present. MUST be one of:

    * ``"firstTranslation"`` — first translation into this language
    * ``"newTranslation"`` — a new translation independent of existing versions
    * ``"revision"`` — a revision of a prior translation
    * ``"studyOrHelpMaterial"`` — study notes or supplementary helps

``type.flavorType.flavor.audience``
    MUST be present. MUST be one of:

    * ``"basic"`` — simplified or learner audience
    * ``"common"`` — general readership
    * ``"common-literary"`` — general readership with elevated literary style
    * ``"literary"`` — formal or literary audience
    * ``"liturgical"`` — designed for public worship
    * ``"children"`` — adapted for young readers

``type.flavorType.flavor.usfmVersion``
    MUST be present. MUST match the pattern ``\d+\.\d+(\..+)?``
    (e.g. ``"3.1"``, ``"3.1.0"``). Applies to all three serializations
    (USFM, USX, USJ).

``type.flavorType.currentScope``
    MUST be present. Keys MUST be valid three-letter USFM book codes. Each
    value is a list of included chapters (integers or ``"ch:v–ch:v"`` ranges);
    an empty list means all chapters of that book are included.

============
Ingredients
============

**Text files**

At least one text ingredient MUST be present. Text ingredients MUST use one of
the following MIME types:

* ``"text/x-usfm"`` for USFM (``.SFM``, ``.USFM``)
* ``"application/xml"`` for USX
* ``"application/json"`` for USJ (with ``"role": "text"``)

Text ingredients MUST include a ``scope`` mapping each ingredient to the book
or books it contains. Every book declared in ``currentScope`` MUST be covered
by at least one text ingredient.

**Versification file**

A ``versification.json`` ingredient SHOULD be present. It MUST carry
``"role": "versification"`` and ``"mimeType": "application/json"``. It MUST
conform to the Copenhagen Alliance Versification format.

**Locale data**

At least one ``.ldml`` locale file SHOULD be present. It MUST carry
``"role": "localedata"`` and ``"mimeType": "application/xml"``.

**Optional ingredients**

The following ingredient roles MAY be present:

* ``"styleSheet"`` — Paratext custom style sheet
* ``"font"`` — font files for rendering
* ``"license"`` — license or permissions statement

===========
Conventions
===========

``usxRefs``
    If present, signals that USX ingredients include machine-readable
    cross-reference markup.

``usxDirs``
    If present, signals that USX ingredients include direction markup.

``typesetAsVersedParagraphs``
    If present, consumers SHOULD render each verse or verse range as a
    separate paragraph, ignoring paragraph markers in the source file.
