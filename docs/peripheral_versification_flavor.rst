########################
Peripheral Versification
########################

======
Status
======

This flavor is based upon Paratext's .vrs files. Member of the Scripture Burrito committee have reworked the historical character-based format into JSON. A new section has been added to describe verse ranges. This work may be seen in (https://github.com/ubsicap/versification_json)Initial feedback is positive. The Scripture Burrito committee awaits more detailed input from a Copenhagen Alliance subcommittee.

There are two use cases for the file format:

1. As a standalone burrito, when used to represent "standard" versifications, eg Lutheran, LXX Catholic etc

2. As a resource within a scripture Text burrito, replacing versification.vrs in DBL text bundles.

=======
Content
=======

One JSON file containing an object with the following keys:

* basedOn - the parent versification scheme, currently always set to "org"

* maxVerses - the highest verse number for each chapter of each book

* mappedVerses - key-value mapping of verses and verse ranges

* excludedVerses - verses that are deliberately excluded from the translation

* partialVerses - partial verses present in the translation

* mergedVerses - verse ranges present in the translation

See the repo for further details.

=======================
Metadata Flavor Details
=======================

None

===========
Conventions
===========

None
