####################
The Licenses Section
####################

Each document may contain one optional licenses element. The absence of this element means that there is no license and that
no permissions should be assumed by anyone but the owner(s).

.. code-block:: xml

    <license>
        <url>https://burritos-r-us.org/licenses/3247</url>
    </license>

    <!-- or -->

    <license>
        <ingredient>README.md</ingredient>
    </license>

    <!-- or -->

    <publicDomain/>

    <!-- or -->

    <allRightsReserved/>

url
===

This element contains a link to the license. (In the case of private licenses the link may not be accessible to all users, but it still acts
as a stable identifier).

ingredient
==========

This element contains a path within the burrito to a file containing a license.

publicDomain
============

This empty element indicates that the document is in the public domain (and thus that no license is provided or needed in order to use the burrito.)

allRightsReserved
=================

This empty element indicates that the copyright owner has not provided any license, and that the consumer of the burrito should not assume permission to use the content of the burrito in any way.
