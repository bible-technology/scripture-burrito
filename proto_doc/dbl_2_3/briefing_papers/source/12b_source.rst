######
SOURCE
######

*******************
IN DBL METADATA 2.2
*******************

* **/DBLMetadata/source** (exactly 1 element)

    * Must contain canonicalContent and structure

* **canonicalContent** (0 or 1 element)

    * **book** (1 or more element)

        * **@code**

            * The USFM book code

* **structure** (0 or 1 element)

    * Contains at least one division and/or content element

    * ** division**

        * A "section" (eg "OT" or "Pentateuch")

        * **@src**

            * The URI of the manifest entry corresponding to this content

            * ::

                [A-Za-z0-9][\-A-Za-z0-9_\.]+(/[A-Za-z0-9][\-A-Za-z0-9_\.]+)*

        * **@srcPart** (0 or 1 string)

            * Optional in-document identifier

            * ::

                regex: (((zip|xpath)://)|#).+

        * **@role**

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

    * **@name** (0 or 1 string)

        * A name id for this division

    * **@role** (0 or 1 string)

        * The canonical or peripheral function of the division

************************
PROPOSED CHANGES FOR 2.3
************************

=======================
Consider dropping @name
=======================

=============================
Consider unpacking PT sources
=============================

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************

None