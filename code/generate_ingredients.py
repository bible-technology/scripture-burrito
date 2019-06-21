#!/usr/bin/env python

import hashlib
import os
import sys


from lxml import etree


def die(msg):
    print(msg)
    print("USAGE: generate_ingredients <root_dir_path>")
    sys.exit(1)


def md5(fname):
    hash_md5 = hashlib.md5()
    with open(fname, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()


def ingredients_from_dir(dom, path, prefix=""):

    def append_subelement(parent, child_tag, child_text):
        child = etree.Element(child_tag)
        child.text = child_text
        parent.append(child)

    for thing in sorted(list(os.listdir(path))):
        if thing[0] == ".":
            continue
        thing_fs_path = os.path.join(path, thing)
        thing_xml_path = (prefix + "/" + thing) if len(prefix) > 0 else thing
        if os.path.isdir(thing_fs_path):
            ingredients_from_dir(dom, thing_fs_path, (prefix + "/" + thing) if len(prefix) > 0 else thing)
        else:
            ingredient = etree.Element("ingredient")
            append_subelement(ingredient, "path", thing_xml_path)
            append_subelement(ingredient, "size", str(os.stat(thing_fs_path).st_size))
            append_subelement(ingredient, "checksum", str(md5(thing_fs_path)))
            append_subelement(ingredient, "mimeType", "text/plain")
            dom.append(ingredient)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        die("generate_ingredients requires exactly one argument")
    _, dir_path = sys.argv
    dom = etree.Element("ingredients")
    ingredients_from_dir(dom, dir_path)
    print(etree.tostring(dom, pretty_print=True))