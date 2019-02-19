##############
IDENTIFICATION
##############

****************
TOP-LEVEL FIELDS
****************

===================
IN DBL METADATA 2.2
===================

**/DBLMetadata/identification** (Exactly 1)

   * **name** (Exactly 1 string)

      * The entry's name, in English

         * regex: \S.*\S

   * **nameLocal** (0 or 1 string)

      * The entry's localized name

         * regex: \S.*\S

   * **abbreviation** (Exactly 1 string)

      * The entry's abbreviation, in English (no exotic characters)

         * regex: [\-A-Za-z0-9]{2,12}

   * **abbreviationLocal** (0 or 1 string)

      * The entry's localized abbreviation

         * regex: \S.{0,10}\S

   * **description** (Exactly 1 string)

      * The entry's description, in English

         * regex: \S.*\S

   * **descriptionLocal** (0 or 1 string)

      * The entry's localized description

         * regex: \S.*\S

   * **scope** (Exactly 1 string)

      * The entry's scope (across all publications)

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

   * **dateCompleted** (0 or 1 string)

      * The date on which this entry was completed

         * regex: [12]\d{3}(-[01]\d(-[0-3]\d(T[012]\d:[0-5]\d:[0-5]\d)?)?)?

   * **bundleProducer** (Exactly 1 string)

      * The client and client version that produced this bundle

         * regex: \S.*\S

========================
PROPOSED CHANGES FOR 2.3
========================

Multiple \*Local elements as part of multiple language support.

========================================
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
========================================

********
systemId
********

===================
IN DBL METADATA 2.2
===================

**/DBLMetadata/identification/systemId** (Exactly 1)

   * **/DBLMetadata/identification/systemId[@type='gbc']** (0 or 1)

      * **id** (Exactly 1 string)

         * The GBC id (24 hex characters)

            * regex: [0-9a-f]{24}


   * **/DBLMetadata/identification/systemId[@type='paratext']** (0 or 1)

      * **id** (Exactly 1 string)

         * The paratext id for this entry (40 hex characters)

            * regex: [0-9a-f]{40}

      * **name** (Exactly 1 string)

         * The Name for this ID

            * regex: \S.*\S

      * **fullName** (Exactly 1 string)

         * The Full Name for this ID

            * regex: \S.*\S

      * **csetId** (0 or 1 string)

         * The CSet id for this ID

            * regex: \S.*\S


   * **/DBLMetadata/identification/systemId[@type='ptreg']** (0 or 1)

      * **id** (Exactly 1 string)

         * The Paratext Repository id (17 hex characters)

            * regex: [0-9a-zA-Z]{17}


   * **/DBLMetadata/identification/systemId[@type='tms']** (0 or 1)

      * **id** (Exactly 1 string)

         * The TMS id for this entry (an UUID)

            * regex: [0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}


   * **/DBLMetadata/identification/systemId[@type='reap']** (0 or 1)

      * **id** (Exactly 1 string)

         * The REAP id for this entry (an UUID)

            * regex: [^ ]+


   * **/DBLMetadata/identification/systemId[@type='biblica']** (0 or 1)

      * **id** (Exactly 1 integer)

         * The Biblica ID (a number)

            * max: 99999


   * **/DBLMetadata/identification/systemId[@type='dbp']** (0 or 1)

      * **id** (Exactly 1 string)

         * The DBP id for this entry (10 hex characters)

            * regex: [A-Z0-9]{10}


========================
PROPOSED CHANGES FOR 2.3
========================

========================================
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
========================================

*********
canonSpec
*********

===================
IN DBL METADATA 2.2
===================

**/DBLMetadata/identification/canonSpec** (0 or 1)

   * **@type** (Exactly 1 string)

      * The overall structure and order of this canon. (OT+ here means canonical and deuterocanonical OT books interleaved within the same section, like most Catholic Bibles)

         * Enum:

            * OT

            * OT+

            * DC

            * NT

            * OT, NT

            * OT+, NT

            * OT, NT, DC

            * OT, DC, NT

   * **component** (1 or more string)

      * The components of this canon, which should match the canon type chosen above. eg, if the canon type is "0T, NT", there should be one OT and one NT component here.

         * Enum:

            * armenianApostolicDC

            * armenianApostolicOT

            * armenianApostolicOT2

            * armenianClassicalOT

            * armenianNT

            * catholicAndAnglicanDC

            * catholicLxxDC

            * catholicLxxOT

            * catholicLxxSeparatedDC

            * catholicPlusLutheranDC

            * catholicVulgateDC

            * catholicVulgateOT

            * catholicVulgateSeparatedDC

            * czechKralickaDC

            * danishLutheranDC

            * ethiopianOrthodoxDC

            * ethiopianOrthodoxNT

            * ethiopianOrthodoxOT

            * ethiopianProtestantNT

            * ethiopianProtestantOT

            * georgianOrthodoxDC

            * georgianOrthodoxOT

            * georgianOrthodoxOT2

            * georgianSynodalDC

            * germanLutheranDC

            * greekOrthodoxDC

            * greekOrthodoxOT

            * kjvDC

            * kjvNonDC

            * lutheranNT

            * romanianOrthodoxDC

            * romanianOrthodoxOT

            * russianNT

            * russianOrthodoxDC

            * russianOrthodoxOT

            * russianProtestantOT

            * russianSynodalDC

            * syriacNT

            * syriacOT

            * tanakhOT

            * turkishInterconfessionalDC

            * vulgateCatholicBible

            * westernInterconfessionalDC

            * westernInterconfessionalDC2

            * westernNT

            * westernOT

========================
PROPOSED CHANGES FOR 2.3
========================

========================================
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
========================================
