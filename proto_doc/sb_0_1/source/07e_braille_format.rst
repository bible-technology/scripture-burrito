##############
BRAILLE FORMAT
##############

*******************
IN DBL METADATA 2.2
*******************

* **isContracted** (Exactly 1 boolean)

    * Does the braille transliteration process include contractions?

* **/DBLMetadata/format/liblouis** (Exactly 1)

    * **version** (Exactly 1 string)

        * The version of Liblouis used for Braille conversion

    * **/DBLMetadata/format/liblouis/table** (Exactly 1)

        * **source** (Exactly 1 string)

        * The URI or other identifier of the table

        * **name** (Exactly 1 string)

        * The human-readable name of the table

* **/DBLMetadata/format/hyphenationDictionary** (0 or 1)

    * **@src** (Exactly 1 string)

        * The URI or other identifier of the dictionary

    * **name** (Exactly 1 string)

        * The human-readable name of the table

* **/DBLMetadata/format/numberSign** (Exactly 1)

    * **character** (Exactly 1 string)

        * The symbol used to prefix numbers

        * regex: ([<braille>])*

    * **useInMargin** (Exactly 1 boolean)

        * Set this field if the number sign should be used before numbers in the margin

* **/DBLMetadata/format/continuousPoetry** (0 or 1)

    * **startIndicator** (0 or 1 string)

        * Character(s) to indicate the start of a section of continuous poetry

        * regex: ([<braille>])*

    * **lineIndicator** (0 or 1 string)

        * Character(s) to indicate the end of a line within a section of continuous poetry

        * regex: ([<braille>])*

    * **lineIndicatorSpaced** (Exactly 1 string)

        * Choose whether line indicator is: never spaced from last word in line; always spaced; or only spaced if the line doesn't end in punctuation

        * Enum:

            * never

            * always

            * sometimes

    * **endIndicator** (0 or 1 string)

        * Character(s) to indicate the end of a section of poetry

        * regex: ([<braille>])*


* **/DBLMetadata/format/content** (Exactly 1)

    * **chapterNumberStyle** (Exactly 1 string)

        * Select "upper" to display chapter numbers normally or "lower" to use lower 4 dots of braille cell

        * Enum:

            * upper

            * lower

    * **chapterHeadingsNumberFirst** (Exactly 1 boolean)

        * Set to display the chapter number before the word for "chapter"

    * **versedParagraphs** (Exactly 1 boolean)

        * Set to display each verse as a new paragraph

    * **verseSeparator** (Exactly 1 string)

        * Character(s) to insert between verses if one verse follows another on the same line

        * regex: ([<braille>])*

    * **includeIntros** (Exactly 1 boolean)

        * Set to display book introductions

    * **/DBLMetadata/format/content/characterStyles** (0 or 1)

        * **emphasizedWord** (0 or 1 string)

        * The symbol used to prefix emphasized words

            * regex: ([<braille>])*

        * **emphasizedPassageStart** (0 or 1 string)

        * The symbol used to start an emphasized passage

            * regex: ([<braille>])*

        * **emphasizedPassageEnd** (0 or 1 string)

        * The symbol used to end an emphasized passage

            * regex: ([<braille>])*

    * **/DBLMetadata/format/content/footnotes** (0 or 1)

        * **callerSymbol** (Exactly 1 string)

        * Character(s) to use to show a footnote

            * regex: ([<braille>])*

    * **/DBLMetadata/format/content/crossReferences** (0 or 1)

        * **callerSymbol** (Exactly 1 string)

        * Character(s) to use to show a cross reference

            * regex: ([<braille>])*

* **/DBLMetadata/format/page** (Exactly 1)

    * **charsPerLine** (Exactly 1 integer)

        * The maximum number of characters on a line

        * min: 1

    * **linesPerPage** (Exactly 1 integer)

        * The maximum number of lines on a page

        * min: 1

    * **defaultMarginWidth** (Exactly 1 integer)

        * The default margin width in number of characters

        * min: 1

    * **versoLastLineBlank** (Exactly 1 boolean)

        * Set to leave last line of verso pages blank

    * **carryLines** (Exactly 1 integer)

        * A heading starting within this number of lines of the bottom of page will be carried over to next page

        * min: 1


************************
PROPOSED CHANGES FOR 0.1
************************

============================
liblouis => brailleConvertor
============================

LibLouis is **almost** ubiquitous for braille transcription in 2019, but other options do exist.

.. code-block:: xml

<brailleConvertor>liblouis-3.7.1</brailleConvertor>

=========================
table/source => table/src
=========================

This is just for consistency.

===============================
Enforce exactly one publication
===============================

Braille entries are always an expression and it is hard to imagine a multiple-publication scenario.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.
