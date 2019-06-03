####
TYPE
####

************************
PROPOSED CHANGES FOR 0.1
************************

==========================
isTranslation => hasSource
==========================

=============================
isExpression => isPublishable
=============================

===================
hasCanonicalContent
===================

The isTranslation/isExpression mechanism is used within the schema to toggle various features. It was originally designed for the publication-oriented
world of DBL, at a time when DBL was quite text-centric. Scripture Burrito brings Bible-lifespan requirements, and DBL is now handling many different
types of content, most of which have their own lifespan. The new terms are more generic.

For example, print entries currently contain POD-oriented PDFs, with optional InDesign sources, and all print entries are assumed to be "publishable".
In SB 0.1, a print entry might set hasSource and clear isPublishable. The source section would include Adobe Tagged Text (reflowable, formatted text)
or RTF, and there would be no PDF.

The new hasCanonicalContent flag provides a generic way to distinguish between burrito flavors that contain Scripture versus those that contain para-scriptural
content such as commentaries or versifications.

================
medium => flavor
================

Medium is an overloaded term, creating confusion with "mimetype of a file", so a specific and (at a stretch) burrito-related term seems preferable.

==========
x-* flavor
==========

This is intended to allow experimentation with new burrito flavors. For x-* flavors, all values should be allowed for other type elements, and no
constraints should be placed on the content of the format section.

==============================
REAP-compatible isConfidential
==============================

Apparently REAP uses more than two states to represent the degree of confidentiality of a project. It would
make sense for DBL to use the same system. It will be quite important to make sure that migration does not
make previously confidential projects visible.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.