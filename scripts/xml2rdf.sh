#!/bin/bash

source ./scripts/xtool-home.sh
source ./scripts/saxon-home.sh

PREFIX=
ATOM=noatom
UPDATE=yes
INIT=yes
PROC_INFO=1of1

UNZIP=gunzip

ARGV=`getopt --long -o "p:a:u:i:n:" "$@"`
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
 -i)
  INIT=$2
  shift
 ;;
 -n)
  PROC_INFO=$2
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

 XML_DOC_DIR=$BMRBX_TOOL_HOME/$PREFIX"_xml_doc"
 XML_ULIST=$BMRBX_TOOL_HOME/$PREFIX"_xml_ulist"

 XML_TMP_DIR=$PREFIX"_xml_"$ATOM"_raw"
 RDF_RAW_DIR=$PREFIX"_rdf_"$ATOM"_raw"
 RDF_ERR_DIR=$PREFIX"_rdf_"$ATOM"_err"
 RDF_REL_DIR=$PREFIX"_rdf_"$ATOM"_rel"
 RDF_DOC_DIR=$PREFIX"_rdf_"$ATOM"_doc"
 NT_DOC_DIR=$PREFIX"_nt_"$ATOM"_doc"

else

 XML_DOC_DIR=$BMRBX_TOOL_HOME/$PREFIX"_xml_"$ATOM"_doc"
 XML_ULIST=$BMRBX_TOOL_HOME/$PREFIX"_xml_"$ATOM"_ulist"

 XML_TMP_DIR=$PREFIX"_xml_raw"
 RDF_RAW_DIR=$PREFIX"_rdf_raw"
 RDF_ERR_DIR=$PREFIX"_rdf_err"
 RDF_REL_DIR=$PREFIX"_rdf_rel"
 RDF_DOC_DIR=$PREFIX"_rdf_doc"
 NT_DOC_DIR=$PREFIX"_nt_doc"

fi

BMRBX2RDF_XSL=schema/bmrbx2rdf.xsl

if [ ! -e $BMRBX2RDF_XSL ] ; then

 echo "Couldn't find BMRB/XML->RDF XSL style sheet ($BMRBX2RDF_XSL)."
 exit 1

fi

if [ ! -d $XML_DOC_DIR ] ; then

 echo "Couldn't find $XML_DOC_DIR directory."
 exit 1

fi

