########
AGENCIES
########

************************
PROPOSED CHANGES FOR 0.1
************************

----------------------------------------------------------
Allow multiple name elements, each with language attribute
----------------------------------------------------------

See the identification section.

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

The proposal is to make all fields optional when revision > 1, to reduce boilerplate and to not create
false expectations about what may be changed via the client.

--------------------------------------
contributor/content should be optional
--------------------------------------

This is the only role-type field that is required for contributors, and was probably a typo in the schema.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None
