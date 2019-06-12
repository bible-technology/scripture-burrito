###
IDs
###

Whose ID for What Entities?
===========================

IDs are needed for

* organizations (rights holders, contributors...)

* users (archivists, burrito creators...)

Each ID identifies the user or organization within a server ecosystem. There are many possible ecosystems and
several of these ecosystems may provide IDs within a single metadata document.

ID Syntax
=========

This is surprisingly challenging since

* we need to allow for a wide range of ids from diverse systems

* we need to be able to distinguish prefixes from the start of an unqualified idServer

* it is considered a bad id to use XML namespace-like notation for things that are not XML namespaces (ie no single colons)

The syntax is

.. code-block: none

   (<prefix>::)?<id>

where

* "prefix" is a NCName (an XML name-like thing with no colon)

* "id" matches

.. code-block:: none

   [0-9A-Za-z]([0-9A-Za-z_-]{0,30}[0-9A-Za-z])?

ie a string starting and ending with an alphanumeric character and containing alphanumeric characters, hyphens and underscores.

IDs in this format can be tested for prefixedness (?!) by searching for "::", which seems unlikely to occur in any existing id schemes.
