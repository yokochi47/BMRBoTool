#!/bin/bash

exit

MAXPROCS=`cat /proc/cpuinfo 2> /dev/null | grep 'cpu cores' | wc -l 2> /dev/null`

if [ $MAXPROCS = 0 ] ; then
 MAXPROCS=1
fi

RDF_DIRS=("bmr_rdf_doc" "bms_rdf_doc")

for RDF_DIR in ${RDF_DIRS[@]} ; do

 if [ -d $RDF_DIR ] ; then

  rdf_file_list=rdf_file_list

  find $RDF_DIR -maxdepth 1 -name '*.rdf.gz' > $rdf_file_list
  total=`wc -l $rdf_file_list`

  for proc_id in `seq 1 $MAXPROCS` ; do

   ./scripts/avoid_qname_attr_gz_worker.sh -d $RDF_DIR -l $rdf_file_list -n $proc_id"of"$MAXPROCS -t $total &

  done

  if [ $? != 0 ] ; then

   echo $0 aborted.
   exit 1

  fi

  wait

  echo

  rm -f $rdf_file_list $rdf_file_list~

 fi

 echo $RDF_DIR is up-to-date.

done
