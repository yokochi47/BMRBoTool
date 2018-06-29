#!/bin/bash

which isql &> /dev/null

if [ $? != 0 ] ; then

 echo "isql: command not found..."
 echo "Please install Virtuoso (https://virtuoso.openlinksw.com/)."

 exit 1

fi

if [ -z $VIRTUOSO_HOME ] ; then

 echo "Need to set VIRTUOSO_HOME."
 exit 1

fi

if [ ! -d $VIRTUOSO_HOME ] ; then

 echo "$VIRTUOSO_HOME is not directory."
 exit 1

fi

echo
echo "Do you want to initialize Virtuoso? (y [n]) ? "

read ans

case $ans in
 y*|Y*) ;;
 *)
  echo skipped.
  exit 1;;
esac

VIRTUOSO_DB_PORT=1111
VIRTUOSO_DB_USER=dba
VIRTUOSO_DB_PASS=dba

isql $VIRTUOSO_DB_PORT $VIRTUOSO_DB_USER $VIRTUOSO_DB_PASS exec="status();" &> /dev/null

if [ $? = 0 ] ; then

 while true ; do

  pidof virtuoso-t > /dev/null

  if [ $? != 0 ] ; then
   break
  fi

  echo "stop virtuoso (local)"
  isql $VIRTUOSO_DB_PORT $VIRTUOSO_DB_USER $VIRTUOSO_DB_PASS -K

  sleep 60

 done

fi

VIRTUOSO_DATA_DIR=$VIRTUOSO_HOME/var/lib/virtuoso/db

rm -f $VIRTUOSO_DATA_DIR/virtuoso.db $VIRTUOSO_DATA_DIR/virtuoso.pxa $VIRTUOSO_DATA_DIR/virtuoso-temp.db $VIRTUOSO_DATA_DIR/virtuoso.trx

./start_virtuoso.sh

# exit $?

