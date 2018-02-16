#!/bin/bash

#MAXPROCS=`cat /proc/cpuinfo 2> /dev/null | grep 'cpu cores' | uniq | sed 's/\s//g' | cut -d ':' -f 2`
MAXPROCS=`cat /proc/cpuinfo 2> /dev/null | grep 'cpu cores' | wc -l`

if [ $MAXPROCS = 0 ] ; then
 MAXPROCS=1
fi

#PREFIX=bmr
UPDATE=yes
ATOM=noatom

ARGV=`getopt --long -o "u:a:" "$@"`
eval set -- "$ARGV"
while true ; do
 case "$1" in
 -u)
  UPDATE=$2
  shift
 ;;
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

 XML_TMP_DIR=$PREFIX"_xml_"$ATOM"_raw"
 RDF_RAW_DIR=$PREFIX"_rdf_"$ATOM"_raw"
 RDF_ERR_DIR=$PREFIX"_rdf_"$ATOM"_err"
 RDF_REL_DIR=$PREFIX"_rdf_"$ATOM"_rel"

else

 XML_TMP_DIR=$PREFIX"_xml_raw"
 RDF_RAW_DIR=$PREFIX"_rdf_raw"
 RDF_ERR_DIR=$PREFIX"_rdf_err"
 RDF_REL_DIR=$PREFIX"_rdf_rel"

fi

for proc_id in `seq 1 $MAXPROCS` ; do

 if [ $proc_id = 1 ] ; then

  sleep 1
  ./scripts/xml2rdf.sh -p $PREFIX -a $ATOM -u $UPDATE -i yes -n $proc_id"of"$MAXPROCS &

 else

  sleep 1
  ./scripts/xml2rdf.sh -p $PREFIX -a $ATOM -u $UPDATE -i no -n $proc_id"of"$MAXPROCS &

 fi

done

if [ $? != 0 ] ; then
 echo "$0 aborted."
 exit 1
fi

wait

echo

rm -f $RDF_RAW_DIR/chklines_local.sh
ln -s ../scripts/chklines_local.sh $RDF_RAW_DIR

rm -f $RDF_RAW_DIR/chktriples_local.sh
ln -s ../scripts/chktriples_local.sh $RDF_RAW_DIR

red='\e[0;31m'
normal='\e[0m'

errs=`ls $RDF_ERR_DIR/*_err 2> /dev/null | wc -l`

if [ $errs = 0 ] ; then

 if [ $ATOM = "atom" ] ; then
  echo "RDF files (prefix:"$PREFIX") are update."
 else
  echo "RDF files (prefix:"$PREFIX"-"$ATOM") are update."
 fi
 rm -rf $XML_TMP_DIR
 rm -rf $RDF_ERR_DIR

else

 for file in $RDF_ERR_DIR/*_err
 do

  BASENAME=`basename $file _err`
  echo File: $BASENAME.rdf
  rm -f $RDF_REL_DIR/$BASENAME"_rel"

 done

 echo
 echo -e "${red}$errs errors were detected. Please check the log files for more details.${normal}"

 exit 1

fi

