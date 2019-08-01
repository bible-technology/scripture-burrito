####################
The Snapshot Section
####################

The snapshot element is required for all burritos.

.. code-block:: xml

    <snapshot>
        <creation>
            <software>Burrito Factory 0.1</software>
            <user id="sburrito:dbl:1234">Jane Doe</user>
        </creation>
        <uploading>
            <software>Burrito Truck 0.1</software>
            <user id="sburrito:dbl:5678"/>
        </uploading>
        <comments>Experimenting with i18n</comments>
    </snapshot>
 
    <!-- or maybe -->

    <snapshot>
        <creation>
            <software>Autographa 0.34</software>
            <user>Joel Mathew</user>
        </creation>
        <comments>Fix alignment for MAT 8</comments>
    </snapshot>

creation
========

Contains information about creation of the burrito.

software
--------

The name of the software that created the burrito.

user
----

The id and/or name of the person who created the burrito.

uploading
=========

Contains information about uploading (archiving) of the burrito, with the same fields as the creation section.

comments
========

A description of what changed in this snapshot.
