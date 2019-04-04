########
MANIFEST
########

*******************
IN DBL METADATA 2.2
*******************

* **manifest** (exactly 1 string)

    * contains one or more **container** or **resource**

* **container**

    * **@uri** (exactly 1 string)

        * The URI of this container, relative to any uris specified in ancestor containers

        * type xsd:anyUri

    * contains one or more **container** or **resource**

* **resource**

    * **@uri** (exactly 1 string)

        * The URI of this container, relative to any uris specified in ancestor containers

        * type xsd:anyUri

    * **size** (exactly one positive integer)

        * The size of the resource in bytes

    * **checksum** (0 or 1 string)

        * The MD5 checksum of the resource

        * ::

            regex: [a-f0-9]{32}(\-\d+)?"

    * **mimeType** (0 or 1 string)

        * The mimetype of the resource

        * ::

            regex: [\-a-z0-9]+/[\-a-z0-9+]+"

    * **progress** (0 or 1 positive integer)

        * An alternative, unused way to track progress in DBL

        * range: 1-999

************************
PROPOSED CHANGES FOR 2.3
************************

=======================
Drop progress attribute
=======================

======================
Tighten checksum regex
======================

The regex currently allows S3 part suffixes which should never have been present in any metadata.

============================
Consider dropping containers
============================

Containers provide a hierarchical alternative to a flat list of resources with fully-qualified uris. The flat
version is easier for most processing scenarios, and both the DBL server and Nathanael coerce the manifest data into
this format. Supporting containers means that all compliant technologies need to be able to handle both the flat and
hierarchical variants. However, the hierarchical form is much easier for humans to create and maintain.

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************

None
