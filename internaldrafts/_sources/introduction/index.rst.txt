.. _introduction-overview:

########
Overview
########

Scripture Burrito is a standard for exchanging Bible translation projects between tools. A translation project contains dozens or hundreds of files; without a manifest, software has no way to know what each file contains, what role it plays, or how the pieces fit together. Scripture Burrito provides that manifest — a metadata file called a *burrito* — describing every file in the project: its format, its Scripture coverage, and its role. The files themselves are called *ingredients*. A burrito is not tied to a storage format; the same project can be a zip file, a directory, a GitHub repository, a database, or an API payload.

Burritos are organized by *flavor*, which describes the kind of content the project contains. A *reference system* describes how content is navigated — typically by book, chapter, and verse.

Concepts
========

.. include:: /includes/burrito.txt

.. include:: /includes/flavor_types.txt

.. include:: /includes/flavors.txt

.. include:: /includes/reference_system.txt

.. include:: /includes/ingredients.txt


Goals
=====

The goal of any standard is **interoperability** — independently developed tools exchanging content without custom integration work. Scripture Burrito exists to serve that goal. Claiming conformance is not the goal — a specification that lets implementations claim conformance without delivering interoperability does not serve its users.

A flavor specification is worth writing only when two or more independent implementations need to interoperate. The working group requires some implementation experience before standardizing a new flavor, because real implementations reveal requirements that are invisible on paper. Before a flavor is accepted into the standard, the working group requires a **demonstrated interoperability test with real data** between two or more independent implementations. A specification and a single implementation are not enough.

When the need for a new flavor standard is clear, the working group brings together the stakeholders — tool developers, content producers, and publishers — to write the specification collaboratively. The working group is developing more efficient processes to keep this work focused and avoid paralysis by analysis.

#. Scripture Burrito supports **data interchange** between ecosystems and serves as a **portable archive format** for translation projects, covering all stages from initial drafting through checking, publication, and revision.

#. Non-text formats such as audio and sign language are **first-class content**, not add-ons to a text translation.

#. A burrito exported from one tool can be imported into another and back without data loss.

.. toctree::
   :hidden:

   structure

Acknowledgements
================

Scripture Burrito was developed through a multi-year collaboration between `American Bible Society <https://americanbible.org/>`_, `Biblica <https://www.biblica.com/>`_, `Bridge Connectivity Solutions <https://bridgeconn.com/>`_, `Clear.Bible <https://www.clear.bible/>`_, `Eldarion <https://eldarion.com/>`_, `SIL <https://www.sil.org/>`_, `Seed Company <https://seedcompany.com/>`_, `unfoldingWord <https://www.unfoldingword.org/>`_, and `United Bible Societies <https://unitedbiblesocieties.org/>`_, with sponsorship from `illumiNations <https://illuminations.bible/>`_.

Copyright (c) 2020-2026 Contributors. The documentation is licensed under `CC BY-SA 4.0 <https://creativecommons.org/licenses/by-sa/4.0/>`_; the schema and code are licensed under the `MIT License <https://github.com/bible-technology/scripture-burrito/blob/master/LICENSE>`_.
