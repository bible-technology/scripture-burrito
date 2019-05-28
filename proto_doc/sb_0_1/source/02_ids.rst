###
IDs
###

************************
PROPOSED CHANGES FOR 0.1
************************

==============================
Required idServer declarations
==============================

These appear as the first children of the root element, eg

.. code-block:: xml

    <idServer prefix="dbl">https://thedigitalbiblelibrary.org</idServer>
    <idServer default="true">http://atlantisbibleconsortium.net</idServer>
    <idServer prefix="myServer" local="true">http://localhost::8080</idServer>

* At least one idServer element is required

* The element must contain either a 'prefix' or a 'default="true"' attribute. (It may contain both, and only one idServer may be the default.) The default, if present, will be assumed to apply to namespaces with no prefix.

* The element may contain a 'local' attribute. When true, this signifies that the ids are for internal use only, and that they should be stripped before export.

* The enclosed text is a URI. In schema this means "pretty much any string", but using URLs that resolve to a server endpoint would help with discoverability.

If there is no default idServer, all ids in the document must be prefixed.

=========
ID Syntax
=========

(<prefix>::)?<id>

where

* "prefix" is a NCName (an XML name with no colon)

* "id" matches

.. code-block:: none

    [0-9A-Za-z]([0-9A-Za-z_-]{0,30}[0-9A-Za-z])?

ie a string starting and ending with an alphanumeric character and containing alphanumeric characters, hyphens and underscores.

IDs in this format can be tested for prefixedness (?!) by searching for "::", a substring which seems unlikely to occur in any existing id schemes.

===============
Revision Syntax
===============

The non-prefixed ID regex above ought to allow DBL (numeric) and PT/uW (UUID) revision/commit identifiers.

==============
Expose User ID
==============

This should happen anywhere that the metadata refers to a person by name. It probably needs to be optional since it may not be possible to recover this information retrospectively.

==================
Expose License ids
==================

This would be part of the new license subsection.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None
