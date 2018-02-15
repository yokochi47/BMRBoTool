<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--
owl2xhtml.xsl

(C) 2008 by Andreas Radinger and Martin Hepp, Bundeswehr University Munich, http://www.unibw.de/ebusiness/

This file is part of owl2xhtml, a stylesheet for client-side rendering OWL ontologies in the form of XHTML documentation. For more information, see http://www.ebusiness-unibw.org/projects/owl2xhtml/.

Acknowledgements: The stylesheet re-uses, with kind permission, code-snippets from the RDFS/OWL presentation stylesheet (1)

by Masahide Kanzaki, and from the OWL2HTML stylesheet (2), by Li Ding. We are very grateful for this kind support.

(1) http://www.kanzaki.com/ns/ns-schema.xsl
(2) available at http://daml.umbc.edu/ontologies/webofbelief/xslt/owl2html.xsl,

  owl2xhtml is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License (LPGL)
  as published by the Free Software Foundation, either version 3 of
  the License, or (at your option) any later version.

  owl2xhtml is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with owl2xhtml.  If not, see <http://www.gnu.org/licenses/>.
-->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#">
  <!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <!ENTITY rdfs "http://www.w3.org/2000/01/rdf-schema#">
  <!ENTITY owl "http://www.w3.org/2002/07/owl#">
  <!ENTITY dc "http://purl.org/dc/elements/1.1/">
  <!ENTITY dcterms "http://purl.org/dc/terms/">
  <!ENTITY PDBo "https://rdf.wwpdb.org/schema/pdbx-v50.owl#">
]>
<xsl:stylesheet
 version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns="http://www.w3.org/1999/xhtml"
 xmlns:html="http://www.w3.org/1999/xhtml"
 xmlns:xsd="http://www.w3.org/2001/XMLSchema"
 xmlns:owl="http://www.w3.org/2002/07/owl#"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
 xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:dcterms="http://purl.org/dc/terms/"
 xmlns:PDBo="https://rdf.wwpdb.org/schema/pdbx-v50.owl#"
 exclude-result-prefixes="xsd html">

  <xsl:output
   method="html"
   encoding="UTF-8"
   standalone="yes"
   doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
   doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
   indent="yes" />

  <!-- global variables and functions -->
  <xsl:variable name="class-name" select="concat(//owl:Ontology/rdfs:label,' v',substring(//owl:Ontology/owl:versionIRI/@rdf:resource,64))" />
  <xsl:variable name="nodeset-ontology" select=".//*[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#Ontology' or (local-name()='Ontology' and namespace-uri()='http://www.w3.org/2002/07/owl#')]" />
  <xsl:variable name="nodeset-class" select=".//*[(rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#Class' or (local-name()='Class' and namespace-uri()='http://www.w3.org/2002/07/owl#')) and @rdf:ID!='']" />
  <xsl:variable name="nodeset-property" select=".//*[((local-name()='Property' and namespace-uri()='http://www.w3.org/1999/02/22-rdf-syntax-ns#') or (local-name()='ConstraintProperty' and namespace-uri()='http://www.w3.org/2000/01/rdf-schema#') or (local-name()='DatatypeProperty' and namespace-uri()='http://www.w3.org/2002/07/owl#') or (local-name()='ObjectProperty' and namespace-uri()='http://www.w3.org/2002/07/owl#')) and @rdf:ID!='']" />
  <xsl:variable name="nodeset-property-object" select=".//*[(local-name()='ObjectProperty' and namespace-uri()='http://www.w3.org/2002/07/owl#') and @rdf:ID!='']" />
  <xsl:variable name="nodeset-property-datatype" select=".//*[(local-name()='DatatypeProperty' and namespace-uri()='http://www.w3.org/2002/07/owl#') and @rdf:ID!='']" />
  <xsl:variable name="nodeset-individual" select=".//*[(@rdf:ID or @rdf:about or @rdf:resource or count(child::*)&gt;1) and not (namespace-uri()='http://www.w3.org/2000/01/rdf-schema#') and not (namespace-uri()='http://www.w3.org/2002/07/owl#') and not (local-name()='RDF') and @rdf:ID!='']" />

  <xsl:template match="/">
    <html>
      <head>
	<title>
	  <xsl:value-of select="$class-name" />
	</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<style type="text/css">
	  <xsl:text>
