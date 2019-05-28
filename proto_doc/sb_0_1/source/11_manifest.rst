########
MANIFEST
########

************************
PROPOSED CHANGES FOR 0.1
************************

=======================
Drop progress attribute
=======================

======================
Tighten checksum regex
======================

The regex currently allows S3 part suffixes which should never have been present in any metadata.

===============
Drop containers
===============

ie the manifest should always be a flat list of resources with fully-qualified uris.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None
