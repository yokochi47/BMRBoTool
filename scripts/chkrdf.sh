#!/bin/bash

PREFIX=
ATOM=noatom
INIT=yes
PROC_INFO=1of1

ARGV=`getopt --long -o "p:a:i:n:" "$@"`
eval set -- "$ARGV"
while true ; do
 case "$1" in
 -p)
  PREFIX=$2
  shift 2
 ;;
 -a)
  ATOM=$2
  shift 2
 ;;
 -i)
  INIT=$2
  shift 2
 ;;
 -n)
  PROC_INFO=$2
  shift 2
 ;;
 *)
  break
 ;;
 esac
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
 RDF_ERR_DIR=$PREFIX"_rdf_"$ATOM"_err"
 RDF_REL_DIR=$PREFIX"_rdf_"$ATOM"_rel"

else

 RDF_RAW_DIR=$PREFIX"_rdf_raw"
 RDF_ERR_DIR=$PREFIX"_rdf_err"
 RDF_REL_DIR=$PREFIX"_rdf_rel"

fi

_RDF_REL_BASE=$RDF_RAW_DIR/rel_

which rapper &> /dev/null

if [ $? != 0 ] ; then

 echo "rapper: command not found..."
 echo "Please install Raptor RDF Syntax Library (http://librdf.org/raptor/)."

 exit 1

fi

if [ ! -d $RDF_RAW_DIR ] ; then

 echo "Couldn't find $RDF_RAW_DIR directory."
 exit 1

fi

if [[ $INIT =~ ^[yY].* ]] ; then

 rm -rf $RDF_ERR_DIR
 mkdir $RDF_ERR_DIR

 if [ ! -d $RDF_REL_DIR ] ; then

  rm -rf $RDF_REL_DIR
  mkdir $RDF_REL_DIR

 fi

fi

if ! [[ $PROC_INFO =~ .*of.* ]] ; then

 echo "Invalid thread id ($PROC_INFO)."
 exit 1

fi

MAXPROCS=`echo $PROC_INFO | cut -d 'f' -f 2`
PROC_ID=`echo $PROC_INFO | cut -d 'o' -f 1`
PROC_ID=`expr $PROC_ID - 1`

red='\e[0;31m'
normal='\e[0m'

errproc() {

 BASENAME=$1
 RDF_DOC_FILE=$2
 RDF_ERR_FILE=$3

 rm -f $RDF_DOC_FILE

 echo
 echo -e "${red}$BASENAME.rdf is invalid.${normal}"

}

for file in `ls $RDF_RAW_DIR/*.rdf 2> /dev/null`
do

 BASENAME=`basename $file .rdf`
 RDF_DOC_FILE=$RDF_RAW_DIR/$BASENAME.rdf
 RDF_ERR_FILE=$RDF_ERR_DIR/$BASENAME"_err"
 RDF_REL_FILE=$RDF_REL_DIR/$BASENAME"_rel"

 if [ ! -e $RDF_REL_FILE ] ; then

  if [ -e $RDF_DOC_FILE ] ; then

   LS_OUT=`ls -i $RDF_DOC_FILE 2> /dev/null`

   if [ $? = 0 ] ; then

    INODE=`echo $LS_OUT | cut -d ' ' -f 1`
    INODE_MOD=`expr $INODE % $MAXPROCS`

    if [ $INODE_MOD = $PROC_ID ] ; then

     rapper -q --count $RDF_DOC_FILE 2> $RDF_ERR_FILE

     if [ $? != 0 ] ; then

      errproc $BASENAME $RDF_DOC_FILE $RDF_ERR_FILE

     else

      touch $RDF_REL_FILE
      echo -n .
      rm -f $RDF_ERR_FILE

     fi

    fi

   fi

  fi

 fi

done

exit 0

