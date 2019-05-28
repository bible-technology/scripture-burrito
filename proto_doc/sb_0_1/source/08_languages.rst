#########
LANGUAGES
#########

*******************
IN DBL METADATA 2.2
*******************

* **iso** (Exactly 1 string)

    * The language's 3-character ISO 639-3 code

        * regex: [a-z][a-z][a-z]

* **name** (Exactly 1 string)

    * The name, in English, of the language

        * regex: \S.*\S

* **nameLocal** (0 or 1 string)

    * The localized name of the language

        * regex: \S.*\S

* **scriptCode** (Exactly 1 string)

    * The ISO 15924 script code used in this entry

        * Enum:

        * Adlm

        * Afak

        * Aghb

        * Ahom

        * Arab

        * Aran

        * Armi

        * Armn

        * Avst

        * Bali

        * Bamu

        * Bass

        * Batk

        * Beng

        * Blis

        * Bopo

        * Brah

        * Brai

        * Bugi

        * Buhd

        * Cakm

        * Cans

        * Cari

        * Cham

        * Cher

        * Cirt

        * Copt

        * Cprt

        * Cyrl

        * Cyrs

        * Deva

        * Dsrt

        * Dupl

        * Egyd

        * Egyh

        * Egyp

        * Elba

        * Ethi

        * Geok

        * Geor

        * Glag

        * Goth

        * Gran

        * Grek

        * Gujr

        * Guru

        * Hang

        * Hani

        * Hano

        * Hans

        * Hant

        * Hatr

        * Hebr

        * Hira

        * Hluw

        * Hmng

        * Hrkt

        * Hung

        * Inds

        * Ital

        * Java

        * Jpan

        * Jurc

        * Kali

        * Kana

        * Khar

        * Khmr

        * Khoj

        * Kitl

        * Kits

        * Knda

        * Kore

        * Kpel

        * Kthi

        * Lana

        * Laoo

        * Latn

        * Latf

        * Latg

        * Lepc

        * Limb

        * Lina

        * Linb

        * Lisu

        * Loma

        * Lyci

        * Lydi

        * Mahj

        * Mand

        * Mani

        * Marc

        * Maya

        * Mend

        * Merc

        * Mero

        * Mlym

        * Modi

        * Mong

        * Moon

        * Mroo

        * Mtei

        * Mult

        * Mymr

        * Narb

        * Nbat

        * Nkgb

        * Nkoo

        * Nshu

        * Ogam

        * Olck

        * Orkh

        * Orya

        * Osge

        * Osma

        * Palm

        * Pauc

        * Perm

        * Phag

        * Phli

        * Phlp

        * Phlv

        * Phnx

        * Plrd

        * Prti

        * Rjng

        * Roro

        * Runr

        * Samr

        * Sara

        * Sarb

        * Saur

        * Sgnw

        * Shaw

        * Shrd

        * Sidd

        * Sind

        * Sinh

        * Sora

        * Sund

        * Sylo

        * Syrc

        * Syre

        * Syrj

        * Syrn

        * Tagb

        * Takr

        * Tale

        * Talu

        * Taml

        * Tang

        * Tavt

        * Telu

        * Teng

        * Tfng

        * Tglg

        * Thaa

        * Thai

        * Tibt

        * Tirh

        * Ugar

        * Vaii

        * Visp

        * Wara

        * Wole

        * Xpeo

        * Xsux

        * Yiii

        * Zinh

        * Zmth

        * Zsym

        * Zxxx

        * Zyyy

        * Zzzz

* **script** (Exactly 1 string)

    * The name of the script used in this entry

        * regex: \S.*\S

* **scriptDirection** (Exactly 1 string)

    * The direction of the script used in this entry

        * Enum:

        * LTR

        * RTL

* **numerals** (0 or 1 string)

    * The numerals system used in this entry

        * Enum:

        * Arabic

        * Bengali

        * Burmese

        * Chinese

        * Cyrillic

        * Devanagari

        * Ethiopic

        * Farsi

        * Gujarati

        * Gurmukhi

        * Hebrew

        * Hindi

        * Kannada

        * Khmer

        * Malayalam

        * Oriya

        * Roman

        * Tamil

        * Telugu

        * Thai

        * Tibetan

* **ldml** (0 or 1 string)

    * The LDML of the language

        * regex: [A-Za-z]{2,3}([\-_][A-Za-z0-9]+){0,4}

* **rod** (0 or 1 string)

    * The ROD of the language

        * regex: [0-9]{5}


************************
PROPOSED CHANGES FOR 0.1
************************

======
BCP 47
======

This is the currently preferred way to store language information, as it can include most other
standards and can handle minority languages and dialects that are unlikely to be supported by
the older standards such as ISO 639-3.

It seems that the field currently called "ldml" is actually closer to BCP 47. This should be renamed
and we should check that it handles all BCP 47 permutations.

We also need to decide whether to store the components of BCP 47 separately, since decomposing BCP 47 is not
trivial. (For example, there is no 639-3 code if a 639-1 code exists.) At that point, another option would be
to only store the components, which reduces duplication but pushes the onus of constructing BCP 47 onto the consumer.

=========================
Multiple Language Support
=========================

In the current schema there is exactly one language element. To support multiple languages we should adopt a structure
similar to the current countries structure, ie a "languages" wrapper with one or more "language" child element. Exactly
one of those languages should be marked as the default.

Here, as elsewhere, name and nameLocal need rethinking to support multiple languages. In addition to languages of the
scriptural content, there may be localization languages. So, eg, an English-French diglot might contain localization strings
in Spanish, Arabic or Hindi in order to localize interfaces.

In a world where English is no longer always the default language,
it might make sense to abandon the name/nameLocal distinction altogether and, instead, to require one or more name, each
in a specified language. The downside of this is that every consumer then needs to implement some form of language negotiation
to handle the case where, say, the preferred language is French and the options in the metadata are Chinese and Swahili.

**************************
ISSUES TO CONSIDER FOR 0.2
**************************

None.
