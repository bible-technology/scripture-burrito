#######################
The Ingredients Section
#######################

The ingredients element is required for all burritos, and must contain at least one ingredient element.

.. code-block:: xml

    <ingredients>
        <ingredient isSource="true">
            <path>source/usfm/MAT.sfm</path>
            <size>1234</size>
            <mimeType>text/x-burrito-sfm</mimeType>
            <checksum>0123456789abcdef0123456789abcdef</checksum>
            <scopeOrRole>MAT 1:3,5,7-11</scopeOrRole>
        </ingredient>
        <ingredient>
            <path>release/text/USX_1/INTNT.usx</path>
            <size>1234</size>
            <mimeType>text/x-burrito-usx</mimeType>
            <checksum>0123456789abcdef0123456789abcdef</checksum>
            <scopeOrRole>intnt</scopeOrRole>
        </ingredient>
        <ingredient>
            <path>release/text/USX_1/INTMAT.usx</path>
            <size>1234</size>
            <mimeType>text/x-burrito-usx</mimeType>
            <checksum>0123456789abcdef0123456789abcdef</checksum>
            <scopeOrRole>intMAT</scopeOrRole>
        </ingredient>
        <ingredient>
            <path>release/text/USX_1/MAT.usx</path>
            <size>1234</size>
            <mimeType>text/x-burrito-usx</mimeType>
            <checksum>0123456789abcdef0123456789abcdef</checksum>
            <scopeOrRole>MAT 1:3,5,7-11</scopeOrRole>
        </ingredient>
        <ingredient>
            <path>unknownAdditive.foo</path>
            <size>99</size>
            <mimeType>application/octet-stream</mimeType>
        </ingredient>
    </ingredients>

path
====

The relative location of the ingredient within the burrito. Characters that may be used in XML names may be included in each step of the
path, which uses the "/" character to separate steps. The path ends with .<suffix>.

size
====

The byte size of the ingredient.

mimeType
========

The mimetype of the ingredient. Burrito-specific extension mimetypes take the form

* text/x-burrito-\*

* application/x-burrito-\*

scopeOrRole
===========

This optional element contains one of

* a canonical scripture reference, eg "JHN 3"

* a peripheral name, derived from the USFM 3 specification, eg "maps"

* int<bookCode>, eg "intMAT", to denote the introduction to a book