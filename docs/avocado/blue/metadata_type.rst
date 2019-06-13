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
        <confidentiality>
            <metadata>unrestricted</metadata>
            <publications>restricted</publications>
            <source>confidential</source>
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

    or x-something.

    flavorType
    ==========

    Required, one of

    * scripture

    * gloss

    * paraScriptural

    hasCharacters
    =============

    Required boolean that specifies whether the flavor is text-based.

    hasSource
    =========

    Required boolean that is set if source files are present, eg SFM files for Scripture text or WAV files for Scripture audio.

    isPublishable
    =============

    Required boolean that is set if the burrito is considered to be "finished" enough to be published in some way.

    confidentiality
    ===============

    This contains

    * metadata (required)

    * source (optional)

    * publications (optional)

    each of which contains one of

    * unrestricted

    * restricted

    * confidential

    details
    =======

    The content of this element is flavor-specific.