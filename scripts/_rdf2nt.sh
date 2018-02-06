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
  shift 2
 ;;
 *)
  break
 ;;
 esac
done

if [ $ATOM != "noatom" ] && [ $ATOM != "atom" ] ; then

 echo "Usage: $0 -a ATOM"
 echo ATOM should be either \"noatom\" or \"atom\".

 exit 1

fi

if [ $ATOM = "atom" ] ; then

 RDF_REL_DIR=$PREFIX"_rdf_"$ATOM"_rel"
 RDF_RAW_DIR=$PREFIX"_rdf_"$ATOM"_raw"
 NT_DOC_DIR=$PREFIX"_nt_"$ATOM"_doc"

else

 RDF_REL_DIR=$PREFIX"_rdf_rel"
 RDF_RAW_DIR=$PREFIX"_rdf_raw"
 NT_DOC_DIR=$PREFIX"_nt_doc"

fi

which rapper &> /dev/null

if [ $? != 0 ] ; then

 echo "rapper: command not found..."
 echo "Please install Raptor RDF Syntax Library (http://librdf.org/raptor/)."

 exit 1

fi

if [ ! -d $RDF_REL_DIR ] ; then

 echo "Couldn't find $RDF_REL_DIR directory."
 exit 1

fi

if [ ! -d $RDF_RAW_DIR ] ; then

 echo "Couldn't find $RDF_RAW_DIR directory."
 exit 1

fi

mkdir -p $NT_DOC_DIR

for file in `ls $RDF_REL_DIR/*_rel 2> /dev/null`
do

 BASENAME=`basename $file _rel`

 if [ -e $RDF_RAW_DIR/$BASENAME.rdf ] && [ ! -e $NT_DOC_DIR/$BASENAME.nt.gz ] ; then

  rapper -q $RDF_RAW_DIR/$BASENAME.rdf > $NT_DOC_DIR/$BASENAME.nt

  $ZIP -f $NT_DOC_DIR/$BASENAME.nt
  echo $BASENAME.nt.gz done.

 fi

done

