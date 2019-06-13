#####################
idServer Declarations
#####################

Each document must contain at least one idServer element as the first child(ren) of the root element.

.. code-block:: xml

    <burritoMetadata id="dbl::0123456789abcdef" revision="23">
        <idServer prefix="dbl">https://thedigitalbiblelibrary.org</idServer>
        <idServer prefix="ptx">https://registry.paratext.org</idServer>
        <idServer prefix="x-atl">http://atlantisbibleconsortium.net</idServer>
        <idServer prefix="my_server" local="true">http://localhost::8080</idServer>
        <!-- ... -->
    </burritoMetadata>

The idServer element must contain a 'prefix' attribute.

The idServer element may also contain a 'local' attribute. When true,
the local attribute signifies that the ids are for internal use only, eg within an intranet, and that they should be stripped before export.
The exact definition of "internal" and "export" is left to the consenting adults exchanging burritos, but local prefixes should
never be assumed to be portable and never expected to survive a journey through a different ecosystem.

The enclosed text is a URI. In the schema this means "pretty much any string", but using URLs that resolve to a server endpoint would
 help with discoverability.