#########
COUNTRIES
#########

*******************
IN DBL METADATA 2.2
*******************

* **/DBLMetadata/countries/country** (1 or more)

    * **iso** (Exactly 1 string key)

        * The country's 2-character country code

        * regex: [A-Z][A-Z]

    * **name** (Exactly 1 string)

        * The country's name in English

        * regex: \S.*\S

    * **nameLocal** (0 or 1 string)

        * The country's localized name

        * regex: \S.*\S

************************
PROPOSED CHANGES FOR 0.1
************************

=========================
Multiple Language Support
=========================

See the languages section.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.
