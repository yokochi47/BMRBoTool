#!/bin/bash

source ../scripts/saxon-home.sh

SOURCE_XSD_FILE=../schema/mmcif_nmr-star.xsd

java -jar ../$SAXON_JAR_HOME/$SAXON_JAR_FILE -s:$SOURCE_XSD_FILE -xsl:bmrbx2xml2rdf.xsl -o:../schema/bmrbx2rdf.xsl

