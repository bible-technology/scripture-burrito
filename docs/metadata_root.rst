.. _metadata_root:

################
The Root Element
################


Overview
--------

Example root elements:

.. code-block:: xml

   <burritoMetadata id="urn:sburrito:dbl:0123456789abcdef" revision="23" schemaVersion="0.1">...</burritoMetadata>
   <burritoMetadata id="urn:sburrito:ptx:52effb3a-8d28-11e9-8160-1bffe1337865" revision="6253499c-8d28-11e9-ad73-8735b9c61064" schemaVersion="0.1">...</burritoMetadata>

The document is in the null namespace. The root element is "burritoMetadata".

id attribute
-------------

The :code:`id` attribute is required and follows the format of Scripture Burrito :ref:`metadata_ids-id-syntax`.

revision attribute
------------------

The :code:`revision` attribute is required and must match the following regular expression:

.. code-block:: none

    [0-9A-Za-z]([0-9A-Za-z_.:\-]{0,62}[0-9A-Za-z])?

There is no expectation that :code:`revision` be a version number nor that it be meaningful across ecosystems. As a design feature, it may follow any semantic scheme within an :code:`idServer`'s context, as long as it fits within the above regular expression. Some valid exmaples:

* :code:`revision="v10"`
* :code:`revision="590"`
* :code:`revision="4.8.2"`
* :code:`revision="5c5755d8715ac1f9f3896d48cc6dcbe68e94539d"`
* :code:`revision="2020-09-17-18:55:37"`

schemaVersion attribute
-----------------------

The :code:`schemaVersion` attribute is required and must match a valid Scripture Burrito version tag, currently :code:`0.1`.
