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
        <systemId type="gbc">
            <id>55df02965117ad3f2201309b</id>
        </systemId>
        <systemId type="paratext">
            <id>2d5220a02a7aaac6bcc2831ae262e9aaca5e1abd</id>
            <csetId>af680cd2580c1856d3765bee669fdaadd38afd1b</csetId>
            <name>SUA</name>
            <fullName>Susu Arabic</fullName>
        </systemId>
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

dateCompleted
=============

Optional element containing a timestamp (in one of a variety of XSD formats)

systemId
========

Zero or more elements are allowed. The type element must be one of

* biblica (Biblica)

* dbp (Faith Comes By Hearing's Digital Bible Platform)

* gbc (UBS's Global Bible Catalogue)

* paratext (Paratext)

* ptreg (The Paratext Registry)

* reap (SIL)

* tms (UBS)

or an "unknown" type beginning with "x-".

The content of the systemId element depends on the type attribute: see the schema for more details.