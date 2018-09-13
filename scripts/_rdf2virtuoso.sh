#!/bin/bash

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

 VIRTUOSO_ERR_DIR=$PREFIX"_virtuoso_"$ATOM"_err"

else

 VIRTUOSO_ERR_DIR=$PREFIX"_virtuoso_err"

fi

./scripts/rdf2virtuoso.sh -p $PREFIX -a $ATOM -u $UPDATE || ( echo "$0 aborted." && exit 1 )

red='\e[0;31m'
normal='\e[0m'

for file in `ls $VIRTUOSO_ERR_DIR/*_err 2> /dev/null`
do

 if [ ! -s $file ] ; then

  rm -f $file

 fi

done

errs=`ls $VIRTUOSO_ERR_DIR/*_err 2> /dev/null | wc -l`

if [ $errs = 0 ] ; then

 if [ $ATOM = "atom" ] ; then
  echo "RDF->VIRTUOSO (prefix:"$PREFIX") is completed."
 else
  echo "RDF->VIRTUOSO (prefix:"$PREFIX"-"$ATOM") is completed."
 fi

 rm -rf $VIRTUOSO_ERR_DIR

 date -u +"%b %d, %Y" > /tmp/$PREFIX-virtuoso-last

 sleep 60

else

 for file in $VIRTUOSO_ERR_DIR/*_err
 do

  BASENAME=`basename $file _err`
  echo File: $BASENAME.rdf

 done

 echo
 echo -e "${red}$errs errors were detected. Please check the log files for more details.${normal}"
 exit 1

fi

