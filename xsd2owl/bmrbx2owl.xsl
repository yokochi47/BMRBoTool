<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE rdf:RDF [
  <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#">
  <!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <!ENTITY rdfs "http://www.w3.org/2000/01/rdf-schema#">
  <!ENTITY owl "http://www.w3.org/2002/07/owl#">
]>
<xsl:stylesheet
   version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xsd="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
   xmlns:owl="http://www.w3.org/2002/07/owl#">
  <xsl:output method="xml" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">
&lt;?xml-stylesheet type="text/xsl" href="http://bmrbpub.protein.osaka-u.ac.jp/schema/owl2xhtml.xsl"?&gt;
</xsl:text>
    <rdf:RDF
       xml:base="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.owl"
       xmlns:xml="http://www.w3.org/XML/1998/namespace"
       xmlns:xsd="http://www.w3.org/2001/XMLSchema"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
       xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
       xmlns:owl="http://www.w3.org/2002/07/owl#"
       xmlns:dc="http://purl.org/dc/elements/1.1/"
       xmlns:dcterms="http://purl.org/dc/terms/">
       <!--xmlns:BMRBo="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.owl#"
       xmlns:PDBo="https://rdf.wwpdb.org/schema/pdbx-v50.owl#"-->

      <owl:Ontology rdf:about="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.owl">
	<rdfs:label>BMRB/OWL v3.2.0.15</rdfs:label>
	<rdfs:comment xml:lang="en">The BMRB/RDF ontology translated from BMRB/XML Schema.</rdfs:comment>
	<rdfs:seeAlso rdf:resource="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.xsd"/>
	<rdfs:seeAlso rdf:resource="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.dic"/>
        <owl:versionIRI rdf:resource="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.owl/3.2.0.15"/>
      </owl:Ontology>

      <owl:Class rdf:ID="Category">
	<rdfs:label>Category</rdfs:label>
	<rdfs:comment xml:lang="en">Abstract class for category holders.</rdfs:comment>
      </owl:Class>

      <owl:Class rdf:ID="CategoryElement">
	<rdfs:label>CategoryElement</rdfs:label>
	<rdfs:comment xml:lang="en">Abstract class for category elements.</rdfs:comment>
      </owl:Class>

      <owl:DatatypeProperty rdf:ID="categoryItem">
	<rdfs:label>categoryItem</rdfs:label>
	<rdfs:comment xml:lang="en">Abstract datatype property for category items.</rdfs:comment>
	<rdfs:domain rdf:resource="#CategoryElement"/>
      </owl:DatatypeProperty>

      <!--owl:ObjectProperty rdf:ID="crossReference">
	<rdfs:comment xml:lang="en">Abstract property for cross-references.</rdfs:comment>
      </owl:ObjectProperty-->

      <owl:ObjectProperty rdf:ID="reference_to">
	<rdfs:comment xml:lang="en">Abstract property for cross-references between categories.</rdfs:comment>
	<!--rdfs:subPropertyOf rdf:resource="#crossReference"/-->
        <rdfs:subPropertyOf rdf:resource="dcterms:references"/>
	<rdfs:domain rdf:resource="#CategoryElement"/>
	<rdfs:range rdf:resource="#CategoryElement"/>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="referenced_by">
	<rdfs:comment xml:lang="en">Abstract property for cross-references between categories.</rdfs:comment>
	<!--rdfs:subPropertyOf rdf:resource="#crossReference"/-->
        <rdfs:subPropertyOf rdf:resource="dcterms:isReferencedBy"/>
	<rdfs:domain rdf:resource="#CategoryElement"/>
	<rdfs:range rdf:resource="#CategoryElement"/>
      </owl:ObjectProperty>
