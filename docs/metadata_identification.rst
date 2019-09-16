##########################
The Identification Section
##########################

.. code-block:: xml

    <identification>
        <name lang="en">Scripture Burrito Demo Text Bible</name>
        <name lang="fr">Crêpe mexicaine biblique surdimensionnée (démonstration)</name>
        <description lang="en">A Demonstration Scripture Burrito containing Text, like Paratext Might One Day Produce</description>
        <abbreviation lang="fr">CMBS</abbreviation>
        <dateCompleted>2015-05-01</dateCompleted>
        <systemId revision="23">dbl::0123456789abcdef</systemId>
        <systemId>gbc::55df02965117ad3f2201309b</systemId>
        <systemId>paratext::2d5220a02a7aaac6bcc2831ae262e9aaca5e1abd</systemId>
    </identification>

name
====

One or more elements are required, containing

* a *lang* attribute (bcp 47)

* name-like text

description
===========

Zero or more element are allowed, containing

* a *lang* attribute (bcp 47)

* name-like text

abbreviation
============

Zero or more element are allowed, containing

* a *lang* attribute (bcp 47)

* text consisting of one or more word characters

dateStarted
===========

Optional element containing a timestamp (in one of a variety of XSD formats)

dateCompleted
=============

Optional element containing a timestamp (in one of a variety of XSD formats)

systemId
========

One or more elements are allowed. The text of the element is the id.
