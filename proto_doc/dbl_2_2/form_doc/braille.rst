##########################################
Report based on Template Tree braille.json
##########################################

* **/DBLMetadata/identification** (Exactly 1)

   * **name** (Exactly 1 string)

      * The entry's name, in English

         * regex: \S.*\S

   * **nameLocal** (0 or 1 string)

      * The entry's localized name

         * regex: \S.*\S

   * **abbreviation** (0 or 1 string)

      * The entry's abbreviation, in English (no exotic characters). This is not required for non-text media, but is strongly recommended.

         * regex: [\-A-Za-z0-9]{2,12}

   * **abbreviationLocal** (0 or 1 string)

      * The entry's localized abbreviation

         * regex: \S.{0,10}\S

   * **description** (Exactly 1 string)

      * The entry's description, in English

         * regex: \S.*\S

   * **descriptionLocal** (0 or 1 string)

      * The entry's localized description

         * regex: \S.*\S

   * **scope** (Exactly 1 string)

      * The entry's scope (across all publications)

         * Enum:

            * Bible

            * Bible with Deuterocanon

            * New Testament

            * New Testament+

            * Old Testament

            * Old Testament + Deuterocanon

            * Old Testament+

            * Portions

            * Selections

            * Shorter Bible

   * **dateCompleted** (0 or 1 string)

      * The date on which this entry was completed

         * regex: [12]\d{3}(-[01]\d(-[0-3]\d(T[012]\d:[0-5]\d:[0-5]\d)?)?)?

   * **bundleProducer** (Exactly 1 string)

      * The client and client version that produced this bundle

         * regex: \S.*\S

   * **/DBLMetadata/identification/systemId** (Exactly 1)

      * **/DBLMetadata/identification/systemId[@type='gbc']** (0 or 1)

         * **id** (Exactly 1 string)

            * The GBC id (24 hex characters)

               * regex: [0-9a-f]{24}


      * **/DBLMetadata/identification/systemId[@type='tms']** (0 or 1)

         * **id** (Exactly 1 string)

            * The TMS id for this entry (an UUID)

               * regex: [0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}


      * **/DBLMetadata/identification/systemId[@type='reap']** (0 or 1)

         * **id** (Exactly 1 string)

            * The REAP id for this entry (an UUID)

               * regex: [^ ]+


      * **/DBLMetadata/identification/systemId[@type='biblica']** (0 or 1)

         * **id** (Exactly 1 integer)

            * The Biblica ID (a number)

               * max: 99999


      * **/DBLMetadata/identification/systemId[@type='dbp']** (0 or 1)

         * **id** (Exactly 1 string)

            * The DBP id for this entry (10 hex characters)

               * regex: [A-Z0-9]{10}



   * **/DBLMetadata/identification/canonSpec** (0 or 1)

      * **@type** (Exactly 1 string)

         * The overall structure and order of this canon. (OT+ here means canonical and deuterocanonical OT books interleaved within the same section, like most Catholic Bibles)

            * Enum:

               * OT

               * OT+

               * DC

               * NT

               * OT, NT

               * OT+, NT

               * OT, NT, DC

               * OT, DC, NT

      * **component** (1 or more string)

         * The components of this canon, which should match the canon type chosen above. eg, if the canon type is "0T, NT", there should be one OT and one NT component here.

            * Enum:

               * armenianApostolicDC

               * armenianApostolicOT

               * armenianApostolicOT2

               * armenianClassicalOT

               * armenianNT

               * catholicAndAnglicanDC

               * catholicLxxDC

               * catholicLxxOT

               * catholicLxxSeparatedDC

               * catholicPlusLutheranDC

               * catholicVulgateDC

               * catholicVulgateOT

               * catholicVulgateSeparatedDC

               * czechKralickaDC

               * danishLutheranDC

               * ethiopianOrthodoxDC

               * ethiopianOrthodoxNT

               * ethiopianOrthodoxOT

               * ethiopianProtestantNT

               * ethiopianProtestantOT

               * georgianOrthodoxDC

               * georgianOrthodoxOT

               * georgianOrthodoxOT2

               * georgianSynodalDC

               * germanLutheranDC

               * greekOrthodoxDC

               * greekOrthodoxOT

               * kjvDC

               * kjvNonDC

               * lutheranNT

               * romanianOrthodoxDC

               * romanianOrthodoxOT

               * russianNT

               * russianOrthodoxDC

               * russianOrthodoxOT

               * russianProtestantOT

               * russianSynodalDC

               * syriacNT

               * syriacOT

               * tanakhOT

               * turkishInterconfessionalDC

               * vulgateCatholicBible

               * westernInterconfessionalDC

               * westernInterconfessionalDC2

               * westernNT

               * westernOT



