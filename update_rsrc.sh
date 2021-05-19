#!/bin/bash

if [ $# = 0 ] || [ $1 = "xsd" ] ; then

 ( cd dic2xsd; ./update_schema.sh )

 if [ $? = 0 ] && [ -e schema/mmcif_nmr-star.xsd ] ; then
  echo "Updated BMRB/XML Schema (schema/mmcif_nmr-star.xsd)."
 else
  exit 1
 fi

 source ./scripts/xtool-home.sh

 XML_SCHEMA=schema/mmcif_nmr-star.xsd
 DB_SCHEMA=schema/mmcif_nmr-star.dic.schema

 java -cp $BMRBX_TOOL_HOME/extlibs/xsd2pgschema.jar xsd2pgschema --xsd $XML_SCHEMA --no-rel --hash-by SHA-1 --inplace-doc-key-name entry_id --inplace-doc-key-name entry.id > $DB_SCHEMA

# DB_SCHEMA=schema/mmcif_nmr-star.xsd-strict.schema
# java -cp $BMRBX_TOOL_HOME/extlibs/xsd2pgschema.jar xsd2pgschema --xsd $XML_SCHEMA > $DB_SCHEMA

 DB_SCHEMA=schema/mmcif_nmr-star.xsd-no_key.schema

 java -cp $BMRBX_TOOL_HOME/extlibs/xsd2pgschema.jar xsd2pgschema --xsd $XML_SCHEMA --no-key --no-doc-key --hash-by SHA-1 > $DB_SCHEMA

 JSON_SCHEMA=schema/mmcif_nmr-star.json

 java -cp $BMRBX_TOOL_HOME/extlibs/xsd2pgschema.jar xsd2jsonschema --xsd $XML_SCHEMA --col-json --discarded-doc-key-name entry_id > $JSON_SCHEMA

# sed -i -e "3,3 s/\.xsd/\.json/" $JSON_SCHEMA
# sed -i -e "4,5 s/BMRB\/XML/BMRB\/JSON/g" $JSON_SCHEMA

fi

if [ $# = 0 ] || [ $1 = "owl" ] ; then

 ( cd xsd2owl; ./bmrbx2owl.sh )

 if [ $? = 0 ] && [ -e schema/mmcif_nmr-star.owl ] ; then
  echo "Updated BMRB/OWL (schema/mmcif_nmr-star.owl)."
 else
  exit 1
 fi

fi

if [ $# = 0 ] || [[ $1 =~ ^xsl.* ]] ; then

 ( cd xsd2xml2rdf; ./bmrbx2xml2rdf.sh )

 if [ $? = 0 ] && [ -e schema/bmrbx2rdf.xsl ] ; then
  echo "Updated BMRB/XML->RDF XSLT code (schema/bmrbx2rdf.xsl)."
 else
  exit 1
 fi

fi

