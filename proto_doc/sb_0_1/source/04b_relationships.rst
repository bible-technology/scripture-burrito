#############
RELATIONSHIPS
#############

*******************
IN DBL METADATA 2.2
*******************

**/DBLMetadata/relationships** (Exactly 1)

**/DBLMetadata/relationships/relation** (0 or more)

    * **@id** (Exactly 1 string key)

        * The DBL id of the related entry

            * regex: [a-f0-9]{16}

    * **@revision** (Exactly 1 integer)

        * The revision of the related entry

            * min: 1

    * **@relationType** (Exactly 1 string)

        * The role of the related entry with respect to this entry

            * Enum:

                * source

                * expression

    * **@type** (Exactly 1 string)

        * The medium of the related entry

            * Enum:

                * text

                * audio

                * print

                * video

                * braille

    * **@publicationId** (0 or 1 string)

        * The publication in the related text entry on which to base the braille

        * regex:
        
            * ::
            
                [A-Za-z][A-Za-z0-9_\-]{0,31}


************************
PROPOSED CHANGES FOR 0.1
************************

-------------------------
Expand @relationType enum
-------------------------

This mechanism could be used to represent other entry-to-entry relationships, eg between Bible text and related para-biblical material.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

There has been some discussion about resource-to-resource relationships. The relationships section probably isn't the best place to address this.
