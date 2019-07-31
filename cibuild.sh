#!/usr/bin/env bash
#
# This requires that the Python rnc2rng package be installed
# pip3 install rnc2rng

# Instructs bash to output all commands run and exit on any error
set -xe

# Ensure previous rng file is deleted
rm -f docs/schema/metadata.rng

# Build rng file from rnc master
rnc2rng docs/schema/metadata.rnc >docs/schema/metadata.rng

# Run xmllint on each example file
for x in `ls docs/examples/*.xml`; do
  xmllint --noout --relaxng docs/schema/metadata.rng $x
done