* **/DBLMetadata/relationships** (Exactly 1)

   * **/DBLMetadata/relationships/relation** (0 or more)

      * **@id** (Exactly 1 string key)

         * The DBL id of the related entry

            * regex: [a-f0-9]{16}

      * **@revision** (Exactly 1 integer)

         * The revision of the related entry

            * min: 1

      * **@relationType** (Exactly 1 string)

         * The role of the related entry with respect to this entry

            * Enum:

               * source

               * expression

      * **@type** (Exactly 1 string)

         * The role of the related entry with respect to this entry

            * Enum:

               * text

               * audio

               * print

      * **@publicationId** (Exactly 1 string)

         * The publication in the related text entry on which to base the braille

            * regex: [A-Za-z][A-Za-z0-9_\-]{0,31}



* **/DBLMetadata/agencies** (Exactly 1)

   * **/DBLMetadata/agencies/rightsHolder** (1 or more)

      * **uid** (Exactly 1 string key)

         * The id of this rights holder

            * regex: [a-f0-9]{24}

      * **name** (Exactly 1 string)

         * The name in English of this rights holder

            * regex: \S.*\S

      * **nameLocal** (0 or 1 string)

         * The local name of this rights holder

            * regex: \S.*\S

      * **abbr** (Exactly 1 string)

         * The abbreviation of this rights holder

            * regex: \S.*\S

      * **url** (0 or 1 string)

         * The URL of this rights holder

            * regex: \S.*\S


   * **/DBLMetadata/agencies/contributor** (1 or more)

      * **uid** (Exactly 1 string key)

         * The id of this contributor

            * regex: [a-f0-9]{24}

      * **name** (Exactly 1 string)

         * The name of this contributor

            * regex: \S.*\S

      * **content** (0 or 1 boolean)

         * Contributes to Content?



      * **finance** (0 or 1 boolean)

         * Contributes to Finance?



      * **management** (0 or 1 boolean)

         * Contributes to Management?



      * **qa** (0 or 1 boolean)

         * Contributes to Quality Assurance?



      * **publication** (0 or 1 boolean)

         * Contributes to publication?




   * **/DBLMetadata/agencies/rightsAdmin** (0 or 1)

      * **uid** (Exactly 1 string key)

         * The id of this rights administrator (24 chars of hex)

            * regex: [a-f0-9]{24}

      * **name** (Exactly 1 string)

         * The name of this rights administrator

            * regex: \S.*\S

      * **url** (0 or 1 string)

         * The URL of this rights administrator

            * regex: \S.*\S



* **/DBLMetadata/language** (Exactly 1)

   * **iso** (Exactly 1 string)

      * The language's 3-character ISO 639-3 code

         * regex: [a-z][a-z][a-z]

   * **name** (Exactly 1 string)

      * The name, in English, of the language

         * regex: \S.*\S

   * **nameLocal** (0 or 1 string)

      * The localized name of the language

         * regex: \S.*\S

   * **scriptCode** (0 or 1 string)

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

   * **script** (0 or 1 string)

      * The name of the script used in this entry

         * regex: \S.*\S

   * **scriptDirection** (0 or 1 string)

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


* **/DBLMetadata/countries** (Exactly 1)

   * **/DBLMetadata/countries/country** (1 or more)

      * **iso** (Exactly 1 string key)

         * The country's 2-character country code

            * regex: [A-Z][A-Z]

      * **name** (Exactly 1 string)

         * The country's name in English

            * regex: \S.*\S

      * **nameLocal** (0 or 1 string)

         * The country's localized name

            * regex: \S.*\S



* **/DBLMetadata/type** (Exactly 1)

   * **isConfidential** (Exactly 1 boolean)

      * Is this entry confidential?




