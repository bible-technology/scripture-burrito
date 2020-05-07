.. _introduction-overview:

########
Overview
########

Scripture Burrito is a data interchange format for Bible-centric content. Our goal is lossless portability of Scripture-related metadata and data between translation and publication users, applications and ecosystems.

Scope
=====

The scope of the Scripture Burrito specification includes any Bible-centric content and the entire
ecosystem, including publication. The intent is not to create new data formats, but rather define
a portable way of interchanging existing formats between applications and ecosystems.
This necessarily includes existing and future client/server
architectures and the attendant need to uniquely identify users, organizations and content.

Features
========

* a single container format to span the entire Scripture life cycle, from translation, through community testing and checking, to publication

* support for canonical and quasi-canonical translations in multiple media (initially text, audio, video, print on demand and braille)

* support for a wide range of resources relating to scripture, such as lexicons, cross-references, translation manuals, and commentaries

* mechanisms for linking related content, both at a burrito-to-burrito and ingredient-to-ingredient level

* identification of people, organizations and content via namespaced ids relating to multiple authenticating servers

Concepts
========

.. include:: /includes/burrito.txt

.. include:: /includes/flavor_types.txt

.. include:: /includes/flavors.txt

.. include:: /includes/reference_system.txt

.. include:: /includes/ingredients.txt

.. include:: /includes/conventions.txt

.. include:: /includes/variants.txt


Use Cases
=========

#. Scripture Burrito is designed first and foremost for **data interchange** between ecosystems, although creators and consumers may also choose to use some or all of the format internally.

#. Scripture Burrito is **a Bible-lifespan format**. In other words, it is intended to be used from the start of the translation, through checking and community testing, into publication via multiple toolchains, and then through revision processes.

#. Scripture Burrito supports **non-text formats as first-class content**. In other words, the model is not "text plus multimedia". In some cases text may play a secondary role or even be absent (eg in the case of oral translation or sign-language projects).

#. Scripture Burrito assumes the existence of **ecosystem servers** that provide ids for users, organizations and projects, and stores information to enable that server-hosted context to be discovered.

#. Scripture Burrito is intended to allow **lossless roundtripping of projects between ecosystems**. This depends to some extent on references to ecosystem servers that enable reconnection with different ecosystem-specific contexts.

#. Scripture Burrito supports **Scripture content** (original languages and translations), but also **Scriptural content** (eg glosses) and **Scripture-related content** (eg commentaries, translation manuals).
