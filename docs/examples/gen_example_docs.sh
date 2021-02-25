#!/usr/bin/env bash
#
# Recreate base index file
cat <<EOF >index.rst
.. _examples-index:

########
Examples
########

The following links provide examples of each of the defined :ref:\`flavors-index\`.

.. toctree::
EOF

# Find all example files and create doc files for them
for x in `find artifacts -type f -maxdepth 1 -name '*.json' | sort | cut -d '/' -f 2`; do
    # Determine the filename
    NAME="${x%%.json}"

    # Create documentation file based on schema filename
    DOCFILE="${NAME}.rst"
    echo ".. _examples-$NAME:" > $DOCFILE
    echo >> $DOCFILE
    echo "${NAME}" >> $DOCFILE
    echo $NAME | tr [:rune:] '=' >> $DOCFILE
    echo >> $DOCFILE
    echo >> $DOCFILE
    echo ".. literalinclude:: artifacts/$NAME.json" >> $DOCFILE
    echo "    :language: json" >> $DOCFILE

    # Add entry to index.rst file
    echo "   $NAME" >> index.rst
done
