#!/bin/bash

#PREFIX=bmr
ATOM=noatom

ZIP=gzip

ARGV=`getopt --long -o "a:" "$@"`
eval set -- "$ARGV"
while true ; do
 case "$1" in
 -a)
  ATOM=$2
  shift
 ;;
 *)
  break
 ;;
 esac
 shift
done

if [ $ATOM != "noatom" ] && [ $ATOM != "atom" ] ; then

 echo "Usage: $0 -a ATOM"
 echo ATOM should be either \"noatom\" or \"atom\".

 exit 1

fi

if [ $ATOM = "atom" ] ; then

 RDF_REL_DIR=$PREFIX"_rdf_"$ATOM"_rel"
 RDF_RAW_DIR=$PREFIX"_rdf_"$ATOM"_raw"
 RDF_DOC_DIR=$PREFIX"_rdf_"$ATOM"_doc"

else

 RDF_REL_DIR=$PREFIX"_rdf_rel"
 RDF_RAW_DIR=$PREFIX"_rdf_raw"
 RDF_DOC_DIR=$PREFIX"_rdf_doc"

fi

if [ ! -d $RDF_REL_DIR ] ; then

 echo "Couldn't find $RDF_REL_DIR directory."
 exit 1

fi

if [ ! -d $RDF_RAW_DIR ] ; then

 echo "Couldn't find $RDF_RAW_DIR directory."
 exit 1

fi

mkdir -p $RDF_DOC_DIR

for file in `ls $RDF_REL_DIR/*_rel 2> /dev/null`
do

 BASENAME=`basename $file _rel`

 if [ -e $RDF_RAW_DIR/$BASENAME.rdf ] && [ ! -e $RDF_DOC_DIR/$BASENAME.rdf.gz ] ; then

  cp -f $RDF_RAW_DIR/$BASENAME.rdf $RDF_DOC_DIR

  $ZIP -f $RDF_DOC_DIR/$BASENAME.rdf
  echo $BASENAME.rdf.gz done.

 fi

done

