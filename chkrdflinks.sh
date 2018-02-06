#!/bin/bash

array="info:doi/ info:pmid/ info:taxonomy/ info:ec-code/ info:uniprot/ info:ddbj-embl-genbank/ info:pir/ info:prf/ info:refseq/ info:scop/ info:pdb/ info:bmrb/ info:bmrb.metabolomics/ info:pdb.ligand/ info:pdb-ccd/ info:pubchem.substance/ info:pubchem.compound/ urn:ISSN: urn:ISBN:"

total=0

for prefix in bmr bms ; do

 RDF_RAW_DIR=$prefix"_rdf_raw"

 if [ ! -d $RDF_RAW_DIR ] ; then

  echo "Couldn't find $RDF_RAW_DIR directory."
  exit 1

 fi

 grep 'info:' $RDF_RAW_DIR/*.rdf > $prefix"_link_to"
 grep 'urn:' $RDF_RAW_DIR/*.rdf >> $prefix"_link_to"

done

rm -f tmp

for var in ${array}
do

  num=`grep $var bmr_link_to bms_link_to | wc -l`

  total=`expr $total + $num`

  echo $num $var >> tmp

done

echo $total total >> tmp

cat tmp | sort -n -r

rm tmp

