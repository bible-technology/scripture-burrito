################
THE ROOT ELEMENT
################

*******************
IN DBL METADATA 2.2
*******************

.. code-block:: xml

    <DBLMetadata version="2.2" id="9f78f34aabe691c9" revision="3">

* The root element name is DBLMetadata in the null namespace (ie no namespace is declared for the root element).

* @version is required and can be 2.1, 2.1.1 or 2.2.

* @id (required) is the DBL entry id (16 chars hex)

* @revision (required) is the revision number (a positive integer)


************************
PROPOSED CHANGES FOR 2.3
************************

* @version must be 2.3 (since there are breaking changes)

* @id regex should be expanded to allow optional prefixes and other formats of id. (We can do this so that unqualified ids must match DBL's strict regex)

* @revision should be expanded to allow Mercurial and Git commit ids. (We can do this so that unqualified ids must match DBL's strict regex)

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************

=================
Root element name
=================

The name should have something to do with Scripture Burrito, and we should probably state that it's for metadata since, sooner or later, there will be
other Scripture Burrito schema.

The name should remain in the null namespace to lower processing barriers for what the XML spec describes as "the desperate Perl programmer". so

* SBMetadata?

* ScriptureMetadata?

* ScriptureBurritoMetadata?

======================
@revision ==> @commit?
======================

Maybe not, if "revision" is a more neutral term than "commit".

==================================
@id and @revision in root element?
==================================

In Scripture Burrito we may have multiple ids for a snapshot, and DBL may not be in any sense the primary id. There are at least two ways to represent this:

* One id/revision can be placed in the root element, with the others in systemId

* No ids/revisions are placed in the root element, with all such data in systemId

The second option is more orthogonal. However, having basic identification info at the top of the document makes eyeballing easy and is also extremely convenient for
streaming processors such as SAX. (Briefly, it's nice to know early on what you are processing, where you might store it, etc.) The first option would imply multiple
ways to represent the same set of ids, with the possibility of rotating any systemId into the root element.
