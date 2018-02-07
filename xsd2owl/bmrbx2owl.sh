#!/bin/bash

source ../scripts/saxon-home.sh

SOURCE_XSD_FILE=../schema/mmcif_nmr-star.xsd

java -jar ../$SAXON -s:$SOURCE_XSD_FILE -xsl:bmrbx2owl.xsl -o:../schema/mmcif_nmr-star.owl

#java -jar ../$SAXON -s:$SOURCE_XSD_FILE -xsl:../schema/xs3p.xsl -o:../schema/mmcif_nmr-star.xsd.html -versionmsg:off

#java -jar ../$SAXON -s:../schema/mmcif_nmr-star.owl -xsl:../schema/owl2xhtml.xsl -o:../schema/mmcif_nmr-star.owl.html -versionmsg:off

