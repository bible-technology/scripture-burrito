############
PUBLICATIONS
############

*******************
IN DBL METADATA 2.2
*******************

**/DBLMetadata/publications** (Exactly 1)

* **/DBLMetadata/publications/publication** (1 or more)

    * **@id** (Exactly 1 string key)

        * The id of the publication

        * ::
        
            regex: [A-Za-z][A-Za-z0-9_\-]{0,31}

    * **name** (0 or 1 string)

        * The publication's name, in English

        * regex: \S.*\S

    * **nameLocal** (0 or 1 string)

        * The publication's localized name

        * regex: \S.*\S

    * **abbreviation** (0 or 1 string)

        * The publication's abbreviation, in English (no exotic characters)

        * regex: [\-A-Za-z0-9]{2,12}

    * **abbreviationLocal** (0 or 1 string)

        * The publication's localized abbreviation

        * regex: \S.{0,10}\S

    * **description** (0 or 1 string)

        * The publication's description, in English

        * regex: \S.*\S

    * **descriptionLocal** (0 or 1 string)

        * The publication's localized description

        * regex: \S.*\S

    * **scope** (0 or 1 string)

        * The publication's scope

        * Enum:

            * Bible

            * Bible with Deuterocanon

            * New Testament

            * New Testament+

            * Old Testament

            * Old Testament + Deuterocanon

            * Old Testament+

            * Portions

            * Selections

            * Shorter Bible

Each publication must include:

* **canonicalContent** (exactly 1 element)

    * **book** (1 or more element)

        * **@code**

            * The USFM book code

