#!/bin/bash

# tell bash delimiters are line feeds, so we can pass in filenames with spaces
IFS=$'\n'

INPUTFILE=$1
TMPFILE="/tmp/pdf-ocr-score.words"

# extract text to temp file
pdftotext $1 $TMPFILE

# how many words in the file?
WORDS=$(cat $TMPFILE | wc -w); echo "Words: $WORDS"

# if there were no words, the PDF doesn't have any searchable text at all
if [ $WORDS -eq '0' ]
then
	echo "No OCR!"
	rm $TMPFILE
	exit 1
fi

# what proportion of the words are unknown to the spell checker?
TYPOS=$(cat $TMPFILE | aspell list | wc -w);echo "Typos: $TYPOS"
PERCENT=$((( $TYPOS*100 )/ $WORDS ))

# output and cleanup
echo "Typo percentage: $PERCENT"
rm $TMPFILE
