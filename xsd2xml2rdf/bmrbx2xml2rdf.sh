#!/bin/bash

source ../scripts/saxon-home.sh

SOURCE_XSD_FILE=../schema/mmcif_nmr-star.xsd

java -jar ../$SAXON -s:$SOURCE_XSD_FILE -xsl:xsd2primitive_type_mapping.xsl -o:../schema/bmrbx_primitive_type_mapping.xml

java -jar ../$SAXON -s:$SOURCE_XSD_FILE -xsl:bmrbx2xml2rdf.xsl -o:../schema/bmrbx2rdf.xsl