* **structure** (exactly 1 element)

    * Contains at least one division and/or content element

    * ** division**

        * A "section" (eg "OT" or "Pentateuch")

        * **@name** (exactly 1 string)

            * A name id for this division

        * **@role** (0 or 1 string)

            * The canonical or peripheral function of the division

            * ::

                ((GEN|EXO|LEV|NUM|DEU|JOS|JDG|RUT|1SA|2SA|1KI|2KI|1CH|2CH|EZR|
                NEH|EST|JOB|PSA|PRO|ECC|SNG|ISA|JER|LAM|EZK|DAN|HOS|JOL|AMO|
                OBA|JON|MIC|NAM|HAB|ZEP|HAG|ZEC|MAL|MAT|MRK|LUK|JHN|ACT|ROM|
                1CO|2CO|GAL|EPH|PHP|COL|1TH|2TH|1TI|2TI|TIT|PHM|HEB|JAS|1PE|2PE
                1JN|2JN|3JN|JUD|REV|TOB|JDT|ESG|WIS|SIR|BAR|LJE|S3Y|SUS|BEL|
                1MA|2MA|3MA|4MA|1ES|2ES|MAN|PS2|ODA|PSS|JSA|JDB|TBS|SST|DNT|BLT|
                EZA|5EZ|6EZ|DAG|PS3|2BA|LBA|JUB|ENO|1MQ|2MQ|3MQ|REP|4BA|LAO)
                (( [1-9][0-9]{0,2}(-[1-9][0-9]{0,2})?((,([1-9][0-9]{0,2}
                (-[1-9][0-9]{0,2})?))*))|
                ( [1-9][0-9]{0,2}:[1-9][0-9]{0,2}(-[1-9][0-9]{0,2}(:[1-9][0-9]{0,2})?)?
                (,(([1-9][0-9]{0,2}(-[1-9][0-9]{0,2})?)|
                ([1-9][0-9]{0,2}:[1-9][0-9]{0,2}(-[1-9][0-9]{0,2}
                (:[1-9][0-9]{0,2})?)?)))*))?)(;
                (((GEN|EXO|LEV|NUM|DEU|JOS|JDG|RUT|1SA|2SA|1KI|2KI|1CH|2CH|EZR|
                NEH|EST|JOB|PSA|PRO|ECC|SNG|ISA|JER|LAM|EZK|DAN|HOS|JOL|AMO|
                OBA|JON|MIC|NAM|HAB|ZEP|HAG|ZEC|MAL|MAT|MRK|LUK|JHN|ACT|ROM|
                1CO|2CO|GAL|EPH|PHP|COL|1TH|2TH|1TI|2TI|TIT|PHM|HEB|JAS|1PE|2PE|
                1JN|2JN|3JN|JUD|REV|TOB|JDT|ESG|WIS|SIR|BAR|LJE|S3Y|SUS|BEL|
                1MA|2MA|3MA|4MA|1ES|2ES|MAN|PS2|ODA|PSS|JSA|JDB|TBS|SST|DNT|BLT|
                EZA|5EZ|6EZ|DAG|PS3|2BA|LBA|JUB|ENO|1MQ|2MQ|3MQ|REP|4BA|LAO)
                (( [1-9][0-9]{0,2}(-[1-9][0-9]{0,2})?((,([1-9][0-9]{0,2}
                (-[1-9][0-9]{0,2})?))*))|
                ( [1-9][0-9]{0,2}:[1-9][0-9]{0,2}(-[1-9][0-9]{0,2}(:[1-9][0-9]{0,2})?)?
                (,(([1-9][0-9]{0,2}(-[1-9][0-9]{0,2})?)|
                ([1-9][0-9]{0,2}:[1-9][0-9]{0,2}(-[1-9][0-9]{0,2}
                (:[1-9][0-9]{0,2})?)?)))*))?)))*" }

            * ::

                "sourceZip" | "sourceFile" | "lds" | "ldml" | "styles" | "vrs"

            * ::

                Regex: X-[A-Za-z0-9][A-Za-z0-9\-]*

            * ::

                "XXA" | # Extra A, e.g. a hymnal
                "XXB" | # Extra B
                "XXC" | # Extra C
                "XXD" | # Extra D
                "XXE" | # Extra E
                "XXF" | # Extra F
                "XXG" | # Extra G
                "FRT" | # Front Matter
                "BAK" | # Back Matter
                "OTH" | # Other Matter
                "INT" | # Introduction
                "CNC" | # Concordance
                "GLO" | # Glossary
                "TDX" | # Topical Index
                "NDX"   # Names Index

    * **content**

        * **@src** (exactly 1 string)

            * The URI of the manifest entry corresponding to this content

            * ::

                [A-Za-z0-9][\-A-Za-z0-9_\.]+(/[A-Za-z0-9][\-A-Za-z0-9_\.]+)*

        * **@srcPart** (0 or 1 string)

            * Optional in-document identifier

            * ::

                regex: (((zip|xpath)://)|#).+

        * **@name** (0 or 1 string)

            * A name id for this division

        * **@role** (0 or 1 string)

            * The canonical or peripheral function of the division

Each publication may also include

    * **/DBLMetadata/publications/publication/countries** (0 or 1)

        * **/DBLMetadata/publications/publication/countries/country** (1 or more)

        * same format as /DBLMetadata/countries/country

    * **/DBLMetadata/publications/publication/canonSpec** (0 or 1)

    * same format as /DBLMetadata/identification/canonSpec

************************
PROPOSED CHANGES FOR 2.3
************************

=========================
Multiple Language Support
=========================

See the languages section.

=======================
Consider dropping scope
=======================

An enum can never accurately capture all the possible permutations of content, and the options that are currently present are routinely abused by archivists. Statistics should be based
on the canonicalContent which should correspond to what is actually present in the Burrito.

===========
metaContent
===========

This would allow content elements to have child elements for supporting content. The first concrete use case is for timing files, which are closely related to audio or video files, but which
appear as separate entries within the manifest:

.. code-block:: xml

    <content src="MAT.usx" name="book-mat" role="MAT">
        <metaContent src="timing/MAT.xml"/>
    </content>
    <content src="MRK.usx" name="book-mrk" role="MRK">
        <metaContent src="timing/MRK_1-6.xml" role="MRK 1-6"/>
        <metaContent src="timing/MRK_7-16.xml" role="MRK 7-16"/>
    </content>

=====================================
Peripherals ids in metadata role enum
=====================================

This enables the tagging of extra-canonical content without relying on well-known file names. The list, from the USFM 3 spec, would be

* **abbreviations**: Table of abbreviations

* **alphacontents**: Alphanumeric Contents

* **chron**: Chronology

* **cnc**: Concordance

* **contents**: Table of Contents

* **cover**: Cover

* **foreword**: Foreword

* **glo**: Glossary

* **halftitle**: Half Title Page

* **imprimatur**: Imprimatur

* **intbible**: Introduction to the Bible

* **intdc**: Deuterocanon Introduction

* **intepistles**: Introduction to Epistles

* **intgospels**: Introduction to Gospels

* **inthist**: Introduction to History

* **intnt**: Introduction to New Testament

* **intot**: Introduction to the Old Testament

* **intpent**: Introduction to the Pentateuch

* **intpoetry**: Introduction to Poetry

* **intprophesy**: Introduction to Prophecy

* **lxxquotes**: Quotes from LXX in NT

* **maps**: Map Index

* **measures**: Weights and Measures

* **ndx**: Names Index

* **preface**: Preface

* **promo**: Promotional Page

* **pubdata**: Publication Data

* **spine**: Spine

* **tdx**: Topical Index

* **title**: Title Page

This enum may well need extending and adapting in order to meet the needs of all media, notably sign language video.

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************

None