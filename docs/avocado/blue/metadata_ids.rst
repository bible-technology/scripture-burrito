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

ID Syntax
=========

This is surprisingly challenging since

* we need to allow for a wide range of ids from diverse systems

* we need to be able to distinguish prefixes from the start of an unqualified idServer

The syntax follows the Universal Resource Name scheme as documented in RFC2141_

.. _RFC2141: https://tools.ietf.org/html/rfc2141
.. _RFC1737: https://tools.ietf.org/html/rfc1737

The syntax is

.. code-block:: none

   urn:<namespace ID>:<namespace-specific string>

where

* "namespace ID" is case-insensitive and matches

.. code-block:: none

   [0-9a-zA-Z][0-9a-zA-Z\-]{1,31}


* "namespace-specific string" is case-sensitive and matches (as defined in RFC2141_ §2.2, with rationale in RFC1737_)

.. code-block:: none

   [0-9A-Za-z\(\)\,\-\.\+\*:=@;$_!']

IDs in this format can be tested for prefixedness (?!) by searching for ``urn:([a-zA-Z0-9\-]+):.*``.
