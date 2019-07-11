#####################
The Copyright Section
#####################

A copyright element may appear in any burrito. When present, the copyright element must include at least one statement element.

.. code-block:: xml

    <copyright>
        <statement lang="fr" format="plain" type="full">© Burritos R Us 2019. Tous droits réservés.</statement>
        <statement lang="fr" format="html" type="full"><p><b>© Burritos R Us 2019.</b></p><p><i>Tous droits réservés.</i></p></statement>
        <statement lang="fr" format="plain" type="short">© Burritos R Us 2019.</statement>
        <statement lang="fr" format="html" type="short"><p>© Burritos R Us 2019.</p></statement>
        <statement lang="en" format="plain" type="full">© Burritos R Us 2019. All rights reserved.</statement>
    </copyright>

statement type
==============

* full (typically several lines or paragraphs)

* short (typically a single sentence suitable for placing at the end of each chapter of a Bible)

statement format
================

* plain (a string)

* html (simplfied XHTML, with a restricted set of HTML tags and attributes)
