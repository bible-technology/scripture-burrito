########################################
Report based on Template Tree video.json
########################################

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

   * **container** (Exactly 1 string)

      * The video container (something like 'MP4')



   * **/DBLMetadata/format/videoStream** (Exactly 1)

      * **codec** (Exactly 1 string)

         * The codec used to encode the video



      * **bitRate** (Exactly 1 integer)

         * The bit rate of the video

            * min: 1

      * **frameRate** (Exactly 1 decimal)

         * The frame rate of the video

            * min: 1

      * **screenResolution** (Exactly 1 string)

         * The screen resolution of the video (WxH)

            * regex: [1-9][0-9]{0,3}x[1-9][0-9]{0,3}


   * **/DBLMetadata/format/audioStream** (0 or 1)

      * **compression** (0 or 1 string)

         * The compression method used for the audio stream of the video in the entry

            * Enum:

               * MP3

               * FLAC

               * WAV

               * AAC

      * **trackConfiguration** (0 or 1 string)

         * The track configuration of the audio stream of the video in the entry

            * Enum:

               * 1/0 (Mono)

               * Dual mono

               * 2/0 (Stereo)

               * 5.1 Surround

      * **bitRate** (0 or 1 integer)

         * The bit rate of the audio stream of the video in the entry

            * min: 1

      * **bitDepth** (0 or 1 integer)

         * The bit depth of the audio stream of the video in the entry

            * min: 1

      * **samplingRate** (0 or 1 integer)

         * The sampling rate of the audio stream of the video in the entry

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


* **/DBLMetadata/progress** (0 or 1)

   * **/DBLMetadata/progress/book** (1 or more)

      * **@code** (Exactly 1 string key)

         * The three-character code of the book

            * Enum:

               * GEN

               * EXO

               * LEV

               * NUM

               * DEU

               * JOS

               * JDG

               * RUT

               * 1SA

               * 2SA

               * 1KI

               * 2KI

               * 1CH

               * 2CH

               * EZR

               * NEH

               * EST

               * JOB

               * PSA

               * PRO

               * ECC

               * SNG

               * ISA

               * JER

               * LAM

               * EZK

               * DAN

               * HOS

               * JOL

               * AMO

               * OBA

               * JON

               * MIC

               * NAM

               * HAB

               * ZEP

               * HAG

               * ZEC

               * MAL

               * MAT

               * MRK

               * LUK

               * JHN

               * ACT

               * ROM

               * 1CO

               * 2CO

               * GAL

               * EPH

               * PHP

               * COL

               * 1TH

               * 2TH

               * 1TI

               * 2TI

               * TIT

               * PHM

               * HEB

               * JAS

               * 1PE

               * 2PE

               * 1JN

               * 2JN

               * 3JN

               * JUD

               * REV

               * TOB

               * JDT

               * ESG

               * WIS

               * SIR

               * BAR

               * LJE

               * S3Y

               * SUS

               * BEL

               * 1MA

               * 2MA

               * 3MA

               * 4MA

               * 1ES

               * 2ES

               * MAN

               * PS2

               * ODA

               * PSS

               * JSA

               * JDB

               * TBS

               * SST

               * DNT

               * BLT

               * EZA

               * 5EZ

               * 6EZ

               * DAG

               * PS3

               * 2BA

               * LBA

               * JUB

               * ENO

               * 1MQ

               * 2MQ

               * 3MQ

               * REP

               * 4BA

               * LAO

      * **@stage** (Exactly 1 integer)

         * The old-style Paratext progress stage (1-6)

            * min: 1
            * max: 6





