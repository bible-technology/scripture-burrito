############
PRINT FORMAT
############

************************
PROPOSED CHANGES FOR 0.1
************************

========================
Add print-oriented roles
========================

* printBody

* printCover

* printThumbnail

===========================
Metadata for thumbnail JPEG
===========================

* width

* height

* colorModel

================================================
fonts element should be optional and never empty
================================================

This is a schema error, ie it should be

.. code-block:: text

    element fonts { printFormatFontElement+ }?

not

.. code-block:: text

    element fonts { printFormatFontElement* }

============================================
Support Biblica's Tagged Text Toolbox format
============================================

This variant of print content is essentially InDesign XML.

.. code-block:: xml

    <convention type="structure" version="1.0">tagged-text</convention>

We need to rework the metadata fields too.

===============================
Enforce exactly one publication
===============================

Print entries are always an expression and it is hard to imagine a multiple-publication scenario.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.
