##############
ARCHIVE STATUS
##############

************************
PROPOSED CHANGES FOR 0.1
************************

====================================================
Optional uid for bundleCreatorName and archivistName
====================================================

.. code-block:: xml

    <bundleCreatorName uid="dbl::0123456789abcdef">Jane Doe</bundleCreatorName>
    <archivistName uid="dbl::0123456789abcdef">Jane Doe</archivistName>

The uid should be optional because this information may not be available in all cases, including retrospectively during migration.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.