#########
PROMOTION
#########


************************
PROPOSED CHANGES FOR 0.1
************************

----------------------------------------------
Replace promoVersionInfo with statementContent
----------------------------------------------

Right now the promotion section is similar to but confusingly different to the copyright section. A more
coherent structure that also allows plain text promotional material would be

**/DBLMetadata/promotion** (Exactly 1)

    * **statementContent[@type='xhtml']/*** (0 or 1 xml)

        * Promotional material in DBL's subset of XHTML (must be valid XML, ie tags must match.)

        * schema: dbl/2_2/dbl-xhtml

    * **statementContent[@type='plain']** (0 or 1 string)

        * Promotional material in plain text

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.
