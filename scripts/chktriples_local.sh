#!/bin/bash

RDF_DOC_DIR=.

triples=0

for file in `ls $RDF_DOC_DIR/*.rdf 2> /dev/null`
do

 BASENAME=`basename $file .rdf`
 RDF_DOC_FILE=$RDF_DOC_DIR/$BASENAME.rdf

 if [ -e $RDF_DOC_FILE ] ; then

  echo -n .

  rapper -c $RDF_DOC_FILE 2> tmp
  triple=`sed -e '1,2d' < tmp | cut -d ' ' -f 4`
  triples=`expr $triples + $triple`
  rm tmp

 fi

done

echo

echo "Total triples: $triples"

