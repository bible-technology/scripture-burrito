#!/usr/bin/env python3

import os
import sys

from lxml import etree

def checked_args():

    modes = ["naive", "enum", "flavorType"]

    flavor_type_filters = {
        "scripture": ["scripture"],
        "gloss": ["gloss"],
        "narrative": ["scripture", "gloss"],
        "all": ["scripture", "gloss", "parascriptural", "peripheral"]
    }

    enum_filters = {
        "scripture": ["scriptureText"],
        "gloss": ["glossedTextStory"],
        "narrative": ["scriptureText", "glossedTextStory"],
        "all": ["scriptureText", "glossedTextStory", "parascripturalWordAlignment"]
    }

    fields = {
        "scripture": [
            ("fType", "text", "/burritoMetadata/type/flavorType/text()"),
            ("flavor", "text", "/burritoMetadata/type/flavor/text()"),
            ("names", "list", "/burritoMetadata/identification/name/text()"),
            ("lang", "list", "/burritoMetadata/languages/language/name/text()"),
            ("count", "list", "/burritoMetadata/countries/country/name/text()"),
            ("canon", "text", "/burritoMetadata/type/canonSpec/@type")
        ],
        "gloss": [
            ("fType", "text", "/burritoMetadata/type/flavorType/text()"),
            ("flavor", "text", "/burritoMetadata/type/flavor/text()"),
            ("names", "list", "/burritoMetadata/identification/name/text()"),
            ("lang", "list", "/burritoMetadata/languages/language/name/text()"),
        ],
        "all": [
            ("fType", "text", "/burritoMetadata/type/flavorType/text()"),
            ("flavor", "text", "/burritoMetadata/type/flavor/text()"),
            ("names", "list", "/burritoMetadata/identification/name/text()")
        ]
    }

    fields_by_filter = {
        "scripture": "scripture",
        "gloss": "gloss",
        "narrative": "gloss",
        "all": "all"
    }
    def die(msg):
        print(msg)
        print("USAGE: catalog <{0}> <{1}> <dir_path>".format("|".join(modes), "|".join(flavor_type_filters.keys())))
        sys.exit(1)

    if len(sys.argv) != 4:
        die("catalog requires exactly three arguments")
    _, mode, filter, dir_path = sys.argv
    if mode not in modes:
        die("mode must be one of {0}".format("|".join(modes)))
    if mode == "flavorType" and filter not in flavor_type_filters:
        die("flavorType filter must be one of '{0}".format("|".join(flavor_type_filters.keys())))
    if mode == "enum" and filter not in enum_filters:
        die("enum filter must be one of '{0}".format("|".join(enum_filters.keys())))
    if not os.path.isdir(dir_path):
        die("Directory '{0}' does not exist".format(dir_path))
    return(
        mode,
        fields[fields_by_filter[filter]],
        flavor_type_filters[filter] if mode == "flavorType" else enum_filters[filter],
        [os.path.join(dir_path, f) for f in os.listdir(dir_path) if ".xml" in f]
    )

if __name__ == "__main__":
    mode, filter_fields, filters, sources = checked_args()
    results = []
    for source in sources:
        try:
            dom = etree.parse(source)
            if mode == "flavorType" and dom.xpath("/burritoMetadata/type/flavorType/text()")[0] not in filters:
                continue
            if mode == "enum" and dom.xpath("/burritoMetadata/type/flavor/text()")[0] not in filters:
                continue
            record = [dom.xpath("/burritoMetadata/@id")[0]]
            for filter_field in filter_fields:
                try:
                    field_value = ", ".join(dom.xpath(filter_field[2])) if filter_field[1] == "list" else dom.xpath(filter_field[2])[0]
                    if not field_value:
                        field_value = "AWOOOGA: NO VALUE!"
                except:
                    field_value="AWOOGA: EXCEPTION!"
                record.append(filter_field[0] + ":\t" + field_value)
            results.append(record)
        except Exception as exc:
            print("Exception: {0}".format(exc))
    for result_record in results:
        print(result_record[0])
        print("\t" + "\n\t".join(result_record[1:]) + "\n")