<!--
      <owl:ObjectProperty rdf:ID="link_to">
	<rdfs:subPropertyOf rdf:resource="#crossReference"/>
        <owl:equivalentProperty rdf:resource="&rdfs;seeAlso"/>
	<rdfs:comment xml:lang="en">Abstract property for external links.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="rdf_link_to">
	<rdfs:subPropertyOf rdf:resource="#link_to"/>
	<rdfs:comment xml:lang="en">Abstract property for external RDF links.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="html_link_to">
	<rdfs:subPropertyOf rdf:resource="#link_to"/>
	<rdfs:comment xml:lang="en">Abstract property for external HTML links.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_chem_comp">
	<rdfs:subPropertyOf rdf:resource="#rdf_link_to"/>
	<rdfs:comment xml:lang="en">external link to mmCIF Chemical Component.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_ligand_expo">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to RCSB Ligand Expo.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_pubchem">
        <rdfs:subPropertyOf rdf:resource="#rdf_link_to"/>
        <rdfs:comment xml:lang="en">Abstract property for external link to PubChem.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_pubchem_substance">
	<rdfs:subPropertyOf rdf:resource="#link_to_pubchem"/>
	<rdfs:comment xml:lang="en">external link to PubChem Substance.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_pubchem_compound">
	<rdfs:subPropertyOf rdf:resource="#link_to_pubchem"/>
	<rdfs:comment xml:lang="en">external link to PubChem Compound.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_doi">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to DOI (digital object identifier).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_pubmed">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to PubMed.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_issn">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to ISSN (International Standard Serial Number).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_isbn">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to ISBN (International Standard Book Number).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_taxonomy">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">Abstract property for external link to NCBI Taxonomy.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_taxonomy_source">
	<rdfs:subPropertyOf rdf:resource="#link_to_taxonomy"/>
	<rdfs:comment xml:lang="en">external link to NCBI Taxonomy (source organism).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_taxonomy_host">
	<rdfs:subPropertyOf rdf:resource="#link_to_taxonomy"/>
	<rdfs:comment xml:lang="en">external link to NCBI Taxonomy (host organism).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_enzyme">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to EC (enzyme commission) number.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_uniprot">
	<rdfs:subPropertyOf rdf:resource="#rdf_link_to"/>
	<rdfs:comment xml:lang="en">external link to UniProt.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_ddbj">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to DDBJ.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_embl">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to EMBL.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_genbank">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to NCBI GenBank.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_pir">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to PIR (Protein Information Resource).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_prf">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to PRF (Protein Research Foundation).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_refseq">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">external link to NCBI RefSeq (Reference Sequence).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_scop">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">link to related SCOP (Structural Classification of Proteins).</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_bmrb">
	<rdfs:subPropertyOf rdf:resource="#rdf_link_to"/>
	<rdfs:comment xml:lang="en">link to related BMRB entry.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_pdb">
	<rdfs:subPropertyOf rdf:resource="#rdf_link_to"/>
	<rdfs:comment xml:lang="en">external link to related PDB entry.</rdfs:comment>
      </owl:ObjectProperty>

      <owl:ObjectProperty rdf:ID="link_to_bmrbx">
	<rdfs:subPropertyOf rdf:resource="#html_link_to"/>
	<rdfs:comment xml:lang="en">link to BMRB/XML document.</rdfs:comment>
      </owl:ObjectProperty>