body {
  margin:0;
  border:0;
  padding:0;
  height:100%;
  max-height:100%;
  background:#fff;
  font-family:arial, verdana, sans-serif;
  overflow:hidden;
}
* html body {
  padding:205px 0 0 0;
}
#container {
  position:fixed;
  top:205px;
  left:0;
  bottom:0px;
  right:0;
  overflow:auto;
  background:#fff;
  padding:10px;
  text-align:left;
  font-size:12px;
}
* html #container {
  height:100%;
  width:100%;
}
#header {
  position:absolute;
  top:0;
  left:0;
  width:100%;
  height:201px;
  overflow:auto;
  background-color:rgb(140,170,230);
  border-bottom:4px solid #21546e;
}
* html #header {
  height:205px;
}
#superHeader {
  color:white;
  background-color:rgb(100,135,220);
  height:25px;
  display:block;
  padding-left:23px;
  position:relative;
}
.alignright {
  position:absolute;
  top:0;
  right:0;
  width:195px;
  top:-15px;
}
* html .alignright {
  top:0px;
}
#logobox {
  width:441px;
  height:120px;
  display:block;
  float:right;
  margin-right:10px;
  margin-top:15px;
}
#logobox img {
  margin:0;
  padding:0;
  border:0;
}
#nav {
  width:600px;
  padding-left:20px;
  margin-top:10px;
}
#nav table tr {
  vertical-align:top;
}
#nav table tr td {
  color:#FFFFFF;
}
#nav table tr td a {
  text-decoration:none;
  color:#FFFFFF;
}
#nav table tr td a:hover {
  color:#FF9900;
}
#nav form {
  display:inline;
  width:200px;
}
#nav form select {
  width:310px;
}
a {
  color:#0c465e;
  font-weight:bold;
}
a:hover {
  color:#fff;
}
#container a {
  color:#000000;
}
#container a:hover {
  color:#FF0000;
}
.Class {
  padding:0.4em;
  width:99%;
  order-width:1px;
  order-style:dashed;
  osition:relative;
  margin-top:1.5em;
  order-style:solid;
  ackground:#e0e0e0
  }
.cp-type {
  font-weight:normal;
  ont-size:90%;
  olor:maroon;
  osition:absolute;
  right:20px
  }
