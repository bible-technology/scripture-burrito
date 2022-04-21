.. You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Scripture Burrito Documentation
===============================

.. image:: ../logo/burrito_logo.png

After several years of development and testing, we are pleased to announce the availability of **Scripture Burrito 1.0-rc** specification! We recommend that developers of Scripture and Scripture-related applications test and adopt this specification for interchanging data with other systems. Out of the box Scripture Burrito is designed to support the following types of data:

- :ref:`scripture_text_flavor`
- :ref:`scripture_print_flavor`
- :ref:`scripture_audio_flavor`
- :ref:`scripture_sign_language_flavor`
- :ref:`scripture_braille_flavor`
- :ref:`scriptural_text_stories_flavor`

As interoperability is our primary goal, we are happy to accept proposals for new flavors based on common interchange scenarios. We have provided instructions and examples for Extending Scripture Burrito by testing and implementing new flavors (using ``x-`` flavors). When multiple implementations can be demonstrated, we will consider adding them as official flavors in new schema releases.

This work has been a multi-year collaboration between several organizations, including `American Bible Society <https://americanbible.org/>`_, `Clear.Bible <https://www.clear.bible/>`_, `Eldarion <https://eldarion.com/>`_, `Bridge Connectivity Solutions <https://bridgeconn.com/>`_, `SIL <https://www.sil.org/>`_, `unfoldingWord <https://www.unfoldingword.org/>`_, `United Bible Societies <https://unitedbiblesocieties.org/>`_, and the work has been sponsored by `illumiNations <https://illuminations.bible/>`_.

Future Development
==================

See future development `milestones here <https://github.com/bible-technology/scripture-burrito/milestones>`_. The Scripture Burrito :ref:`committee` invites comments on all aspects of the schema and documentation. Please use `Github Issues <https://github.com/bible-technology/scripture-burrito/issues>`_ or `Github Discussions <https://github.com/bible-technology/scripture-burrito/discussions>`_ to provide feedback.


Documentation
=============

.. toctree::
   :maxdepth: 4

   introduction/index
   schema_docs/index
   flavors/index
   examples/index
   glossary
