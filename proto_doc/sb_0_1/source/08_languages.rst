#########
LANGUAGES
#########

************************
PROPOSED CHANGES FOR 0.1
************************

======
BCP 47
======

This is the currently preferred way to store language information, as it can include most other
standards and can handle minority languages and dialects that are unlikely to be supported by
the older standards such as ISO 639-3.

It seems that the field currently called "ldml" is actually closer to BCP 47. This should be renamed "bcp47"
and we ned a regex that handles all BCP 47 permutations.

======================================
Remove fields incorporated into BCP 47
======================================

* ISO

* scriptCode

* script

* numerals

=========================
Multiple Language Support
=========================

In the current schema there is exactly one language element. To support multiple languages we should adopt a structure
similar to the current countries structure, ie a "languages" wrapper with one or more "language" child element. Exactly
one of those languages should be marked as the default:

.. code-block:: xml

    <languages>
        <language lang="fr" default="true">
        ...
        </language>
    </languages>

The name and nameLocal fields need rethinking to support multiple languages, as per the identification section.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.
