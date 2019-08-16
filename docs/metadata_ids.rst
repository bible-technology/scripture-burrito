.. _metadata_ids:

###
IDs
###

Whose ID for What Entities?
===========================

IDs are needed for

* the root-level document identifier

* organizations (rights holders, contributors...)

* users (archivists, burrito creators...)

Each ID identifies the user or organization within a server ecosystem. There are many possible ecosystems and
several of these ecosystems may provide IDs within a single metadata document.

.. _metadata_ids-id-syntax:

ID Syntax
=========

The syntax is:

.. code-block:: none

   <idServer prefix>::<idServer-specific string>

where

* "idServer prefix" is case-insensitive, is declared in an idServer element within the document and matches

.. code-block:: none

   [0-9a-zA-Z][0-9a-zA-Z\-]{1,31}

* "idServer-specific string" is case-sensitive and contains one or more non-space character

IDs in this format can be tested for prefixedness (?!) by searching for ``([a-zA-Z0-9\-]+)::.+``.
