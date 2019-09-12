###########################
JSON Expression of Metadata
###########################

The definitive description of Scripture Burrito metadata is provided via schema for XML - currently in RelaxNG, with additional Schematron schema planned.

The Digital Bible Library stores entry metadata as XML, but exposes parts of that metadata in JSON. It is expected that JSON expressions of Scripture Burrito metadata will be needed in many places in the future. In the interests of compatibility, and for the avoidance of wheel reinvention, a canonical JSON expression mapping of the XML schema is proposed, together with tools to convert between XML and JSON. A python conversion tool is being developed at https://github.com/ubsicap/sb-metadata-as-json and was used to produce the JSON examples in the appendix.