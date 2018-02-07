#!/bin/bash

source ../scripts/saxon-home.sh

SOURCE_XSD_FILE=../schema/mmcif_nmr-star.xsd

java -jar ../$SAXON -s:$SOURCE_XSD_FILE -xsl:bmrbx2xml2rdf.xsl -o:../schema/bmrbx2rdf.xsl

