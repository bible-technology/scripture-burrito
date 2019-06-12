################
The Root Element
################

.. code:: xml

   <burritoMetadata id="dbl::0123456789abcdef" revision="23">...</burritoMetadata>
   <burritoMetadata id="0123456789abcdef" revision="23">...</burritoMetadata>
   <burritoMetadata id="ptx::52effb3a-8d28-11e9-8160-1bffe1337865" revision="6253499c-8d28-11e9-ad73-8735b9c61064">...</burritoMetadata>

The document is in the null namespace. The root element is "burritoMetadata".

The id attribute is required and follows the format of Scripture Burrito ids, including an optional prefix.

The revision attribute is required and must match

.. code-block:: none

    [0-9A-Za-z]([0-9A-Za-z_-]{0,30}[0-9A-Za-z])?

ie a string starting and ending with an alphanumeric character and containing alphanumeric characters, hyphens and underscores.
