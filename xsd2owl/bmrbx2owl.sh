#!/bin/bash

source ../scripts/saxon-home.sh

TAGMAP2XML_XSL=tagmap2xml.xsl
tagmap_csv_file=tagmap.csv
tagmap_xml_file=tagmap.xml

java -jar ../$SAXON -it:main -xsl:$TAGMAP2XML_XSL -o:$tagmap_xml_file tagmap_csv_file=$tagmap_csv_file

SOURCE_XSD_FILE=../schema/mmcif_nmr-star.xsd

java -jar ../$SAXON -s:$SOURCE_XSD_FILE -xsl:bmrbx2owl.xsl -o:../schema/mmcif_nmr-star.owl tagmap_xml_file=$tagmap_xml_file

#java -jar ../$SAXON -s:$SOURCE_XSD_FILE -xsl:../schema/xs3p.xsl -o:../schema/mmcif_nmr-star.xsd.html -versionmsg:off

#java -jar ../$SAXON -s:../schema/mmcif_nmr-star.owl -xsl:../schema/owl2xhtml.xsl -o:../schema/mmcif_nmr-star.owl.html -versionmsg:off

