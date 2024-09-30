#!/bin/bash

WORK_DIR=
FILE_LIST=
TOTAL=

ARGV=`getopt --long -o "d:l:n:t:" "$@"`
eval set -- "$ARGV"
while true ; do
 case "$1" in
 -d)
  WORK_DIR=$2
  shift
 ;;
 -l)
  FILE_LIST=$2
  shift
 ;;
 -n)
  PROC_INFO=$2
  shift
 ;;
 -t)
  TOTAL=$2
  shift
 ;;
 *)
  break
 ;;
 esac
 shift
done

if ! [[ $PROC_INFO =~ .*of.* ]] ; then

 echo "Invalid thread id ($PROC_INFO)."
 exit 1

fi

MAXPROCS=`echo $PROC_INFO | cut -d 'f' -f 2`
PROC_ID=`echo $PROC_INFO | cut -d 'o' -f 1`
PROC_ID=$(($PROC_ID - 1))

proc_id=0

while read rdf_gz_file
do

 proc_id_mod=$(($proc_id % $MAXPROCS))

 if [ $proc_id_mod = $PROC_ID ] ; then

  if [ ! -e $rdf_gz_file ] ; then

   let proc_id++
   continue

  fi

  rdf_file=${rdf_gz_file%.*}

  ( gunzip -c $rdf_gz_file | sed 's/xsd:/http:\/\/www.w3.org\/2001\/XMLSchema#/' > $rdf_file ; rm -f $rdf_gz_file ; gzip $rdf_file )

  if [ $proc_id_mod -eq 0 ] ; then
   echo -e -n "\rDone "$((proc_id + 1)) of $TOTAL ...
  fi

 fi

 let proc_id++

done < $FILE_LIST

