#!/bin/bash

RDF_DOC_DIR=.

files=0
lines=0

for file in `ls $RDF_DOC_DIR/*.rdf 2> /dev/null`
do

 BASENAME=`basename $file .rdf`
 RDF_DOC_FILE=$RDF_DOC_DIR/$BASENAME.rdf

 if [ -e $RDF_DOC_FILE ] ; then

  echo -n .

  line=`wc -l $RDF_DOC_FILE | cut -d ' ' -f 1`
  lines=`expr $lines + $line`
  let files++

 fi

done

echo

echo "Total files: $files"
echo "Total lines: $lines"

