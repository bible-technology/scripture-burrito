############
VIDEO FORMAT
############

*******************
IN DBL METADATA 2.2
*******************

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

************************
PROPOSED CHANGES FOR 2.3
************************

****************************************
ISSUES TO CONSIDER FOR SCRIPTURE BURRITO
****************************************
