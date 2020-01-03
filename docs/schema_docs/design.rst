##############
Overall Design
##############

The design of the DBL Metadata schema has evolved as several curators have made changes to meet new needs.
Scripture Burrito metadata largely follows the design philosophy of DBL Metadata v2.2.

Document "Shape" Determined by Type Elements
============================================

The flavorType element specifies one of four basic document types:

* scripture

* gloss

* parascriptural

* peripheral.

The flavorType plus other flags and enums in the :ref:`metadata_type` make various parts of the generic metadata
required, optional, or illegal. This mechanism means that a document processor can make assumptions about the "shape" of the document without necessarily
having any information about the precise flavor it is processing. This is useful for cataloguing and for handling x- extensions.

Here is a visual overview of the design:

.. image:: https://user-images.githubusercontent.com/107731/62296968-3a43ba80-b43e-11e9-8a6b-f1d8982edb2a.jpeg


Flavor-Specific Details in One Known Location
=============================================

Most of the schema applies to all flavors of burrito. Flags and enums in the type section toggle various sets of functionality in a generic way.
Flavor-specific content is located in

* metadata/type/flavorDetails

No Namespaces
=============

All Scripture Burrito metadata is in the null namespace, to simplify the processing model (given that not every Burrito user will be an XML power user.)

camelCase
=========

So not hyphenated-names or underscored_names.

Most Content in Text, not Attributes
====================================

This is partly a stylistic choice, but it also reflects the need to handle a wide range of UTF-8 characters in many fields. (It is considered bad practice
to put localized strings into attributes.) Attributes are mainly used as qualifiers for the "main" content.

Few Empty Elements, Many Optional Elements
==========================================

The children of most root elements (identification, format, etc) are required. Many elements below that level are optional but, if they are present, they must
contain content. This is to avoid confusion between a value that is unspecified and a value that is specified as an empty string. So

.. code-block:: xml

   <name lang="eng">The Holy Bible</name>
   <name lang="fra">La Sainte Bible</name>

is permitted, as is

.. code-block:: xml

   <name lang="eng">The Holy Bible</name>
   <!-- No localized name -->

but

.. code-block:: xml

   <name lang="eng">The Holy Bible</name>
   <name lang="fra"/>

is not permitted.

Order is Generally Unimportant
==============================

Most elements at all levels can appear in any order (or *interleaved*, in the terms of XML schema). Exceptions include a few elements that must appear
as the first children of the root element and publication structures which communicate a specific content order.

Publications Inherit Burrito Properties
=======================================

The identification section contains many Dublin Core-inspired fields that relate to the Burrito as a whole. Similarly-named fields also exist,
optionally, within each publication. The fields in the identification section are assumed to apply to the publication unless alternative values
are specifically specified within the publication. Duplicate values between the identification and publication sections are legal but discouraged,
as human editing tends to result in unintended skew between the previously-identical values.
