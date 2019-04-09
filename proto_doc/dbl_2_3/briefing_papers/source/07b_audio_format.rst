############
AUDIO FORMAT
############

*******************
IN DBL METADATA 2.2
*******************

* **compression** (0 or 1 string)

    * The compression method used for the audio files in the entry

        * Enum:

        * MP3

        * FLAC

        * WAV

        * AAC

* **trackConfiguration** (0 or 1 string)

    * The track configuration of the audio files in the entry

        * Enum:

        * 1/0 (Mono)

        * Dual mono

        * 2/0 (Stereo)

        * 5.1 Surround

* **bitRate** (0 or 1 integer)

    * The bit rate of the audio files in the entry

        * min: 1

* **bitDepth** (0 or 1 integer)

    * The bit depth of the audio files in the entry

        * min: 1

* **samplingRate** (0 or 1 integer)

    * The sampling rate of the audio files in the entry

        * min: 1

************************
PROPOSED CHANGES FOR 2.3
************************

===========
Conventions
===========

* whole-chapter

* book-dirs

=====
Roles
=====

* book-introduction

* audio-timing

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************

None.