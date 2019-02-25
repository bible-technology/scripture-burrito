#########
COPYRIGHT
#########

*******************
IN DBL METADATA 2.2
*******************

This section can contain long and/or short versions of the copyright statement, either of which
may be in plain text and/or xhtml. (Historically, most DBL entries have the long version in XHTML.)

**/DBLMetadata/copyright** (Exactly 1)

   * **/DBLMetadata/copyright/fullStatement** (0 or 1)

      * **statementContent[@type='xhtml']/*** (0 or 1 xml)

         * The copyright statement in DBL's subset of XHTML (must be valid XML, ie tags must match.)

            * schema: dbl/2_2/dbl-xhtml

      * **statementContent[@type='plain']** (0 or 1 string)

         * The copyright statement in plain text

   **/DBLMetadata/copyright/shortStatement** (0 or 1)

      * **statementContent[@type='xhtml']** (0 or 1 xml)

         * The copyright statement in DBL's subset of XHTML (must be valid XML, ie tags must match.)

            * schema: dbl-xhtml

      * **statementContent[@type='plain']** (0 or 1 string)

         * The copyright statement in plain text


************************
PROPOSED CHANGES FOR 2.3
************************

---------------------------------------
Language attribute for statementContent
---------------------------------------

To support multiple languages, we would need to add a language attribute (or subelement) to each statement. This could
be optional if there is only one language in the languages section.

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************

Proper support for public licenses may have implications here.
