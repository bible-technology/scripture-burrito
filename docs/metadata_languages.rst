#####################
The Languages Section
#####################

One languages element is allowed for all flavorTypes and required for scripture and gloss flavorTypes. The languages represented
are those used in the content. (The metadata may include localization in other languages.)

.. code-block:: xml

    <languages>
        <language>
            <bcp47>fr</bcp47>
            <name lang="fr">français</name>
            <name lang="en">French</name>
            <name lang="de">Französisch</name>
            <scriptDirection>LTR</scriptDirection>
        </language>
        <language>
            <bcp47>en</bcp47>
            <name lang="en">English</name>
            <scriptDirection>LTR</scriptDirection>
        </language>
    </languages>

bcp47
=====

The BCP 47 code for the language (https://tools.ietf.org/html/bcp47).

scriptDirection
===============

LTR or RTL.

rod
===

The optional ROD for the language (http://globalrecordings.net/en/rod).
