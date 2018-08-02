#!/bin/bash

MAXPROCS=`cat /proc/cpuinfo 2> /dev/null | grep 'cpu cores' | wc -l`

MAXPROCS=`echo "scale=0; $MAXPROCS / 2.5" | bc`

if [ $MAXPROCS = 0 ] ; then
 MAXPROCS=1
fi

PREFIX=
ATOM=noatom
UPDATE=yes

ARGV=`getopt --long -o "p:a:u:" "$@"`
eval set -- "$ARGV"
while true ; do
 case "$1" in
 -p)
  PREFIX=$2
  shift
 ;;
 -a)
  ATOM=$2
  shift
 ;;
 -u)
  UPDATE=$2
  shift
 ;;
 *)
  break
 ;;
 esac
 shift
done

if [ $PREFIX != "bmr" ] && [ $PREFIX != "bms" ] ; then

 echo "Usage: $0 -p PREFIX"
 echo PREFIX should be either \"bmr\" or \"bms\".
 exit 1

fi

if [ $ATOM != "noatom" ] && [ $ATOM != "atom" ] ; then

 echo "Usage: $0 -a ATOM"
 echo ATOM should be either \"noatom\" or \"atom\".
 exit 1

fi

if [ $ATOM = "atom" ] ; then

 RDF_RAW_DIR=$PREFIX"_rdf_"$ATOM"_raw"
 VIRTUOSO_ERR_DIR=$PREFIX"_virtuoso_"$ATOM"_err"

else

 RDF_RAW_DIR=$PREFIX"_rdf_raw"
 VIRTUOSO_ERR_DIR=$PREFIX"_virtuoso_err"

fi

which isql &> /dev/null

if [ $? != 0 ] ; then

 echo "isql: command not found..."
 echo "Please install Virtuoso (https://virtuoso.openlinksw.com/)."
 exit 1

fi

if [ ! -d $RDF_RAW_DIR ] ; then

 echo "Couldn't find $RDF_RAW_DIR directory."
 exit 1

fi

GRAPH_URI=https://bmrbpub.pdbj.org/rdf/$PREFIX

red='\e[0;31m'
normal='\e[0m'

rm -rf $VIRTUOSO_ERR_DIR
mkdir $VIRTUOSO_ERR_DIR

VIRTUOSO_ERR_FILE=$VIRTUOSO_ERR_DIR/$PREFIX"_err"

VIRTUOSO_DB_PORT=1111
VIRTUOSO_DB_USER=dba
VIRTUOSO_DB_PASS=dba

graph_exist=`./ask_graph_existance.sh $GRAPH_URI`

if [ $graph_exist = 1 ] ; then
 ./clear_graph.sh $GRAPH_URI
fi

VIRTUOSO_EXEC_COM="ld_dir('$PWD/$RDF_RAW_DIR', '*.rdf', '$GRAPH_URI');"
echo $VIRTUOSO_EXEC_COM

isql $VIRTUOSO_DB_PORT $VIRTUOSO_DB_USER $VIRTUOSO_DB_PASS exec="$VIRTUOSO_EXEC_COM" 2> $VIRTUOSO_ERR_FILE || exit 1

rm -f $VIRTUOSO_ERR_FILE

for proc_id in `seq 1 $MAXPROCS` ; do

 isql $VIRTUOSO_DB_PORT $VIRTUOSO_DB_USER $VIRTUOSO_DB_PASS exec="rdf_loader_run();" &

done

if [ $? != 0 ] ; then
 exit 1
fi

wait

isql $VIRTUOSO_DB_PORT $VIRTUOSO_DB_USER $VIRTUOSO_DB_PASS exec="checkpoint;" || exit 1

