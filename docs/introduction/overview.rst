.. _overview:

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

* a single container format to span the entire Scripture life cycle, from translation, through
community testing and checking, to publication
* support for canonical and quasi-canonical translations in multiple media (initially text,
audio, video, print on demand and braille)
* support for a wide range of resources relating to scripture, such as lexicons,
cross-references, translation manuals, and commentaries
* mechanisms for linking related content, both at a burrito-to-burrito and
ingredient-to-ingredient level
* identification of people, organizations and content via namespaced ids relating to multiple
authenticating servers


.. toctree::
   history
   use_cases
   concepts
   committee
