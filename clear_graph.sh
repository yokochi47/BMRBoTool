#!/bin/bash

VIRTUOSO_DB_PORT=1111
VIRTUOSO_DB_USER=dba
VIRTUOSO_DB_PASS=dba

which isql &> /dev/null

if [ $? != 0 ] ; then

 echo "isql: command not found..."
 echo "Please install Virtuoso (https://virtuoso.openlinksw.com/)."
 exit 1

fi

./start_virtuoso.sh || exit 1

GRAPH_URI=$1

graph_exist=`./ask_graph_existance.sh $GRAPH_URI` || ( echo GRAPH <$GRAPH_URI> does not exist. && exit 0 )

VIRTUOSO_EXEC_COM="log_enable(3,1); SPARQL CLEAR GRAPH <$GRAPH_URI>;"
echo $VIRTUOSO_EXEC_COM

isql $VIRTUOSO_DB_PORT $VIRTUOSO_DB_USER $VIRTUOSO_DB_PASS exec="$VIRTUOSO_EXEC_COM" || exit 1

VIRTUOSO_EXEC_COM="log_enable(3,1); DELETE FROM rdf_quad g = iri_to_id ('$GRAPH_URI');"
echo $VIRTUOSO_EXEC_COM

isql $VIRTUOSO_DB_PORT $VIRTUOSO_DB_USER $VIRTUOSO_DB_PASS exec="$VIRTUOSO_EXEC_COM" || exit 1

