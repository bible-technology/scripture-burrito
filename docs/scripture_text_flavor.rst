##############
Scripture Text
##############

======
Status
======

The Scripture Text flavor is based on the Digital Bible Library's text entry type, which was in turn based on Paratext's project format. As of August 2019, DBL "text bundles" have been used to represent over 2300 translation projects in over 1500 languages. These bundles are consumed by many publisher-facing tool chains, including YouVersion and Global.Bible.

The vast majority of text entries in DBL were uploaded by Paratext. Each entry includes

* a "release" section which provides one USX file per book plus a few files in other formats

* a "source" section, only visible to the entry owner, which contains a dump of the Paratext project in a zip file.

The Scripture Burrito scriptureText flavor follows this approach, but (conceptually) unpacks the source zip file to make source content easier to catalog and to use.

=======
Content
=======

-------------------------
Derived from DBL "source"
-------------------------

* One USFM file per Paratext "book" (ie canonical book, but also frontmatter, backmatter, etc)

* BookNames.xml (????)

* CheckingStatus.xml (???)

* CommentTags.xml (???)

* ErrorDenials.xml (???)

* hyphenatedWords.txt (???)

* ProjectProgress.xml (???)

* ProjectUpdates.xml (???)

* ProjectUserAccess.xml (???)

* Settings.xml (???)

* SpellingStatus.xml (???)

* TermRenderings.xml (???)

* custom.sty - a stylesheet for rendering SFM according to user preferences

* custom.json - the content of Paratext's custom.vrs file, rendered as JSON as for the peripheralVersification flavor

* \*.ldml files (???)

* license.json (???)

--------------------------
Derived from DBL "release"
--------------------------

* One USX file per Paratext "book" (ie canonical book, but also frontmatter, backmatter, etc)

* \*.ldml (???)

* styles.xml - a stylesheet for rendering SFM according to user preferences

* versification.json - the equivalent of DBL's versification.vrs file, which is a consolidated versification scheme for the translation based on the "org" versification scheme.

* optionally, fonts

=======================
Metadata Flavor Details
=======================

-----------
projectType
-----------

This is one of

* standard

* daughter

* studyBible

* studyBibleAdditions

* backTranslation

* auxiliary

* transliterationManual

* transliterationWithEncoder

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

-----------
usfmVersion
-----------

The schema version of USFM and/or USX in the burrito (currently expected to be v3.0)

===========
Conventions
===========

-------
usxDirs
-------

With DBL metadata 2.x, Paratext uploads USX organized into one directory per publication, named USX_<n> (where n is, eg, "1" if the publication id is "p1") This structure means that identical USX files may be stored multiple times and, even in DBL metadata 2.x, publication ids are not necessarily numeric.

With DBL metadata 2.x, USX filenames have the form XYZ.usx, where XYZ is an upper case Paratext book code. Only canonical books are included in the USX.

When present, this convention confirms that the historical DBL structure has been respected. When absent, this structure may or may not be partially or fully respected. (The structure is not strictly required because the metadata provides locations and roles of resources explicitly, but some tool chains have relied on the well-known directory structure.)

-------
usxRefs
-------

Paratext provides references within USX in a language-independent, machine-friendly format, via parsing based on many settings within Paratext. This feature has proved extremely useful for producing ePubs, web pages and for other applications where references are treated as hyperlinks.

When present, this convention confirms that machine-readable references has been provided in the USX. When absent, machine-readable references may or may not be present.

-------------------------
typesetAsVersedParagraphs
-------------------------

This convention informs consumers of the burrito, in a production context, that the content should be formatted with each verse or verse range as a separate paragraph, regardless of the position of paragraph breaks in the USX. The absence of this convention implies that consumers should respect the USX paragraph breaks.