* **/DBLMetadata/format** (Exactly 1)

   * **isContracted** (Exactly 1 boolean)

      * Does the braille transliteration process include contractions?



   * **/DBLMetadata/format/liblouis** (Exactly 1)

      * **version** (Exactly 1 string)

         * The version of Liblouis used for Braille conversion



      * **/DBLMetadata/format/liblouis/table** (Exactly 1)

         * **source** (Exactly 1 string)

            * The URI or other identifier of the table



         * **name** (Exactly 1 string)

            * The human-readable name of the table





   * **/DBLMetadata/format/hyphenationDictionary** (0 or 1)

      * **@src** (Exactly 1 string)

         * The URI or other identifier of the dictionary



      * **name** (Exactly 1 string)

         * The human-readable name of the table




   * **/DBLMetadata/format/numberSign** (Exactly 1)

      * **character** (Exactly 1 string)

         * The symbol used to prefix numbers

            * regex: ([⠀-⣿])*

      * **useInMargin** (Exactly 1 boolean)

         * Set this field if the number sign should be used before numbers in the margin




   * **/DBLMetadata/format/continuousPoetry** (0 or 1)

      * **startIndicator** (0 or 1 string)

         * Character(s) to indicate the start of a section of continuous poetry

            * regex: ([⠀-⣿])*

      * **lineIndicator** (0 or 1 string)

         * Character(s) to indicate the end of a line within a section of continuous poetry

            * regex: ([⠀-⣿])*

      * **lineIndicatorSpaced** (Exactly 1 string)

         * Choose whether line indicator is: never spaced from last word in line; always spaced; or only spaced if the line doesn't end in punctuation

            * Enum:

               * never

               * always

               * sometimes

      * **endIndicator** (0 or 1 string)

         * Character(s) to indicate the end of a section of poetry

            * regex: ([⠀-⣿])*


   * **/DBLMetadata/format/content** (Exactly 1)

      * **chapterNumberStyle** (Exactly 1 string)

         * Select "upper" to display chapter numbers normally or "lower" to use lower 4 dots of braille cell

            * Enum:

               * upper

               * lower

      * **chapterHeadingsNumberFirst** (Exactly 1 boolean)

         * Set to display the chapter number before the word for "chapter"



      * **versedParagraphs** (Exactly 1 boolean)

         * Set to display each verse as a new paragraph



      * **verseSeparator** (Exactly 1 string)

         * Character(s) to insert between verses if one verse follows another on the same line

            * regex: ([⠀-⣿])*

      * **includeIntros** (Exactly 1 boolean)

         * Set to display book introductions



      * **/DBLMetadata/format/content/characterStyles** (0 or 1)

         * **emphasizedWord** (0 or 1 string)

            * The symbol used to prefix emphasized words

               * regex: ([⠀-⣿])*

         * **emphasizedPassageStart** (0 or 1 string)

            * The symbol used to start an emphasized passage

               * regex: ([⠀-⣿])*

         * **emphasizedPassageEnd** (0 or 1 string)

            * The symbol used to end an emphasized passage

               * regex: ([⠀-⣿])*


      * **/DBLMetadata/format/content/footnotes** (0 or 1)

         * **callerSymbol** (Exactly 1 string)

            * Character(s) to use to show a footnote

               * regex: ([⠀-⣿])*


      * **/DBLMetadata/format/content/crossReferences** (0 or 1)

         * **callerSymbol** (Exactly 1 string)

            * Character(s) to use to show a cross reference

               * regex: ([⠀-⣿])*



   * **/DBLMetadata/format/page** (Exactly 1)

      * **charsPerLine** (Exactly 1 integer)

         * The maximum number of characters on a line

            * min: 1

      * **linesPerPage** (Exactly 1 integer)

         * The maximum number of lines on a page

            * min: 1

      * **defaultMarginWidth** (Exactly 1 integer)

         * The default margin width in number of characters

            * min: 1

      * **versoLastLineBlank** (Exactly 1 boolean)

         * Set to leave last line of verso pages blank



      * **carryLines** (Exactly 1 integer)

         * A heading starting within this number of lines of the bottom of page will be carried over to next page

            * min: 1



* **/DBLMetadata/names** (Exactly 1)

   * **/DBLMetadata/names/name** (0 or more)

      * **@id** (Exactly 1 string key)

         * The id of this name

            * regex: [A-Za-z][\-A-Za-z0-9_]+

      * **short** (Exactly 1 string)

         * The short label for this name, which is required and will be used as a default for the other labels if necessary

            * regex: \S.(.{0,253}\S)?

      * **abbr** (0 or 1 string)

         * The abbreviation for this name

            * regex: \S(.{0,253}\S)?

      * **long** (0 or 1 string)

         * The long label for this name

            * regex: \S(.{0,1022}\S)?