h1 {
  margin:0;
  adding:0;
}
hr {
  clear:both;
  order:0;
  eight:1px;
  olor:#000;
  ackground-color:#000;
}
	  </xsl:text>
	</style>
      </head>
      <body>
	<xsl:apply-templates />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="rdf:RDF">
    <!-- Match RDF data -->
    <div id="header">
      <div id="superHeader">
	<big style="font-weight: bold;">
	  <xsl:value-of select="$class-name" />
	</big>
	<p class="alignright">
	</p>
      </div>
      <div id="nav">
	<table>
	  <tr>
	    <td width="180">
	      <a href="#OngologyDescription">Ontology Description</a>
	    </td>
	    <td />
	  </tr>
	  <tr>
	    <td>
	      <a href="#Classes"> Classes ( <xsl:value-of select="count($nodeset-class)" />) </a>
	    </td>
	    <td width="2" />
	    <td>
	      <form action="">
		<select onChange="window.location.hash = document.forms[0].navi.options[document.forms[0].navi.selectedIndex].value" name="navi">
		  <xsl:apply-templates select="$nodeset-class" mode="menu">
		    <xsl:sort select="@rdf:ID" />
		  </xsl:apply-templates>
		</select>
	      </form>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <a href="#Properties"> Properties ( <xsl:value-of select="count($nodeset-property)" />) </a>
	    </td>
	    <td />
	    <td>
	      <form action="">
		<select onChange="window.location.hash = document.forms[1].navi2.options[document.forms[1].navi2.selectedIndex].value" name="navi2">
		  <xsl:apply-templates select="$nodeset-property" mode="menu">
		    <xsl:sort select="@rdf:ID" />
		  </xsl:apply-templates>
		</select>
	      </form>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <a href="#ObjectProperties"> - Object ( <xsl:value-of select="count($nodeset-property-object)" />) </a>
	    </td>
	    <td />
	    <td>
	      <form action="">
		<select onChange="window.location.hash = document.forms[2].navi3.options[document.forms[2].navi3.selectedIndex].value" name="navi3">
		  <xsl:apply-templates select="$nodeset-property-object" mode="menu">
		    <xsl:sort select="@rdf:ID" />
		  </xsl:apply-templates>
		</select>
	      </form>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <a href="#DatatypeProperties"> - Datatype ( <xsl:value-of select="count($nodeset-property-datatype)" />)
	      </a>
	    </td>
	    <td />
	    <td>
	      <form action="">
		<select onChange="window.location.hash = document.forms[3].navi4.options[document.forms[3].navi4.selectedIndex].value" name="navi4">
		  <xsl:apply-templates select="$nodeset-property-datatype" mode="menu">
		    <xsl:sort select="@rdf:ID" />
		  </xsl:apply-templates>
		</select>
	      </form>
	    </td>
	  </tr>
	</table>
      </div>
      <!-- end of nav -->
    </div>
    <!-- end of header -->
    <div id="container">
      <h1 id="OngologyDescription">Ontology Description</h1>
      <xsl:if test="count($nodeset-ontology)&gt;0">
	<xsl:apply-templates select="$nodeset-ontology" mode="details_ontology" />
      </xsl:if>
      <h1 id="Classes">Classes</h1>
      <xsl:if test="count($nodeset-class)&gt;0">
	<ol>
	  <xsl:apply-templates select="$nodeset-class" mode="details">
	    <xsl:sort select="@rdf:ID" />
	  </xsl:apply-templates>
	</ol>
      </xsl:if>
      <h1 id="Properties">Properties</h1>
      <h2 id="ObjectProperties">Object Properties</h2>
      <xsl:if test="count($nodeset-property-object)&gt;0">
	<ol>
	  <xsl:apply-templates select="$nodeset-property-object" mode="details">
	    <xsl:sort select="@rdf:ID" />
	  </xsl:apply-templates>
	</ol>
      </xsl:if>
      <h2 id="DatatypeProperties">Datatype Properties</h2>
      <xsl:if test="count($nodeset-property-datatype)&gt;0">
	<ol>
	  <xsl:apply-templates select="$nodeset-property-datatype" mode="details">
	    <xsl:sort select="@rdf:ID" />
	  </xsl:apply-templates>
	</ol>
      </xsl:if>
    </div>
    <!-- end of container -->
  </xsl:template>

  <xsl:template match="*" mode="menu">
    <option>
      <xsl:value-of select="@rdf:ID" />
    </option>
  </xsl:template>

  <xsl:template match="*" mode="details_ontology">
    <xsl:variable name="ref">
      <xsl:choose>
	<xsl:when test="@rdf:ID">
	  <xsl:value-of select="@rdf:ID" />
	</xsl:when>
	<xsl:when test="@rdf:about">
	  <xsl:value-of select="@rdf:about" />
	</xsl:when>
	<xsl:otherwise>BLANK</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <div class="Class" id="ontologylabel">
      <a>
	<xsl:value-of select="//owl:Ontology/rdfs:label" />
      </a>
      <span class="cp-type">
	( rdf:type
	<xsl:call-template name="url">
	  <xsl:with-param name="ns" select="namespace-uri()" />
	  <xsl:with-param name="name" select="local-name()" />
	</xsl:call-template>
	)
      </span>
    </div>
    <xsl:if test="count(*)+count(@*)&gt;0">
      <ul>
	<xsl:text />
	<xsl:apply-templates select="." mode="attribute" />
	<xsl:apply-templates select="*" mode="child" />
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*" mode="details">
    <li>
      <xsl:variable name="ref">
	<xsl:choose>
	  <xsl:when test="@rdf:ID">
	    <xsl:value-of select="@rdf:ID" />
	  </xsl:when>
	  <xsl:when test="@rdf:about">
	    <xsl:value-of select="@rdf:about" />
	  </xsl:when>
	  <xsl:otherwise>BLANK</xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:if test="string-length($ref)&gt;0">
	<div class="Class" id="{$ref}">
	  <a>
	    <xsl:value-of select="$ref" />
	  </a>
	  <span class="cp-type">
	    ( rdf:type
	    <xsl:call-template name="url">
	      <xsl:with-param name="ns" select="namespace-uri()" />
	      <xsl:with-param name="name" select="local-name()" />
	    </xsl:call-template>
	    )
	  </span>
	</div>
      </xsl:if>
      <xsl:if test="count(*)+count(@*)&gt;0">
	<ul>
	  <xsl:text />
	  <xsl:apply-templates select="." mode="attribute" />
	  <xsl:apply-templates select="*" mode="child" />
	</ul>
      </xsl:if>
    </li>
  </xsl:template>

  <xsl:template name="url">
    <xsl:param name="ns" />
    <xsl:param name="name" />
    <xsl:choose>
      <xsl:when test="$ns='http://www.w3.org/1999/02/22-rdf-syntax-ns#'">
	<a href="{concat($ns,$name)}">
	  rdf:
	  <xsl:value-of select="$name" />
	</a>
      </xsl:when>
      <xsl:when test="$ns='http://www.w3.org/2000/01/rdf-schema#'">
	<a href="{concat($ns,$name)}">
	  rdfs:
	  <xsl:value-of select="$name" />
	</a>
      </xsl:when>
      <xsl:when test="$ns='http://www.w3.org/2002/07/owl#'">
	<a href="{concat($ns,$name)}">
	  owl:
	  <xsl:value-of select="$name" />
	</a>
      </xsl:when>
      <xsl:when test="$ns='http://purl.org/dc/elements/1.1/'">
	<a href="{concat($ns,$name)}">
	  dc:
	  <xsl:value-of select="$name" />
	</a>
      </xsl:when>
      <xsl:when test="$ns='http://purl.org/dc/terms/'">
        <a href="{concat($ns,$name)}">
          dcterms:
          <xsl:value-of select="$name" />
        </a>
      </xsl:when>
      <xsl:when test="$ns='https://rdf.wwpdb.org/schema/pdbx-v50.owl#'">
        <a href="{concat($ns,$name)}">
          PDBo:
          <xsl:value-of select="$name" />
        </a>
      </xsl:when>
      <xsl:when test="$ns=/rdf:RDF/@xml:base">
	<a href="{concat('#',$name)}">
	  <xsl:value-of select="$name" />
	</a>
      </xsl:when>
      <xsl:when test="(string-length($ns)&gt;0) or starts-with($name,'http://')">
	<a href="{concat($ns,$name)}">
	  <xsl:value-of select="$name" />
	</a>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="$name" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="uri_of_prefix">
    <xsl:param name="prefix" />
    <xsl:choose>
      <xsl:when test="$prefix='rdf'">
        <xsl:text>http://www.w3.org/1999/02/22-rdf-syntax-ns#</xsl:text>
      </xsl:when>
      <xsl:when test="$prefix='rdfs'">
        <xsl:text>http://www.w3.org/2000/01/rdf-schema#</xsl:text>
      </xsl:when>
      <xsl:when test="$prefix='owl'">
        <xsl:text>http://www.w3.org/2002/07/owl#</xsl:text>
      </xsl:when>
      <xsl:when test="$prefix='dc'">
        <xsl:text>http://purl.org/dc/elements/1.1/</xsl:text>
      </xsl:when>
      <xsl:when test="$prefix='dcterms'">
        <xsl:text>http://purl.org/dc/terms/</xsl:text>
      </xsl:when>
      <xsl:when test="$prefix='PDBo'">
        <xsl:text>https://rdf.wwpdb.org/schema/pdbx-v50.owl#</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat($prefix,':')" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="*" mode="resource">
    <xsl:choose>
      <xsl:when test="@rdf:resource">
	<a href="{@rdf:resource}">
	  <xsl:value-of select="@rdf:resource" />
	</a>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="*" mode="attribute">
    <xsl:for-each select="@*">
      <li>
	<xsl:call-template name="url">
	  <xsl:with-param name="ns" select="namespace-uri()" />
	  <xsl:with-param name="name" select="local-name()" />
	</xsl:call-template>
	--
	<xsl:call-template name="url">
	  <xsl:with-param name="ns" select="''" />
	  <xsl:with-param name="name" select="." />
	</xsl:call-template>
      </li>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="*" mode="child">
    <li>
      <i>
	<xsl:call-template name="url">
	  <xsl:with-param name="ns" select="namespace-uri()" />
	  <xsl:with-param name="name" select="local-name()" />
	</xsl:call-template>
      </i>
      <xsl:text>--</xsl:text>
      <xsl:choose>
	<xsl:when test="@rdf:resource">
          <xsl:choose>
            <xsl:when test="starts-with(@rdf:resource,'#')">
	      <xsl:apply-templates select="." mode="resource" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="uri">
                <xsl:call-template name="uri_of_prefix">
                  <xsl:with-param name="prefix" select="substring-before(@rdf:resource,':')" />
                </xsl:call-template>
              </xsl:variable>
              <xsl:call-template name="url">
                <xsl:with-param name="ns" select="$uri" />
                <xsl:with-param name="name" select="substring-after(@rdf:resource,':')" />
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
	</xsl:when>
	<xsl:when test="@*">
	  <xsl:value-of select="text()" />
	  <xsl:if test="@xml:lang">
	    ^^
	    <xsl:apply-templates select="@xml:lang" mode="resource" />
	  </xsl:if>
	  <ul>
	    <xsl:text />
	    <xsl:apply-templates select="." mode="attribute" />
	  </ul>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="text()" />
	  <xsl:if test="@xml:lang">
	    ^^
	    <xsl:apply-templates select="@xml:lang" mode="resource" />
	  </xsl:if>
	  <ul>
	    <xsl:text />
	    <a href="http://www.w3.org/2002/07/owl#unionOf">owl:unionOf</a>
	    <xsl:variable name="this">
	      <xsl:value-of select="owl:Class/owl:unionOf/@rdf:nodeID" />
	    </xsl:variable>
	    (
	    <xsl:for-each select="owl:Class/owl:unionOf/owl:Class">
	      <a href="{@rdf:about}">
		<xsl:value-of select="@rdf:about" />
	      </a>
	      <xsl:if test="position() != last()">or</xsl:if>
	    </xsl:for-each>
	    )
	  </ul>
	</xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>
</xsl:stylesheet>
