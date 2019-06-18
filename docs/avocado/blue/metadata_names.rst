#################
The Names Section
#################

The names element is required for scripture and gloss flavorTypes and optional for other flavorTypes. When present it contains one or more name elements.

.. code-block:: xml

    <names>
        <name id="book-MAT">
            <short lang="en">MATTHEW</short>
            <short lang="fr">MATTHIEU</short>
            <abbr lang="fr">Mt</abbr>
            <long lang="fr">EVANGILE SELON MATTHIEU</long>
        </name>
    </names>

name id
=======

This is a label that may be used to relate the name to content in other sections (notably publications).
The value of this attribute should be machine-friendly and, preferably, human-friendly too.

short
=====

At least one short element is required. It is inspired by \\toc2 in USFM.

abbr
====

This optional element must not contain whitespace. It is inspired by \\toc3 in USFM.

long
====

This element is optional. It is inspired by \\toc1 in USFM.

