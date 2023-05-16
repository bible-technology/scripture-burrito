.. _scripture_audio_flavor:

###############
Scripture Audio
###############

======
Status
======

This flavor is in **beta** and we are actively seeking feedback.

=======
History
=======

The Scripture Audio flavor is based on the Digital Bible Library's audio entry type. As of August 2019, DBL "audio bundles" have been used to represent over 1100 audio projects in over 750 languages. These bundles are consumed by many publisher-facing tool chains, including YouVersion and Megavoice.

Initially, audio was uploaded to DBL via Paratext. Recently, this feature has been removed from Paratext in favour of Nathanael, a desktop application maintained by DBL which facilites non-text uploads and downloads. A significant number of DBL audio entries were created via a batch import from Faith Comes By Hearing's Digital Bible Platform.

=======
Content
=======

DBL stores one mp3 file per chapter. An option to store "source" wav files has recently been added.

=======================
Metadata Flavor Details
=======================

---------------
translationType
---------------

This is one of

* First

* New

* Revision

* Study / Help Material

--------
audience
--------

This is one of

* Basic

* Common

* Common - Literary

* Literary

* Liturgical

* Children

-------------
dramatization
-------------

This is one of

* Dramatized

* Non-Dramatized

* Single-Voice

---------
timingDir
---------

This optional element provides a path to the "directory" containing timing files.

-----------------
Source properties
-----------------

An optional source element provides the following information:

* compression (mp3 or wav)

* track configuration

* optionally, the bit rate

* optionally, the bit depth

* optionally, the sampling rate

---------------------
Production properties
---------------------

An optional production element provides similar information to the source element, for the production files.

===========
Conventions
===========

-------------------------
contentResourcesByChapter
-------------------------

If present, this confirms that all audio files correspond to exactly one chapter. If absent, each audio file may correpond to a section or a non-contiguous selection of verses. This latter scenario is particularly important for story-based projects.

--------
bookDirs
--------

The de facto DBL structure of audio entries was defined by the original Paratext audio uploader. There is one "directory" per book, where each directory contains one "file" per chapter, with names derived from Paratext book names. When present, this convention confirms that the historical DBL structure has been respected. When absent, this structure may or may not be partially or fully respected. (The structure is not strictly required because the metadata provides locations and roles of resources explicitly, but some tool chains have relied on the well-known directory structure.)
