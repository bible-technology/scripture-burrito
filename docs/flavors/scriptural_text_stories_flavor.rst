.. _scriptural_text_stories_flavor:

#######################
Scriptural Text Stories
#######################

======
Status
======

The Scriptural Text Stories flavor is based on the `Resource Container Book <https://resource-container.readthedocs.io/en/latest/container_types.html#book-book>`_ format. This specificiation was developed in 2016 from a need to represent unfoldingWord® Open Bible Stories in multiple languages. However, it was designed to be flexible enough to represent just about any chapter based resource. The Resource Container format is in use by nearly a dozen software tools developed by unfoldingWord, Bridge Connectivity Services, Wycliffe Associates, and others. As of September 2019, more than 500 Open Bible Stories projects are currently using this format as seen on the `Door43 Content Service <https://git.door43.org/>`_.

This flavor retells stories from the Bible in a way that can be linked to the passages of scripture that they come from.

=======
Content
=======

This content of this flavor uses a plain text Markdown format for representing the project. Each file in the ``content`` directory represents a single chapter. By convention, the files are numbered and sorted numerically except for two special files, ``front.md`` and ``back.md``. The ``front.md`` should always be presented first and is intended to provide typical front matter information for the book. Similarly, the ``back.md`` is intended for back matter information and should be presented last.

The H1 tag in each file is the title or heading of that particular chapter.

.. code-block:: none

    content/
        |-front.md
        |-01.md
        |-02.md
        |-03.md
        ...
        |-back.md

Each file should use Markdown formatting and images or videos should be linked to with Markdown image links.

=======================
Metadata Flavor Details
=======================

* a ``storyVersion`` element containing the version of story represented by the burrito content.
* a ``scopeOrRole`` element should be included for each story to indicate which part(s) of the canon the story is based on.

===========
Conventions
===========

None

=======
Example
=======

For an example, see the :ref:`glossed_text_story_document` metadata document.
