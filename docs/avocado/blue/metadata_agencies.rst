####################
The Agencies Section
####################

The required agencies element contains at least one contributor element and one optional administrator element.

.. code-block:: xml

    <agencies>
        <contributor>
            <id>dbl::23</id>
            <isRightsHolder>true</isRightsHolder>
            <name lang="en">Burritos R Us Inc</name>
            <abbr lang="en">BRU</abbr>
            <url>https://burritos-r-us.org</url>
            <contributes>
                <content>true</content>
                <finance>true</finance>
                <management>true</management>
                <publication>true</publication>
                <qa>true</qa>
            </contributes>
        </contributor>
        <administrator>
            <id>dbl::29</id>
            <name lang="en">We Manage Burritos</name>
        </administrator>
    </agencies>

contributor
===========

Contains:

* an id

* isRightsHolder flag (which must be set for at least one contributor)

* at least one name

* optional abbreviations and url

* contributes element containing one or more boolean describing the agency's role, where content is required

administrator
=============

This optional element describes an organization that administrates the burrito on behalf of the rightsHolders.
