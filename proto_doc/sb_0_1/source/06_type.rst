####
TYPE
####

*******************
IN DBL METADATA 2.2
*******************

* **medium** (exactly 1 element)

    * The "type" of the bundle

    * enum:

        * text

        * audio

        * video

        * print

        * braille

* **hasCharacters** (exactly 1 boolean)

    * Does this medium have characters? (Used mainly to control other schema features)

* **isTranslation** (exactly 1 boolean)

    * Is this entry the definitive source, ie does it correspond to a translation project?

* **isExpression** (exactly 1 boolean)

    * Does this entry include one or more publication scenario?

* **isConfidential** (exactly 1 boolean)

    * Is this entry confidential?

For translations only:

* **translationType** (exactly 1 string)

    * The type of translation

    * enum:

        * First

        * New

        * Revision

        * Study / Help Material

* **audience** (exactly 1 string)

    * The audience for whom the translation is intended

    * enum:

        * Basic

        * Common

        * Common - Literary

        * Literary

        * Liturgical

        * Children

For text translations only:

    * **projectType** (exactly 1 element)

    * enum:

        * Standard

        * Daughter

        * StudyBible

        * StudyBibleAdditions

        * BackTranslation

        * Auxiliary

        * TransliterationManual

        * TransliterationWithEncoder

        * Unknown

For audio expressions only:

    * **dramatization** (exactly 1 element)

    * enum:

        * Dramatized
        
        * Non-Dramatized
        
        * Single-Voice

************************
PROPOSED CHANGES FOR 0.1
************************

================
Private Licences
================

DBL has a rich model for “private” licenses. In addition to determining whether an entry can
be downloaded by a given Library Card Holder, they are also used to filter information such
as as publications, cross-references and footnotes. It would be useful to be able to tell if
the metadata document has been filtered.

.. code-block:: xml

    <license type="dbl">
        <id>326</id>
        <uri>https://app.thedigitalbiblelibrary.org/api/license/326</uri>
        <serviceOptions>
            <option type="footnotes">false</option>
            <option type="publications">protestant catholic</option>
        </serviceOptions>
    </license>

===============
Public Licenses
===============

DBL doesn't really have a model for this...

==============================
REAP-compatible isConfidential
==============================

Apparently REAP uses more than three states to represent the degree of confidentiality of a project. It would
make sense for DBL to use the same system. It will be quite important to make sure that migration does not
make previously confidential projects visible.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.