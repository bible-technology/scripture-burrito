.. _metadata_type:

################
The Type Section
################

Each document must contain exactly one type element, immediately after the idServer element(s).

.. code-block:: xml

    <type>
        <flavor>scriptureText</flavor>
        <flavorType>scripture</flavorType>
        <scope>
            <bookScope>GEN</bookScope><!-- Use the shortest possible description, ie not "GEN 1-50" or "GEN 1:1-31;GEN 2:..." -->
            <bookScope>EXO 1-12</bookScope>
            <bookScope>LEV 2:3-3:7</bookScope>
            <bookScope>MAT 1:3,5,7-11</bookScope>
        </scope>
        <canonSpec type="OT, NT">
            <component name="westernOT"/> <!-- All books in component do not need to be present -->
            <component name="x-matthewOnlyMillenialists"><!-- Do not do this for translations in progress - that's what scope is for! -->
                <book>MAT</book>
            </component>
        </canonSpec>
        <confidentiality>
            <metadata>unrestricted</metadata>
            <publications>restricted</publications>
            <source>private</source>
        </confidentiality>
        <flavorDetails>
            <!-- NOT GENERIC -->
        </flavorDetails>
    </type>

.. _metadata_type-flavor:

flavor
======

Required, either one of

* scriptureText

* scriptureAudio

* scriptureSignLanguageVideo

* scripturePrint

* scriptureBraille

* glossedTextStory

* parascripturalWordAlignment

or x-something.

.. _metadata_type-flavortype:

flavorType
==========

Required, one of

* scripture (a translation or paraphrase, with The Message roughly defining the limit of what is considered to be a paraphrase)

* gloss (a retelling of Scripture that abbreviates, augments and/or reorganized the content, but in a way that can still be mapped to scripture)

* parascriptural (non-scriptural content that maps onto scripture via a versification scheme)

* peripheral (non-scriptural content that may be useful within the Bible ecosystem, but which does not map onto scripture via a versification scheme)

scope
=====

Required, contains one or more unordered bookScope elements, each of which describes the scope of content within one book.

canonSpec
=========

Required for the scripture, gloss and paraScriptural flavorTypes. The element includes a type attribute attribute that
specifies one or more component from

* OT (Hebrew Old Testament)

* OT+ (Greek Old Testament, ie Hebrew OT and DC books are combined, as in most Catholic and Orthodox Bibles)

* DC (Deuterocanon as a discrete section, as in many interconfessional Bibles)

* NT (New Testament)

The element contains one or more component element. Each component element has a name attribute. The name value is either
a known ordered list of books, or an x-something label for an ordered list of books within the component element. (See the
example above and the schema for more details.)

confidentiality
===============

This contains

* metadata (required)

* source (optional)

* publications (optional)

each of which contains one of

* unrestricted

* restricted

* private

flavorDetails
=============

The content of this element is flavor-specific.
