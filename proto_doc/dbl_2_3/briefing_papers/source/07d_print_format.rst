############
PRINT FORMAT
############

*******************
IN DBL METADATA 2.2
*******************

**pod** (Exactly 1 boolean)

    * Is this entry suitable for POD?

**width** (Exactly 1 string)

    * The width of the page in millimetres

        * regex: [1-9][0-9]{1,4}mm

**height** (Exactly 1 string)

    * The height of the page in millimetres

        * regex: [1-9][0-9]{1,4}mm

**scale** (Exactly 1 string)

    * The scale of the page as a percentage

        * regex: [1-9][0-9]{1,3}%

**orientation** (Exactly 1 string)

    * The orientation of the pages

        * Enum:

        * portrait

        * landscape

**pageCount** (Exactly 1 integer)

    * The number of printed pages

        * min: 1

**color** (Exactly 1 string)

    * The color model of the document

        * Enum:

        * RGB

        * CMYK

**/DBLMetadata/format/fonts** (Exactly 1)

    * **/DBLMetadata/format/fonts/font** (0 or more)

        * **text()** (Exactly 1 string key)

        * The name of the font

            * regex: .+

        * **@type** (Exactly 1 string)

        * The type of font

            * Enum:

                * Bitmap

                * OpenType

                * TrueType

                * Type1

                * Other

**/DBLMetadata/format/edgeSpace** (Exactly 1)

    * **top** (Exactly 1 string)

        * The space at the top of the pages

        * regex: [1-9][0-9]{0,2}mm

    * **bottom** (Exactly 1 string)

        * The space at the bottom of the pages

        * regex: [1-9][0-9]{0,2}mm

    * **inside** (Exactly 1 string)

        * The space on the inside of each page

        * regex: [1-9][0-9]{0,2}mm

    * **outside** (Exactly 1 string)

        * The space on the outside of each page

        * regex: [1-9][0-9]{0,2}mm


************************
PROPOSED CHANGES FOR 2.3
************************

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************
