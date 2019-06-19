########################
The Publications Section
########################

All publication types may include one publications element which, if present, must contain at least one publication element.

.. code-block:: xml

    <publications>
        <publication id="matthew-only" default="true">
            <name lang="fr">Matthew Only!</name>
            <structure>
                <division nameId="frontmatter">
                    <content src="release/text/USX_1/INTNT.usx" nameId="intnt"/>
                    <content src="release/text/USX_1/INTMAT.usx" nameId="intmat"/>
                </division>
                <content src="release/text/USX_1/MAT.usx" nameId="book-mat"/>
            </structure>
        </publication>
    </publications>

Publication id
==============

This should be a short, human-readable label for the goal of the publication, since every other field may be unstable and/or non-unique.
(DBL legacy projects use "p1", "p2", derived from earlier booklist notation.)

default
=======

This flag should be set for exactly one publication element.

identification-like fields
==========================

Optional name, description and abbreviation elements may be included. When present, they override the burrito-level values from the identification
section. These elements should only appear within a publication if the values are different to the burrito-level ones, in the interests of easy
maintenance. (Burritos with a single publication should never need to use these elements.)

type-like fields
================

Optional scope and canonSpec elements may be included. When present, they override the burrito-level values from the identification
section. These elements should only appear within a publication if the values are different to the burrito-level ones, in the interests of easy
maintenance. (Burritos with a single publication should never need to use these elements.)

countries
=========

An optional countries element may be included. When present, it overrides the burrito-level values from the identification
section. This element should only appear within a publication if the values are different to the burrito-level ones, in the interests of easy
maintenance.

structure
=========

The required structure element describes the "running order" of the publication. It contains possibly-nested division elements and content elements.

division
--------

This element is a container for division and/or content elements. The nameId attribute is required, and points to a name defined in the names section.

content
-------

This element includes

* a required src attribute, which points to a non-source ingredient

* an optional nameId attribute which points to a name defined in the names section.