* **/DBLMetadata/publications** (Exactly 1)

   * **/DBLMetadata/publications/publication** (1 or more)

      * **@id** (Exactly 1 string key)

         * The id of the publication

            * regex: [A-Za-z][A-Za-z0-9_\-]{0,31}

      * **name** (0 or 1 string)

         * The publication's name, in English

            * regex: \S.*\S

      * **nameLocal** (0 or 1 string)

         * The publication's localized name

            * regex: \S.*\S

      * **abbreviation** (0 or 1 string)

         * The publication's abbreviation, in English (no exotic characters)

            * regex: [\-A-Za-z0-9]{2,12}

      * **abbreviationLocal** (0 or 1 string)

         * The publication's localized abbreviation

            * regex: \S.{0,10}\S

      * **description** (0 or 1 string)

         * The publication's description, in English

            * regex: \S.*\S

      * **descriptionLocal** (0 or 1 string)

         * The publication's localized description

            * regex: \S.*\S

      * **scope** (0 or 1 string)

         * The publication's scope

            * Enum:

               * Bible

               * Bible with Deuterocanon

               * New Testament

               * New Testament+

               * Old Testament

               * Old Testament + Deuterocanon

               * Old Testament+

               * Portions

               * Selections

               * Shorter Bible

      * **/DBLMetadata/publications/publication/countries** (0 or 1)

         * **/DBLMetadata/publications/publication/countries/country** (1 or more)

            * **iso** (Exactly 1 string key)

               * The country's 2-character country code

                  * regex: [A-Z][A-Z]

            * **name** (Exactly 1 string)

               * The country's name in English

                  * regex: \S.*\S

            * **nameLocal** (0 or 1 string)

               * The country's localized name

                  * regex: \S.*\S



      * **/DBLMetadata/publications/publication/canonSpec** (0 or 1)

         * **@type** (Exactly 1 string)

            * The overall structure and order of this canon. (OT+ here means canonical and deuterocanonical OT books interleaved within the same section, like most Catholic Bibles)

               * Enum:

                  * OT

                  * OT+

                  * DC

                  * NT

                  * OT, NT

                  * OT+, NT

                  * OT, NT, DC

                  * OT, DC, NT

         * **component** (1 or more string)

            * The components of this canon, which should match the canon type chosen above. eg, if the canon type is "0T, NT", there should be one OT and one NT component here.

               * Enum:

                  * armenianApostolicDC

                  * armenianApostolicOT

                  * armenianApostolicOT2

                  * armenianClassicalOT

                  * armenianNT

                  * catholicAndAnglicanDC

                  * catholicLxxDC

                  * catholicLxxOT

                  * catholicLxxSeparatedDC

                  * catholicPlusLutheranDC

                  * catholicVulgateDC

                  * catholicVulgateOT

                  * catholicVulgateSeparatedDC

                  * czechKralickaDC

                  * danishLutheranDC

                  * ethiopianOrthodoxDC

                  * ethiopianOrthodoxNT

                  * ethiopianOrthodoxOT

                  * ethiopianProtestantNT

                  * ethiopianProtestantOT

                  * georgianOrthodoxDC

                  * georgianOrthodoxOT

                  * georgianOrthodoxOT2

                  * georgianSynodalDC

                  * germanLutheranDC

                  * greekOrthodoxDC

                  * greekOrthodoxOT

                  * kjvDC

                  * kjvNonDC

                  * lutheranNT

                  * romanianOrthodoxDC

                  * romanianOrthodoxOT

                  * russianNT

                  * russianOrthodoxDC

                  * russianOrthodoxOT

                  * russianProtestantOT

                  * russianSynodalDC

                  * syriacNT

                  * syriacOT

                  * tanakhOT

                  * turkishInterconfessionalDC

                  * vulgateCatholicBible

                  * westernInterconfessionalDC

                  * westernInterconfessionalDC2

                  * westernNT

                  * westernOT




* **/DBLMetadata/copyright** (Exactly 1)

   * **/DBLMetadata/copyright/fullStatement** (0 or 1)

      * **statementContent[@type='xhtml']/*** (0 or 1 xml)

         * The copyright statement in DBL's subset of XHTML (must be valid XML, ie tags must match.)

            * schema: dbl/2_2/dbl-xhtml

      * **statementContent[@type='plain']** (0 or 1 string)

         * The copyright statement in plain text




   * **/DBLMetadata/copyright/shortStatement** (0 or 1)

      * **statementContent[@type='xhtml']** (0 or 1 xml)

         * The copyright statement in DBL's subset of XHTML (must be valid XML, ie tags must match.)

            * schema: dbl-xhtml

      * **statementContent[@type='plain']** (0 or 1 string)

         * The copyright statement in plain text





* **/DBLMetadata/promotion** (Exactly 1)

   * **/DBLMetadata/promotion/promoVersionInfo** (0 or 1)

      * **./*** (0 or 1 xml)

         * Promotional material in DBL's subset of XHTML (must be valid XML, ie tags must match.)

            * schema: dbl/2_2/dbl-xhtml



* **/DBLMetadata/archiveStatus** (Exactly 1)

   * **bundleCreatorName** (0 or 1 string)

      * The name of the archivist creating this bundle

         * regex: \S.*\S

   * **archivistName** (Exactly 1 string)

      * The name of the archivist uploading this bundle

         * regex: \S.*\S

   * **comments** (Exactly 1 string)

      * Comments on the latest revision of this entry

         * regex: \S(.{0,253})\S




