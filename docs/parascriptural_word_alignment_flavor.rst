.. _parascriptural_word_alignment_flavor:

#############################
Parascriptural Word Alignment
#############################

=======
Content
=======

The is a format for specifying the word level alignment of scriptural text. Word alignment is the mapping of semantically identical/related words between two translations or versions. These mappings can be of the types: one-one, one-many, many-one, many-many, none-one/many or one/many-none. These mappings are created after a obtaining a source and target text and are usually linked manually by individuals who know at least one of the languages (if more than one) and can discern the relationship between the words of the two langauges. Alternatively, these may be obtained automatically using techniques from compuational linguistics.

Word alignments enable accounting for every word in the translation and may be used as a check to ensure adherence and faithfulness to the source language used in translations. Further, it is commonly used to train compuational models by providing rich information about the connection between words and their translations in minority languages. This may be used as training data for machine learning based models.


======
Status
======

translationCore, the scripture checking tool, uses word alignment data to generate its checks between two different languages. In order for it to work for languages being translated in India, they asked Bridge Connectivity Solutions (BCS) to undertake the task and provide the word alignments between the various gateway languages and the original languages (Greek for NT). BCS created a scripture alignment tool for the task, as alternatives did not seem to meet their specific needs. On completing the alignments, BCS was unclear on how to handover the alignment data to the translationCore team. An interchange format was needed since the data was created in one tool and was intended to be used in another. After some thinking and discussion, they both decided to work on a common interchange format based on their experiences. After a few iterations, the teams landed on this specification to be used for the information interchange. It has worked for them and was used transferring alignment multiple gateway languages. That said, there would be improvements still possible. Any feedback is welcome.


=======================
Metadata Flavor Details
=======================

[Brief description of what each field is for]

------------------
autoAlignerVersion
------------------

-------
stemmer
-------

---------------
manualAlignment
---------------

....
user
....

..........
references
..........

===========
Conventions
===========

None
