############
PUBLICATIONS
############

************************
PROPOSED CHANGES FOR 0.1
************************

=========================
Multiple Language Support
=========================

See the identification section.

==========
Drop scope
==========

====================================================================
Replace existing scope enum with canonicalContent-like list of books
====================================================================

See the identification section.

=========
Drop role
=========

The current role attribute attempts to cover both the scope of Scripture it contains and the type of file. The latter information is more naturally
expressed as a mimetype in the ingredients section. Also, the scriptural or para-scriptural scope of any ingredient is generally the same regardless of
any publication.

===========
metaContent
===========

This would allow content elements to have child elements for supporting content. The first concrete use case is for timing files, which are closely related to audio or video files, but which
appear as separate entries within the manifest:

.. code-block:: xml

    <content src="MAT.usx" name="book-mat">
        <metaContent src="timing/MAT.xml"/>
    </content>
    <content src="MRK.usx" name="book-mrk">
        <metaContent src="timing/MRK_1-6.xml"/>
        <metaContent src="timing/MRK_7-16.xml"/>
    </content>

=====================================
Peripherals ids in metadata role enum
=====================================

This enables the tagging of extra-canonical content without relying on well-known file names. The list, from the USFM 3 spec, would be

* **abbreviations**: Table of abbreviations

* **alphacontents**: Alphanumeric Contents

* **chron**: Chronology

* **cnc**: Concordance

* **contents**: Table of Contents

* **cover**: Cover

* **foreword**: Foreword

* **glo**: Glossary

* **halftitle**: Half Title Page

* **imprimatur**: Imprimatur

* **intbible**: Introduction to the Bible

* **intdc**: Deuterocanon Introduction

* **intepistles**: Introduction to Epistles

* **intgospels**: Introduction to Gospels

* **inthist**: Introduction to History

* **intnt**: Introduction to New Testament

* **intot**: Introduction to the Old Testament

* **intpent**: Introduction to the Pentateuch

* **intpoetry**: Introduction to Poetry

* **intprophesy**: Introduction to Prophecy

* **lxxquotes**: Quotes from LXX in NT

* **maps**: Map Index

* **measures**: Weights and Measures

* **ndx**: Names Index

* **preface**: Preface

* **promo**: Promotional Page

* **pubdata**: Publication Data

* **spine**: Spine

* **tdx**: Topical Index

* **title**: Title Page

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None