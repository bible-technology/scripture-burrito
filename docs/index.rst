.. You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Scripture Burrito Documentation
===============================

.. image:: ../logo/burrito_logo.png

This is the official documentation for the evolving Scripture Burrito standard. See the development `milestones here <https://github.com/bible-technology/scripture-burrito/milestones>`_).

**This is 0.3.0-alpha** based on `JSON Schema <https://json-schema.org/>`_.

Feedback
--------

Feedback may be provided via the `Technology.Bible forum <https://technology.bible/c/sb>`_ or via the `Scripture Burrito Github issues <https://github.com/bible-technology/scripture-burrito/issues>`_.

The :ref:`committee` invites comments on all aspects of this documentation, but has identified some specific issues about which decisions need to be taken:

JSON only for metadata
......................

The 0.1.0 specification was based on an XML schema for metadata with a JSON representation. However, the goal for **0.2.0** was to switch to `JSON Schema <https://json-schema.org/>`_ as the only representation of the metadata. This transition is now completed and 0.2.0-beta.2 represents this change.

Confidentiality Options
.......................

The :ref:`schema_docs-confidentiality` section includes three options, 1. unrestricted, 2. restricted, 3. private. Please comment on `issue #90 <https://github.com/bible-technology/scripture-burrito/issues/90>`_ if you have a use case which is not covered by this enum.

MD5 Checksums
.............

For ingredient (file) checksums we are using the dated MD5 hashing algorithm. See `our discussion <https://github.com/bible-technology/scripture-burrito/issues/115>`_ about this issue. Please open an issue to let us know if this will be problematic for your use case.

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
   glossary
