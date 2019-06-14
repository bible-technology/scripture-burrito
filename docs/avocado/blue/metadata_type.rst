################
The Type Section
################

Each document must contain exactly one type element, immediately after the idServer element(s).

.. code-block:: xml

    <type>
        <flavor>scriptureText</flavor>
        <flavorType>scripture</flavorType>
        <hasCharacters>true</hasCharacters>
        <hasSource>true</hasSource>
        <isPublishable>true</isPublishable>
        <scope>
            <bookScope>GEN</bookScope><!-- Use the shortest possible description, ie not "GEN 1-50" or "GEN 1:1-31;GEN 2:..." -->
            <bookScope>EXO 1-12</bookScope>
            <bookScope>LEV 2:3-3:7</bookScope>
            <bookScope>MAT 1:3,5,7-11</bookScope>
        </scope>
        <canonSpec type="OT, NT">
            <component name="westernOT"/><!-- All books in component do not need to be present -->
            <component name="x-matthewOnlyMillenialists"><!-- Do not do this to track progress - that's what scope is for! -->
                <book>MAT</book>
            </component>
        </canonSpec>
        <confidentiality>
            <metadata>unrestricted</metadata>
            <publications>restricted</publications>
            <source>private</source>
        </confidentiality>
        <details>
            <projectType>standard</projectType>
            <conventions>
                <convention version="1.0">usxDirs</convention>
                <convention version="1.0">usxRefs</convention>
                <convention version="0.1.beta">x-scaryUndefinedWhatnot</convention>
            </conventions>
        </details>
    </type>

flavor
======

Required, either one of

* scriptureText

* scriptureAudio

* scriptureSignLanguageVideo

* scripturePrint

* scriptureBraille

* textStoryGloss

* wordAlignment

or x-something.

flavorType
==========

Required, one of

* scripture (a translation or paraphrase, with The Message roughly defining the limit of what is considered to be a paraphrase)

* gloss (a retelling of Scripture that abbreviates, augments and/or reorganized the content, but in a way that can still be mapped to scripture)

* paraScriptural (non-scriptural content that maps onto scripture via a versification scheme)

* peripheral (non-scriptural content that may be useful within the Bible ecosystem, but which does not map onto scripture via a versification scheme)

hasCharacters
=============

Required boolean that specifies whether the flavor is text-based.

hasSource
=========

Required boolean that is set if source files are present, eg SFM files for Scripture text or WAV files for Scripture audio.

isPublishable
=============

Required boolean that is set if the burrito is considered to be "finished" enough to be published in some way.

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

details
=======

The content of this element is flavor-specific.