##############
IDENTIFICATION
##############

****************
TOP-LEVEL FIELDS
****************

========================
PROPOSED CHANGES FOR 0.1
========================

----------------------------------------------------------------
Replace english/Local fields with elements qualified by language
----------------------------------------------------------------

eg

.. code-block:: xml

   <name lang="en">...</name>
   <name lang="fr">...</name>

Affected fields include

   * name/nameLocal

   * description/descriptionLocal

   * abbreviation/abbreviationLocal

-------
basedOn
-------

This identifies the snapshot on which the entry is based, which might be from a different ecosystem. This information is potentially
useful for forensics. It also provides a mechanism for 3-way diffing of documents when the two deltas are from different ecosystems.

.. code-block:: xml

   <basedOn type="dbl">
      <id>482ddd53705278cc</id>
      <revision>1</revision>
   </basedOn>

-----------------------------------
Replace scope with canonicalContent
-----------------------------------

Scope does not have enough options to describe all projects. In addition, it is unclear whether the scope describes the books actually present (impossible
with an enum for incremental publishing) or the intended final scope of the project (which is a somewhat existential concept). Including a global
canonicalContent section, as currently exists in publications, for a whole entry, provides scope information in a more flexible and transparent way.

==========================
ISSUES TO CONSIDER FOR 0.2
==========================

None

********
systemId
********

========================
PROPOSED CHANGES FOR 0.1
========================

--------------------
Add DBL type ("dbl")
--------------------

This is required to make the document structure orthogonal.

-----------------------------
Add other known organizations
-----------------------------

* Paratext ecosystem ("ptx")
* Unfolding Word ("uword")
* Vachan Online ("vachan")

-----------------
Support x-* types
-----------------

The systemId type mechanism was created when DBL needed to work with a small number of large ecosystems.
Future ecosystems may be small – maybe a national denomination or even one church. It may not always make sense to add such organizations
to the schema and, when it does, this will take some time. Some  architectures involve local servers (on a VPN, an intranet or even localhost),
and testing sometimes requires server changes. Supporting types matching

.. code-block

   x-[a-z]{1,}

provides a way to introduce new or private ecosystems without rewriting schema:

.. code-block:: xml

   <idServer prefix="mvah">https://markspersonaltranslationproject.fr</idServer>
   ...
   <systemId type="x-mvah">
      <id>idInMyPersonalFormat</id>
      <myDetail>something-that-interests-me</myDetail>
   </systemId>

The type of all x-* systemIds should correspond to an idServer declaration.

========================================
ISSUES TO CONSIDER FOR 0.2
========================================

None.

*********
canonSpec
*********

========================
PROPOSED CHANGES FOR 0.1
========================

-------------------------
Remove the .*2 components
-------------------------

These variants of three components correspond to longstanding inconsistencies in the Canons.xml file, caused by inconsistent
use of DAN/DAG and EST/ESG in canons of different scope for the same tradition (eg the OT part of the Armenian Bible canon does
not match the Armenian OT canon). Also, there is no JER in the Greek Orthodox canon.

------------------
Remove DAG and ESG
------------------

These Greek variants of DAN and EST are not used consistently, and make canon management harder (since, for any Catholic or Orthodox project, there are 4 possible permutations of DAN/DAG and EST/ESG). It seems preferable to get the structure of books from the versification file.

==========================
ISSUES TO CONSIDER FOR 0.2
==========================

-----------------
Develop canonSpec
-----------------

One day, canonSpecs should be able to use custom components, which begs the question of where and how those components would be defined. eg would we do
everything inline within the metadata file (easy to create, hard to reuse) or would components be declared separately (easier to reuse, share between
users, etc, but assumes an ecosystem).
