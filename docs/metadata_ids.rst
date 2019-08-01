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

   sburrito:<namespace ID>:<namespace-specific string>

where

* "namespace ID" is case-insensitive and matches:

.. code-block:: none

   [0-9a-zA-Z][0-9a-zA-Z\-]{1,31}


* "namespace-specific string" is case-sensitive and matches:

.. code-block:: none

   ([0-9A-Za-z\\,\-.+*=@;$_!'])+(:([0-9A-Za-z\\,\-.+*=@;$_!'])+)*

IDs in this format can be tested for prefixedness (?!) by searching for ``sburrito:([a-zA-Z0-9\-]+):.*``.
