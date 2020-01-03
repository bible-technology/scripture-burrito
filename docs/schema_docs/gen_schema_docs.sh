#!/usr/bin/env bash
#
# Recreate base index file
cat <<EOF >index.rst
.. _schema_docs-index:

####################
Schema Documentation
####################

.. toctree::
   design
EOF

# Find all schema files, convert to a flat list using - to replace directories
for x in `find ../../schema -type f -name '*.schema.json' | sort | cut -d '/' -f 4-5`; do
    FLATNAME=`echo "$x" | tr '/' '-'`
    # Determine the schema filename
    NAME="${FLATNAME%%.schema.json}"

    # Create documentation file based on schema filename
    DOCFILE="${NAME}.rst"
    echo ".. _schema_docs-$NAME:" > $DOCFILE
    echo >> $DOCFILE
    echo ".. jsonschema:: ../../schema/$x" >> $DOCFILE

    # Add sub entries for any specified targets
    if `grep -q '\$\$target' ../../schema/$x`; then
        echo >> $DOCFILE
        echo -e "\n============\nLinked Types\n============\n" >> $DOCFILE
        for y in `grep '\$\$target' ../../schema/${x} | cut -f 4 -d '"'`; do
            echo -e ".. jsonschema:: ../../schema/${y}\n" >> $DOCFILE
        done
    fi

    # Add entry to index.rst file
    echo "   $NAME" >> index.rst
done