if [[ $INIT =~ ^[yY].* ]] ; then

 if [ ! -d $XML_TMP_DIR ] ; then

  rm -rf $XML_TMP_DIR
  mkdir $XML_TMP_DIR

 fi

 if [ ! -d $RDF_RAW_DIR ] ; then

  rm -rf $RDF_RAW_DIR
  mkdir $RDF_RAW_DIR

 fi

 if [[ $UPDATE =~ ^[nN].* ]] ; then

  rm -f $RDF_RAW_DIR/*

 fi

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

errproc () {

 BASENAME_XML=$1
 BASENAME_RDF=$2
 XML_DOC_FILE=$3
 RDF_DOC_FILE=$4

 rm -f $RDF_DOC_FILE

 if [ ! -e $XML_DOC_FILE ] || [ ! -s $XML_DOC_FILE ] ; then
  echo -e "${red}$BASENAME_XML.xml empty.${normal}"
 else
  echo -e "${red}$BASENAME_RDF.rdf failed.${normal}"
 fi

}

convert() {

 BASENAME_XML=$1
 BASENAME_RDF=$2
 OFFSET=$3
 XML_GZ_FILE=$XML_DOC_DIR/$BASENAME_XML.xml.gz
 XML_DOC_FILE=$XML_TMP_DIR/$BASENAME_XML.xml
 XML_REL_FILE=$XML_TMP_DIR/$BASENAME_XML"_rel"
 RDF_DOC_FILE=$RDF_RAW_DIR/$BASENAME_RDF.rdf
 RDF_ERR_FILE=$RDF_ERR_DIR/$BASENAME_RDF"_err"
 RDF_REL_FILE=$RDF_REL_DIR/$BASENAME_RDF"_rel"
 RDF_GZ_FILE=$RDF_DOC_DIR/$BASENAME_RDF.rdf.gz
 NT_GZ_FILE=$NT_DOC_DIR/$BASENAME_RDF.nt.gz

 if [ -e $XML_GZ_FILE ] && [ ! -e $XML_DOC_FILE ] ; then

  LS_OUT=`ls -i $XML_GZ_FILE 2> /dev/null`

  if [ $? = 0 ] ; then

   INODE=`echo $LS_OUT | cut -d ' ' -f 1`
   _MAXPROCS=`expr $MAXPROCS + $OFFSET`
   INODE_MOD=`expr $INODE % $_MAXPROCS`

   if [ $INODE_MOD = $PROC_ID ] && [ ! -e $XML_REL_FILE ] ; then

    touch $XML_REL_FILE

    if [ $? = 0 ] ; then

     cp -f $XML_GZ_FILE $XML_TMP_DIR

     if [ -e $XML_TMP_DIR/$BASENAME_XML.xml.gz ] ; then
      $UNZIP -f $XML_TMP_DIR/$BASENAME_XML.xml.gz
     fi

     if [ -e $XML_DOC_FILE ] ; then

      xsltproc -o $RDF_DOC_FILE $BMRBX2RDF_XSL $XML_DOC_FILE 2> $RDF_ERR_FILE
      #java -jar $SAXON -s:$XML_DOC_FILE -xsl:$BMRBX2RDF_XSL -o:$RDF_DOC_FILE -versionmsg:off 2> $RDF_ERR_FILE

      if [ $? = 0 ] ; then

       if [ ! -s $XML_DOC_FILE ] ; then

        errproc $BASENAME_XML $BASENAME_RDF $XML_DOC_FILE $RDF_DOC_FILE

       else

        echo $BASENAME_RDF.rdf done.
        rm -f $RDF_ERR_FILE

       fi

      else

       errproc $BASENAME_XML $BASENAME_RDF $XML_DOC_FILE $RDF_DOC_FILE

      fi

      rm -f $RDF_REL_FILE
      rm -f $RDF_GZ_FILE
      rm -f $NT_GZ_FILE

     else

      errproc $BASENAME_XML $BASENAME_RDF $XML_DOC_FILE $RDF_DOC_FILE

     fi

    fi

   fi

  fi

 fi

}

basename_rdf () {

 if [ $ATOM = "noatom" ] ; then
  echo $1 | sed -e s/-noatom//
 else
  echo $1"-atom"
 fi

}

XML_DOC_FILES=$XML_DOC_DIR/*.xml.gz

if [[ $UPDATE =~ ^[nN].* ]] ; then

 for file in `ls $XML_DOC_FILES 2> /dev/null`
 do

  BASENAME_XML=`basename $file .xml.gz`
  BASENAME_RDF=`basename_rdf $BASENAME_XML`

  convert $BASENAME_XML $BASENAME_RDF 0

 done

 for file in `ls $XML_DOC_FILES 2> /dev/null`
 do

  BASENAME_XML=`basename $file .xml.gz`
  BASENAME_RDF=`basename_rdf $BASENAME_XML`

  convert $BASENAME_XML $BASENAME_RDF 1

 done

else

 if [ -e $XML_ULIST ] ; then

  for BASENAME_XML in `cat $XML_ULIST | sort | uniq`
  do

   BASENAME_RDF=`basename_rdf $BASENAME_XML`

   convert $BASENAME_XML $BASENAME_RDF 0

  done

 fi

 for file in `ls $XML_DOC_FILES 2> /dev/null`
 do

  BASENAME_XML=`basename $file .xml.gz`
  BASENAME_RDF=`basename_rdf $BASENAME_XML`

  RDF_DOC_FILE=$RDF_RAW_DIR/$BASENAME_RDF.rdf

  if [ ! -e $RDF_DOC_FILE ] ; then

   convert $BASENAME_XML $BASENAME_RDF 0

  fi

 done

 for file in `ls $XML_DOC_FILES 2> /dev/null`
 do

  BASENAME_XML=`basename $file .xml.gz`
  BASENAME_RDF=`basename_rdf $BASENAME_XML`

  RDF_DOC_FILE=$RDF_RAW_DIR/$BASENAME_RDF.rdf

  if [ ! -e $RDF_DOC_FILE ] ; then

   convert $BASENAME_XML $BASENAME_RDF 1

  fi

 done

fi

