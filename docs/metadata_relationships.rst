#########################
The Relationships Section
#########################

The relationships section is optional. If present, it must contain one or more relation elements.

.. code-block:: xml

    <relationships>
        <relation flavor="scripturePrint" relationType="expression" id="urn:sburrito:dbl:fedcba9876543210" revision="2"/>
        <relation flavor="glossedTextStory" relationType="expression" id="urn:sburrito:x-atl:gl47" revision="1.2.3"/>
        <relation relationType="parascriptural" flavor="parascripturalWordAlignment" id="urn:sburrito:agmt:irvmal-4-wh" revision="1"/>
    </relationships>

relationType
============

This must be one of

* source (the source of this burrito)

* target (the scripture to which this burrito applies)

* expression (an expression of this burrito)

* parascriptural (related parascriptural content)

* peripheral (related peripheral content)

flavor
======

The flavor of the related burrito

id, revision
============

The id and revision of the related burrito

publicationId
=============

Optionally, when relationType == "source", the id of the publication that acts as a source.
