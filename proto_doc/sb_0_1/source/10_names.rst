#####
NAMES
#####

*******************
IN DBL METADATA 2.2
*******************

* **/DBLMetadata/names/name** (0 or more)

    * **@id** (Exactly 1 string key)

        * The id of this name

        * ::
        
            regex: [A-Za-z][-A-Za-z0-9_]+

    * **short** (Exactly 1 string)

        * The short label for this name, which is required and will be used as a default for the other labels if necessary

        * regex: \S.(.{0,253}\S)?

    * **abbr** (0 or 1 string)

        * The abbreviation for this name

        * regex: \S(.{0,253}\S)?

    * **long** (0 or 1 string)

        * The long label for this name

        * regex: \S(.{0,1022}\S)?

************************
PROPOSED CHANGES FOR 0.1
************************

This might mean allowing multiple abbr, short and long, distinguished by language attribute.


**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None
