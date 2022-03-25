.. _scriptural_braille_flavor:

#################
Scripture Braille
#################

======
Status
======

The Scripture Text flavor is based on the Digital Bible Library's text entry type. DBL developed the metadata and content formats in close collaboration with Compass Braille (https://www.compassbraille.org/), a British registered charity that has produced most of the braille editions of United Bible Societies texts.

The metadata format closely reflects Compass Braille's current tool chain, to a point where that metadata can be used to generate a braille entry from a DBL text entry. The next step is to consult with other braille Bible stakeholders in order to incorporate their needs.

=======
Content
=======

* Ready-to-emboss braille volumes in Portable Embosser Format, an XML vocabulary (http://pef-format.org/) based on braille unicode.

* Source files in Bible Braille Markup (BBM), which is PEF plus namespaced extensions which are intended to permit last-resort reflowing of PEF.

=======================
Metadata Flavor Details
=======================

The following description gives a high-level overview. Further details can be seen in the example document and the schema.

------------
isContracted
------------

This element contains a boolean which denotes whether the braille transliteration includes contractions.

----------------
brailleConvertor
----------------

This element describes the transliteration engine used. It is always liblouis (http://liblouis.org/) in the case of Compass.

---------------------
hyphenationDictionary
---------------------

This element describes the hyphenation dictionary used. Compass uses the Open Office format for hyphenation dictionaries.

----------
numberSign
----------

This element describes the way numbers are rendered, in the body of the text and in navigational aids.

----------------
continuousPoetry
----------------

This optional element describes how poetry sections should be formatted.

-------
content
-------

This element describes which non-canonical content should be included.

----
page
----

This element describes the physical page layout.

===========
Conventions
===========

None.
