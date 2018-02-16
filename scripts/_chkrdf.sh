#!/bin/bash

#MAXPROCS=`cat /proc/cpuinfo 2> /dev/null | grep 'cpu cores' | uniq | sed 's/\s//g' | cut -d ':' -f 2`
MAXPROCS=`cat /proc/cpuinfo 2> /dev/null | grep 'cpu cores' | wc -l`

if [ $MAXPROCS = 0 ] ; then
 MAXPROCS=1
fi

source ./scripts/xtool-home.sh

#PREFIX=bmr
ATOM=noatom

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

 RDF_RAW_DIR=$PREFIX"_rdf_"$ATOM"_raw"
 RDF_ERR_DIR=$PREFIX"_rdf_"$ATOM"_err"
 XML_ULIST=$BMRBX_TOOL_HOME/$PREFIX"_xml_ulist"

else

 RDF_RAW_DIR=$PREFIX"_rdf_raw"
 RDF_ERR_DIR=$PREFIX"_rdf_err"
 XML_ULIST=$BMRBX_TOOL_HOME/$PREFIX"_xml_"$ATOM"_ulist"

fi

for proc_id in `seq 1 $MAXPROCS` ; do

 if [ $proc_id = 1 ] ; then

  sleep 1
  ./scripts/chkrdf.sh -p $PREFIX -a $ATOM -i yes -n $proc_id"of"$MAXPROCS &

 else

  sleep 1
  ./scripts/chkrdf.sh -p $PREFIX -a $ATOM -i no -n $proc_id"of"$MAXPROCS &

 fi

done

if [ $? != 0 ] ; then
 echo "$0 aborted."
 exit 1
fi

wait

echo

red='\e[0;31m'
normal='\e[0m'

errs=`ls $RDF_ERR_DIR/*_err 2> /dev/null | wc -l`

if [ $errs = 0 ] ; then

 if [ $ATOM = "atom" ] ; then
  echo "RDF files (prefix:"$PREFIX") are validated."
 else
  echo "RDF files (prefix:"$PREFIX"-"$ATOM") are validated."
 fi
 rm -rf $RDF_ERR_DIR

else

 for file in $RDF_ERR_DIR/*_err
 do

  BASENAME=`basename $file _err`
  echo File: $BASENAME.rdf

 done

 echo
 echo -e "${red}$errs errors were detected. Please check the log files for more details.${normal}"

 exit 1

fi

rm -f $XML_ULIST

