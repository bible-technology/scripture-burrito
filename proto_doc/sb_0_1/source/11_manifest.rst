########
MANIFEST
########

************************
PROPOSED CHANGES FOR 0.1
************************

=======================
Drop progress attribute
=======================

This was one of two mechanisms for tracking progress which was never used.

======================
Tighten checksum regex
======================

The regex currently allows S3 part suffixes which should never have been present in any metadata.

===============
Drop containers
===============

ie the manifest should always be a flat list of resources with fully-qualified uris.

=======================
manifest => ingredients
=======================

======================
resource => ingredient
======================

Apart from pushing the burrito metaphor a little further, the word "resource" is unhelpfully
overloaded, so a specific term seems preferable.

============================
Add optional scope attribute
============================

This attribute replaces the role attribute for publications. It is intended to provide scripture references or labels for frontmatter or backmatter. More general
file type information should now be represented using the existing mimetype attribute.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None
