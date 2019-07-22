################
The Root Element
################

.. code-block:: xml

   <burritoMetadata id="urn:sburrito:dbl:0123456789abcdef" revision="23" schemaVersion="0.1">...</burritoMetadata>
   <burritoMetadata id="urn:sburrito:ptx:52effb3a-8d28-11e9-8160-1bffe1337865" revision="6253499c-8d28-11e9-ad73-8735b9c61064" schemaVersion="0.1">...</burritoMetadata>

The document is in the null namespace. The root element is "burritoMetadata".

The id attribute is required and follows the format of Scripture Burrito ids, which are urns.

The revision attribute is required and must match

.. code-block:: none

    [0-9A-Za-z]([0-9A-Za-z_.:\-]{0,62}[0-9A-Za-z])?

The schemaVersion attribute is required and must match a valid Scripture Burrito version tag, currently :code:`0.1`.
