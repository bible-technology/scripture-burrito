#######
LICENSE
#######

This is a new section describing any license under which the burrito has been distributed.

There is generally a lot of confusion between copyright and licensing, as these concepts are interrelated. Copyright is a statement of ownership, stating that the work cannot be reproduced without explicit permission of the copyright holder. To add to the confusion, the copyright statement can waive the restriction, allowing anyone to modify and redistibute the work. Any material can also be in the public domain, in which case the work is not owned by anyone and can be used in any way. Most (all?) jurisdictions have copyright expiry, but this varies. 

If copyright is in effect (the work is not in the public domain) and there is not a license statement provided, then users should assume that they have no right to modify or redistribute the work.

Finally, copyright holders can apply very liberal licenses to their work that allows a wide range of rights to the licensee [1]_. In these cases the licensing is implied and doesn't require any formal agreement between the copyright holder and the licensee. The most widely known of these types of licenses are the ones defined by Creative Commons [2]_. 

Licenses in the current ecosystem are generally bilateral, between the copyright holder and a licensee, with named parties, expiry terms, and so on. These types of licenses should not be included in the metadata of a burrito as 
they are not universal information about the burrito, apply to one audience only, and may contain proprietary information.

Given the above information, the proposal is to allow for license declarations in metadata, but exclude bilateral agreements from the metadata. License declarations in metadata should only be used for licenses that do not require a formal acceptance by the licensee. Multiple licenses can be declared. License declarations may include external links in the form of an **href** attribute. 

************************
PROPOSED CHANGES FOR 0.1
************************

Introduce a top-level **licenses** element with zero-or-more **license** elements

* **licenses** to be mandatory, but possibly empty. Absence of **license** sub-elements means that there is no license and non-copyright holders have no rights to use, modify, or redistribute the work.
* **license** to contain optional plain-text license information, with an **href** attribute that gives a stable link to a license definition.


Examples:

.. code-block:: xml

    // default (empty) licenses element. Only copyright holders have rights on this work.
    <licenses/>

    // licenses with a single license element, pointing to a CC license. In this case 
    // license text would be redundant (and optional).
    <licenses>
      <license href="https://creativecommons.org/licenses/by/4.0/"/>
    </licenses>

    // licenses with a single license element, pointing to a CC license and including the license text.
    <licenses>
      <license href="https://creativecommons.org/licenses/by/4.0/">
        Creative Commons Attribution 4.0 International Public License
        ...
      </license>
    </licenses>


**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None

.. [1] See https://en.wikipedia.org/wiki/Open_content
.. [2] See https://creativecommons.org/choose/