-->
      <xsl:apply-templates/>
    </rdf:RDF>
  </xsl:template>

  <!-- schema root -->
  <xsl:template match="xsd:schema">
    <xsl:call-template name="datablockType"/>
    <xsl:apply-templates select="./xsd:complexType/xsd:sequence/*" mode="category_element"/>
  </xsl:template>

  <!-- datablockType is special -->
  <xsl:template name="datablockType">
    <owl:Class rdf:ID="datablock">
      <rdfs:label>datablock</rdfs:label>
      <rdfs:comment xml:lang="en">datablock class holds all categories of BMRB NMR-STAR data.</rdfs:comment>
      <rdfs:subClassOf>
	<owl:Class>
	  <owl:intersectionOf rdf:parseType="Collection">
	    <xsl:for-each select="/xsd:schema/xsd:complexType[@name='datablockType']/xsd:all/*">
	      <xsl:variable name="category"><xsl:value-of select="substring-before(@name,'Category')"/></xsl:variable>
	      <xsl:call-template name="hasCategory_restriction">
		<xsl:with-param name="category" select="$category"/>
	      </xsl:call-template>
	    </xsl:for-each>
	  </owl:intersectionOf>
	</owl:Class>
      </rdfs:subClassOf>
    </owl:Class>

    <owl:DatatypeProperty rdf:ID="datablockName">
      <rdfs:domain rdf:resource="#datablock"/>
      <rdfs:range rdf:resource="&xsd;string"/>
      <xsl:apply-templates select="./xsd:annotation"/>
    </owl:DatatypeProperty>

    <owl:InverseFunctionalProperty rdf:ID="hasCategory">
      <rdfs:comment xml:lang="en">Abstract property for category elements pointing to category.</rdfs:comment>
      <rdfs:domain rdf:resource="#datablock"/>
    </owl:InverseFunctionalProperty>

    <owl:InverseFunctionalProperty rdf:ID="hasCategoryElement">
      <rdfs:comment xml:lang="en">Abstract property for category pointing to category elements.</rdfs:comment>
      <!-- range should be rdf:List, but OWL doesn't allow this... -->
    </owl:InverseFunctionalProperty>

    <owl:ObjectProperty rdf:ID="of_datablock">
      <rdfs:label>link_to_datablock</rdfs:label>
      <rdfs:comment xml:lang="en">Link to the datablock from category elements.</rdfs:comment>
      <rdfs:domain rdf:resource="#CategoryElement"/>
      <rdfs:range rdf:resource="#datablock"/>
    </owl:ObjectProperty>

    <owl:ObjectProperty rdf:ID="datablock_of">
      <owl:inverseOf rdf:resource="#of_datablock"/>
    </owl:ObjectProperty>

  </xsl:template>

  <xsl:template name="hasCategory_restriction">
    <xsl:param name="category"/>
    <owl:Restriction>
      <owl:onProperty rdf:resource="#has_{$category}Category"/>
      <owl:minCardinality rdf:datatype="&xsd;nonNegativeInteger">0</owl:minCardinality>
    </owl:Restriction>
    <owl:Restriction>
      <owl:onProperty rdf:resource="#has_{$category}Category"/>
      <owl:maxCardinality rdf:datatype="&xsd;nonNegativeInteger">1</owl:maxCardinality>
    </owl:Restriction>
  </xsl:template>

  <xsl:template name="hasCategoryElement_restriction">
    <xsl:param name="category"/>
    <xsl:variable name="categoryType" select="/xsd:schema/xsd:complexType[@name=concat($category,'Type')]/xsd:sequence/xsd:element"/>
    <owl:Restriction>
      <owl:onProperty rdf:resource="#has_{$category}"/>
      <owl:minCardinality rdf:datatype="&xsd;nonNegativeInteger"><xsl:value-of select="$categoryType/@minOccurs"/></owl:minCardinality>
    </owl:Restriction>
    <xsl:if test="$categoryType/@maxOccurs != 'unbounded'">
      <owl:Restriction>
	<owl:onProperty rdf:resource="#has_{$category}"/>
	<owl:maxCardinality rdf:datatype="&xsd;nonNegativeInteger"><xsl:value-of select="$categoryType/@maxOccurs"/></owl:maxCardinality>
      </owl:Restriction>
    </xsl:if>
  </xsl:template>

  <!-- basic category types -->
  <xsl:template match="xsd:element" mode="category_element">
    <xsl:variable name="category"><xsl:value-of select="@name"/></xsl:variable>
    <owl:Class rdf:ID="{@name}Category">
      <rdfs:subClassOf>
	<owl:Class>
	  <owl:intersectionOf rdf:parseType="Collection">
	    <owl:Class rdf:about="#Category"/>
	    <xsl:call-template name="hasCategoryElement_restriction">
	      <xsl:with-param name="category" select="$category"/>
	    </xsl:call-template>
	  </owl:intersectionOf>
	</owl:Class>
      </rdfs:subClassOf>
    </owl:Class>

    <owl:Class rdf:ID="{@name}">
      <rdfs:label><xsl:value-of select="@name"/></rdfs:label>
      <xsl:apply-templates select="../../xsd:annotation"/>
      <rdfs:subClassOf>
	<owl:Class>
	  <owl:intersectionOf rdf:parseType="Collection">
	    <owl:Class rdf:about="#CategoryElement"/>
	    <xsl:for-each select="./xsd:complexType/xsd:all/*|./xsd:complexType/xsd:attribute">
	      <xsl:call-template name="category_item_restriction">
		<xsl:with-param name="category" select="$category"/>
	      </xsl:call-template>
	    </xsl:for-each>
	  </owl:intersectionOf>
	</owl:Class>
      </rdfs:subClassOf>
    </owl:Class>

    <owl:InverseFunctionalProperty rdf:ID="has_{@name}Category">
      <rdfs:label><xsl:value-of select="@name"/>Category</rdfs:label>
      <rdfs:comment xml:lang="en">
	This property indicates that datablock
	has a category holder <xsl:value-of select="@name"/>Category.
      </rdfs:comment>
      <rdfs:subPropertyOf rdf:resource="#hasCategory"/>
      <rdfs:seeAlso rdf:resource="#{@name}"/>
    </owl:InverseFunctionalProperty>

    <owl:InverseFunctionalProperty rdf:ID="has_{@name}">
      <rdfs:label><xsl:value-of select="@name"/>Category</rdfs:label>
      <rdfs:comment xml:lang="en">
	This property indicates that <xsl:value-of select="@name"/>Category.
	has a category <xsl:value-of select="@name"/>.
      </rdfs:comment>
      <rdfs:subPropertyOf rdf:resource="#hasCategoryElement"/>
      <rdfs:seeAlso rdf:resource="#{@name}"/>
      <rdfs:domain rdf:resource="#{@name}Category"/>
      <rdfs:range rdf:resource="#{@name}"/>
    </owl:InverseFunctionalProperty>

    <owl:DatatypeProperty rdf:ID="{@name}Item">
      <rdfs:label><xsl:value-of select="@name"/>Item</rdfs:label>
      <rdfs:comment xml:lang="en">Abstract datatype property for <xsl:value-of select="@name"/> items.</rdfs:comment>
      <rdfs:subPropertyOf rdf:resource="#categoryItem"/>
      <rdfs:domain rdf:resource="#{@name}"/>
    </owl:DatatypeProperty>

    <owl:ObjectProperty rdf:ID="reference_to_{@name}">
      <rdfs:label>reference_to_<xsl:value-of select="@name"/></rdfs:label>
      <rdfs:comment xml:lang="en">cross-reference to <xsl:value-of select="@name"/>.</rdfs:comment>
      <rdfs:subPropertyOf rdf:resource="#reference_to"/>
      <rdfs:domain rdf:resource="#{@name}"/>
    </owl:ObjectProperty>

    <owl:ObjectProperty rdf:ID="referenced_by_{@name}">
      <rdfs:label>referenced_by_<xsl:value-of select="@name"/></rdfs:label>
      <rdfs:comment xml:lang="en">cross-reference from <xsl:value-of select="@name"/>.</rdfs:comment>
      <rdfs:subPropertyOf rdf:resource="#referenced_by"/>
      <rdfs:range rdf:resource="#{@name}"/>
    </owl:ObjectProperty>

    <xsl:for-each select="./xsd:complexType/xsd:all/*|./xsd:complexType/xsd:attribute">
      <xsl:call-template name="category_item">
	<xsl:with-param name="category" select="$category"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="category_item_restriction">
    <xsl:param name="category"/>
    <xsl:choose>
      <xsl:when test="@use='required'">
	<owl:Restriction>
	  <owl:onProperty rdf:resource="#{$category}.{@name}"/>
	  <owl:cardinality rdf:datatype="&xsd;nonNegativeInteger">1</owl:cardinality>
	</owl:Restriction>
      </xsl:when>
      <xsl:when test="@use='optional'">
	<owl:Restriction>
	  <owl:onProperty rdf:resource="#{$category}.{@name}"/>
	  <owl:minCardinality rdf:datatype="&xsd;nonNegativeInteger">0</owl:minCardinality>
	</owl:Restriction>
	<owl:Restriction>
	  <owl:onProperty rdf:resource="#{$category}.{@name}"/>
	  <owl:maxCardinality rdf:datatype="&xsd;nonNegativeInteger">1</owl:maxCardinality>
	</owl:Restriction>
      </xsl:when>
      <xsl:otherwise>
	<owl:Restriction>
	  <owl:onProperty rdf:resource="#{$category}.{@name}"/>
	  <owl:minCardinality rdf:datatype="&xsd;nonNegativeInteger"><xsl:value-of select="@minOccurs"/></owl:minCardinality>
	</owl:Restriction>
	<owl:Restriction>
	  <owl:onProperty rdf:resource="#{$category}.{@name}"/>
	  <owl:maxCardinality rdf:datatype="&xsd;nonNegativeInteger"><xsl:value-of select="@maxOccurs"/></owl:maxCardinality>
	</owl:Restriction>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="category_item">
    <xsl:param name="category"/>
    <xsl:choose>
      <xsl:when test="count(.//xsd:enumeration) = 0">
	<!-- basic types -->
	<xsl:variable name="datatype1" select="substring-after(@type,':')"/>
	<xsl:variable name="datatype2" select="substring-after(./xsd:complexType/xsd:simpleContent/xsd:extension/@base,':')"/>
	<xsl:variable name="datatype3" select="substring-after(./xsd:simpleType/xsd:union/xsd:simpleType[1]/xsd:restriction/@base,':')"/>
	<owl:DatatypeProperty rdf:ID="{$category}.{@name}">
	  <rdfs:subPropertyOf rdf:resource="#{$category}Item"/>
	  <rdfs:range rdf:resource="&xsd;{concat($datatype1,$datatype2,$datatype3)}"/>
	  <rdfs:label><xsl:value-of select="concat($category,'.',@name)"/></rdfs:label>
	  <xsl:apply-templates select="./xsd:annotation"/>
	</owl:DatatypeProperty>
      </xsl:when>
      <xsl:otherwise>
	<xsl:variable name="datatype"><xsl:value-of select="substring-after(.//@base,':')"/></xsl:variable>
	<owl:DatatypeProperty rdf:ID="{$category}.{@name}">
	  <rdfs:subPropertyOf rdf:resource="#{$category}Item"/>
	  <rdfs:domain rdf:resource="#{$category}"/>
	  <rdfs:range>
	    <owl:DataRange>
	      <owl:oneOf>
		<xsl:call-template name="enumeration">
		  <xsl:with-param name="elm" select=".//xsd:enumeration[1]"/>
		  <xsl:with-param name="t" select="$datatype"/>
		</xsl:call-template>
	      </owl:oneOf>
	    </owl:DataRange>
	  </rdfs:range>
	  <xsl:apply-templates select="./xsd:annotation"/>
	</owl:DatatypeProperty>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="enumeration">
    <xsl:param name="elm"/>
    <xsl:param name="t"/>
    <rdf:List>
      <rdf:first rdf:datatype="&xsd;{$t}"><xsl:value-of select="$elm/@value"/></rdf:first>
      <xsl:choose>
	<xsl:when test="count($elm/following-sibling::node()) = 0">
	  <rdf:rest rdf:resource="&rdf;nil"/>
	</xsl:when>
	<xsl:otherwise>
	  <rdf:rest>
	    <xsl:call-template name="enumeration">
	      <xsl:with-param name="elm" select="$elm/following-sibling::node()[1]"/>
	      <xsl:with-param name="t" select="$t"/>
	    </xsl:call-template>
	  </rdf:rest>
	</xsl:otherwise>
      </xsl:choose>
    </rdf:List>
  </xsl:template>

  <!-- annotation of categories and items -->
  <xsl:template match="xsd:annotation">
    <rdfs:comment xml:lang="en">
      <xsl:value-of select="./xsd:documentation"/>
    </rdfs:comment>
    <xsl:variable name="pointer"><xsl:value-of select="./xsd:documentation/@source"/></xsl:variable>
    <xsl:if test="$pointer != ''">
      <rdfs:seeAlso rdf:resource="{$pointer}"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()|*|@*"/>
  <xsl:template match="text()|*|@*" mode="annotation"/>

  <!-- restore category group -->

</xsl:stylesheet>
