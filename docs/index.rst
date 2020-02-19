.. You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Scripture Burrito Documentation
===============================

.. image:: ../logo/burrito_logo.png

This is the official documentation for the evolving Scripture Burrito standard. We are building toward **0.2.0**, see the `milestones here <https://github.com/bible-technology/scripture-burrito/milestones>`_).

**Warning: the 0.1.0 schema was XML based, however, we are pivoting to** `JSON Schema <https://json-schema.org/>`_ **as the only representation of the metadata in 0.2.0.**

Feedback
--------

Feedback may be provided via the `Technology.Bible forum <https://technology.bible/c/sb>`_ or via the `Scripture Burrito Github issues <https://github.com/bible-technology/scripture-burrito/issues>`_.

The :ref:`committee` invites comments on all aspects of this documentation, but has identified some specific issues about which decisions need to be taken:

JSON only for metadata
......................

The 0.1.0 specification was based on an XML schema for metadata with a JSON representation. However, the goal for **0.2.0** is to switch to `JSON Schema <https://json-schema.org/>`_ as the only representation of the metadata. You may discuss this on the `Technology.Bible forum <https://technology.bible/c/sb>`_ or on `Issue #70 <https://github.com/bible-technology/scripture-burrito/issues/70>`_.


USFM and USX for Scripture Text
...............................

The current proposal is based on the Digital Bible Library, which chose USX because it can be validated rigorously. As a result of this choice, several large publishing workflows including
YouVersion and API.Bible use USX.

Much of the Bible translation world uses USFM, which is familiar to
Bible translators, but which requires bespoke parsing tools, and which can be ambiguous in some circumstances. Also, USX contains machine-readable reference information that cannot be represented
in USFM at this time. Valid USFM can be round-tripped to USX. USX cannot be round-tripped to USFM without losing the machine-readable references. Invalid USFM may not have an equivalent
representation in USX.

Paratext currently uses both USFM and USX internally at various points.

The committee's current proposal is

* USFM for translations in progress

* USX for valid content, orientated towards publication (incremental or otherwise)

The committee would appreciate proposals for constructive and technically feasible alternatives.

Content
=======

.. toctree::
   :maxdepth: 4

   introduction/index
   schema_docs/index
   flavors/index
   examples/index
