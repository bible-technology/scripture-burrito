###########
TEXT FORMAT
###########

*******************
IN DBL METADATA 2.2
*******************

* **versedParagraphs** (Exactly 1 boolean)

   * Should the USX be rendered one paragraph per verse?


************************
PROPOSED CHANGES FOR 2.3
************************

=======================
Remove versedParagraphs
=======================

This can be replaced with a convention, which accurately describes the semantics of this field.

======
Syntax
======

This would provide the USFM and USX version.

.. code-block:: xml

   <usfmVersion>3.0</usfmVersion>
   <usxVersion>3.0</usxVersion>

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************
