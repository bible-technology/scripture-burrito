.. _schema_docs-design:

##############
Overall Design
##############

The design of the DBL Metadata schema has evolved as several curators have made changes to meet new needs.
Scripture Burrito metadata largely follows the design philosophy of DBL Metadata v2.2.

.. _schema_docs-design-flavortype:

Document "Shape" Determined by Type Elements
============================================

Scripture Burrito flavors are subdivided into four flavorTypes, on the basis of (roughly) how similar to Scripture they are.

* scripture

* gloss

* parascriptural

* peripheral.

The diagram below illustrates the logic behind the four flavorTypes - see also the detailed schema documentation. On a technical level, the more Scripture-like flavorTypes require more metadata, and specific ecosystems, applications and tool chains may only accept certain flavorTypes.

.. image:: ../images/which_flavortype.png

These flavorTypes are then subclassed into various flavors, as illustrated:

.. image:: https://user-images.githubusercontent.com/107731/62296968-3a43ba80-b43e-11e9-8a6b-f1d8982edb2a.jpeg

Metadata Filename
=================

A Scripture Burrito can exist in multiple data formats. By convention, when the metdata is written to disk it should be in a file with the name of ``metadata.json`` at the **root** level of the Burrito.

File Encoding
=============

Files contained in a burrito should be enocded as UTF-8. Note that the `Unicode standard version 5 <http://www.unicode.org/versions/Unicode5.0.0/bookmarks.html>`_ notes the following about using the Byte order mark (BOM):

    Use of a BOM is neither required nor recommended for UTF-8, but may be encountered in contexts where UTF-8 data is converted from other encoding forms that use a BOM or where the BOM is used as a UTF-8 signature.


Flavor-Specific Details in One Known Location
=============================================

Most of the schema applies to all flavors of burrito. Flags and enums in the type section toggle various sets of functionality in a generic way.
Flavor-specific content is located in

* metadata/type/flavorDetails


Publications Inherit Burrito Properties
=======================================

The identification section contains many Dublin Core-inspired fields that relate to the Burrito as a whole. Similarly-named fields also exist,
optionally, within each publication. The fields in the identification section are assumed to apply to the publication unless alternative values
are specifically specified within the publication. Duplicate values between the identification and publication sections are legal but discouraged,
as human editing tends to result in unintended skew between the previously-identical values.

Versioning
==========

The Scripture Burrito specification follows `semantic versioning <http://semver.org>`_. The following clarify how we implement that in the specification:

* SB schema 1.0.x will be able to validate 1.0.y for any value of x >= y.
* SB schema 1.1.x is a whole new schema and will not validate 1.0.x.

Development
-----------

The follow phases are defined for our schema development process:

* The ``develop`` branch represents the first public working draft
* A Beta release (``-beta``) represents a working draft
* A Release Candidate (``rc``) represents a candidate recommendation
* A release represents a recommendation to implement
