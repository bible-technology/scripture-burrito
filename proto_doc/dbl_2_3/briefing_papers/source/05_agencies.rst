########
AGENCIES
########

*******************
IN DBL METADATA 2.2
*******************

**/DBLMetadata/agencies** (Exactly 1)

   * **/DBLMetadata/agencies/rightsHolder** (1 or more)

      * **uid** (Exactly 1 string key)

         * The id of this rights holder

            * regex: [a-f0-9]{24}

      * **name** (Exactly 1 string)

         * The name in English of this rights holder

            * regex: \S.*\S

      * **nameLocal** (0 or 1 string)

         * The local name of this rights holder

            * regex: \S.*\S

      * **abbr** (Exactly 1 string)

         * The abbreviation of this rights holder

            * regex: \S.*\S

      * **url** (0 or 1 string)

         * The URL of this rights holder

            * regex: \S.*\S

   * **/DBLMetadata/agencies/contributor** (1 or more)

      * **uid** (Exactly 1 string key)

         * The id of this contributor

            * regex: [a-f0-9]{24}

      * **name** (Exactly 1 string)

         * The name of this contributor

            * regex: \S.*\S

      * **content** (Exactly 1 boolean)

         * Contributes to Content?

      * **finance** (0 or 1 boolean)

         * Contributes to Finance?

      * **management** (0 or 1 boolean)

         * Contributes to Management?

      * **qa** (0 or 1 boolean)

         * Contributes to Quality Assurance?

      * **publication** (0 or 1 boolean)

         * Contributes to publication?

   * **/DBLMetadata/agencies/rightsAdmin** (0 or 1)

      * **uid** (Exactly 1 string key)

         * The id of this rights administrator (24 chars of hex)

            * regex: [a-f0-9]{24}

      * **name** (Exactly 1 string)

         * The name of this rights administrator

            * regex: \S.*\S

      * **url** (0 or 1 string)

         * The URL of this rights administrator

            * regex: \S.*\S

************************
PROPOSED CHANGES FOR 2.3
************************

-------------------------
Multiple \*Local elements
-------------------------

* allow multiple instances of nameLocal? (Currently no nameLocal.)

-----------------------------------------
Less compulsory fields for upload variant
-----------------------------------------

Some background... DBL Metadata is used as the basis of the job spec at the heart of uploading. In this
variant more values are optional - notably @revision since this will be overwritten by
the server in any case.

Right now, all the denormalized fields in the agencies section are required. However, the uids in the agencies
section may only be changed via the DBL website, ie revisions
attempting to change ownership will be rejected. This means that clients need to generate a lot of boilerplate,
some of which has to be identical to the information on the server, and some of which is not validated for coherence
by the server. So, eg, it is currently possible to change the name and url of a rightsHolder but not the uid, which
is a recipe for utter confusion.

The proposal is to make many or maybe all fields optional when revision > 1, to reduce boilerplate and to not create
false expectations about what may be changed via the client.

--------------------------------------
contributor/content should be optional
--------------------------------------

This is the only role-type field that is required for contributors, and was probably a typo in the schema.

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************

Proper support for public licenses may have implications here.
