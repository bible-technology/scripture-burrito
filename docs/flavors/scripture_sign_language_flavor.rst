.. _scripture_sign_langauge_flavor:

#######################
Scripture Sign Language
#######################

======
Status
======

The Scripture Sign Language flavor is based on the Digital Bible Library's video entry type. This DBL type was initially imagined as a catch-all solution for Scripture-related video. In practice, all video in DBL to date has been for sign language projects. Scripture Burrito treats sign language projects as a first-class flavor, in order to address issues specific to sign language.

For publication of these entries - as for other entry types - it is crucial to have metadata that enables website or app creators to assemble the components in a meaningful way without understanding the sign language itself. As a first attempt to support this, Scripture Burrito supports sign language-specific roles for signs, concepts and places, which are illustrated in the example document.

At present there are no plans to include source files for sign language, since these are potentially huge and are typically managed within proprietary software.

=======
Content
=======

* mp4 files for canonical and peripheral material.

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

---------
container
---------

This element has the value "MP4".

---------
timingDir
---------

This optional element provides a path to the "directory" containing timing files.

-----------
videoStream
-----------

This element contains:

* a codec element

* the bit rate

* the frameRate

* the screen resolution

-----------
audioStream
-----------

This optional source element provides the following information about the audio stream within the container:

* compression (mp3 or wav)

* track configuration

* optionally, the bit rate

* optionally, the bit depth

* optionally, the sampling rate

--------------
subtitleStream
--------------
This optional element is currently empty pending input as to the parameters of subtitle streams.

===========
Conventions
===========

-------------------------
contentResourcesByChapter
-------------------------

If present, this confirms that all canonical video files correspond to exactly one chapter. If absent, each video file may correpond to a section or a non-contiguous selection of verses. This latter scenario is particularly important for story-based projects.

--------
bookDirs
--------

The de facto DBL structure for video is based on that of audio entries. There is one "directory" per book, where each directory contains one "file" per chapter, with names derived from Paratext book names. When present, this convention confirms that the historical DBL structure has been respected. When absent, this structure may or may not be partially or fully respected. (The structure is not strictly required because the metadata provides locations and roles of resources explicitly, but some tool chains have relied on the well-known directory structure.)

-----------
rolesInUris
-----------

This is an emerging Nathanael convention whereby the role of file is encoded in the filenames. (This enables Nathanael to set up roles without any UX.) When present, this convention confirms that this naming scheme has been respected. When absent, the naming scheme may or may not have been fully or partially respected.
