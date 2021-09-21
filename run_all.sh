#!/bin/bash

update_virtuoso=true

ARGV=`getopt --long -o "n" "$@"`
eval set -- "$ARGV"
while true ; do
 case "$1" in
 -n)
  update_virtuoso=false
 ;;
 *)
  break
 ;;
 esac
 shift
done

VERSION=`cat VERSION`

NMRSTAR_DIC_FILE=NMR-STAR.dic

if [ -e $NMRSTAR_DIC_FILE ] ; then

 arg=(`tr -d '\r' < $NMRSTAR_DIC_FILE | grep dictionary.version`)
 DIC_VERSION=${arg[1]}

fi

echo "# BMRBoTool $VERSION (NMR-STAR v$DIC_VERSION)"
echo "# + Resource updates"

if [ ! -e ./schema/mmcif_nmr-star.xsd ] ; then

 ./update_rsrc.sh xsd

else

 echo
 echo "Do you want to update XML schema? (y [n]) "

 read ans

 case $ans in
  y*|Y*) ./update_rsrc.sh xsd;;
  *) echo skipped.;;
 esac

fi

if [ ! -e ./schema/mmcif_nmr-star.owl ] ; then

 ./update_rsrc.sh owl

else

 echo
 echo "Do you want to update BMRB/OWL? (y [n]) "

 read ans

 case $ans in
  y*|Y*) ./update_rsrc.sh owl;;
  *) echo skipped.;;
 esac

fi

if [ ! -e ./schema/bmrbx2rdf.xsl ] ; then

 ./update_rsrc.sh xsl

else

 echo
 echo "Do you want to update BMRB/XML->RDF XSLT code? (y [n]) "

 read ans

 case $ans in
  y*|Y*) ./update_rsrc.sh xsl;;
  *) echo skipped.;;
 esac

fi

source ./scripts/xtool-home.sh

bmr_ulist_len=0
bms_ulist_len=0

bmr_ulist=$BMRBX_TOOL_HOME/bmr_xml_noatom_ulist
bms_ulist=$BMRBX_TOOL_HOME/bms_xml_noatom_ulist

if [ -e $bmr_ulist ] ; then
 bmr_ulist_len=`wc -l $bmr_ulist | tail -n 1 | while read _total _file ; do echo $_total ; done`
fi

if [ -e $bms_ulist ] ; then
 bms_ulist_len=`wc -l $bms_ulist | tail -n 1 | while read _total _file ; do echo $_total ; done`
fi

echo "# + RDF conversions (BMRB/RDF)"

for prefix in bmr bms ; do

 echo "# ++ BMRB/RDF (prefix: $prefix"-noatom")..."

 ./$prefix"2rdf.sh"

 if [ $? != 0 ] || [ -d $prefix"_rdf_err" ] ; then
  echo $0 aborted.
  if [ -d $prefix"_rdf_err" ] ; then
   echo "Please check error messages in "$prefix"_rdf_err directory."
  fi
  exit 1
 fi

 ./$prefix"chk_rdf.sh"

 if [ $? != 0 ] || [ -d $prefix"_rdf_err" ] ; then
  echo $0 aborted.
  if [ -d $prefix"_rdf_err" ] ; then
   echo "Please check error messages in "$prefix"_rdf_err directory."
  fi
  exit 1
 fi

done

echo "# + File compressions (BMRB/RDF)"

for prefix in bmr bms ; do
 ./$prefix"zip_rdf.sh"
done

echo "# + RDF/XML -> N-Triples conversion (BMRB/RDF)"

for prefix in bmr bms ; do
 ./$prefix"2nt.sh"
done

rm -f /tmp/bmr-virtuoso-last
rm -f /tmp/bms-virtuoso-last

which isql > /dev/null

if [ $? = 0 ] && [ $update_virtuoso = "true" ] ; then

 echo "# + Virtuoso RDF bulk loader (optional)"

 echo
 echo "Do you want to update Virtuoso DB? (y [n]) "

 read ans

 case $ans in
  y*|Y*)

   ./start_virtuoso.sh || exit 1

   sleep 180

   GRAPH_URI=http://bmrbpub.pdbj.org/rdf/bmr
   graph_exist=`./ask_graph_existance.sh $GRAPH_URI` || exit 1

   if [ $bmr_ulist_len -gt 0 ] || [ $graph_exist = 0 ] ; then

    if [ $graph_exist = 1 ] ; then
     ./clear_graph.sh $GRAPH_URI
    fi

    ./bmr2virtuoso.sh

   fi

   sleep 180

   GRAPH_URI=http://bmrbpub.pdbj.org/rdf/bms
   graph_exist=`./ask_graph_existance.sh $GRAPH_URI` || exit 1

   if [ $bms_ulist_len -gt 0 ] || [ $graph_exist = 0 ] ; then

    if [ $graph_exist = 1 ] ; then
     ./clear_graph.sh $GRAPH_URI
    fi

    ./bms2virtuoso.sh

   fi

   ;;
  *)
   echo skipped.;;
 esac

fi

echo done.

