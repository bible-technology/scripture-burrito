#####################
The Promotion Section
#####################

A promotion element may appear in any burrito. When present, the promotion element must include at least one statement element.

.. code-block:: xml

    <promotion>
        <statement format="plain" lang="fr">L'équipe de Burritos R Us vous remercie d'avoir téléchargé notre burrito !</statement>
        <statement format="html" lang="fr">
            <p>L'équipe de <a href="https://burritos-r-us.org/about">Burritos R Us</a> vous remercie d'avoir téléchargé notre burrito !</p>
        </statement>
    </promotion>

statement format
================

* plain (a string)

* html (simplfied XHTML, with a restricted set of HTML tags and attributes)
