<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:BMRBx="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.xsd"
  xmlns:BMRBo="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.owl#"
  exclude-result-prefixes="BMRBx">
    
  <xsl:output method="xml" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:variable name="entry_id"><xsl:value-of select="/BMRBx:datablock/BMRBx:entryCategory/BMRBx:entry/@id"/></xsl:variable>
  <xsl:variable name="orcid">http://orcid.org/</xsl:variable>
  <xsl:variable name="orcid-ident">http://identifiers.org/orcid/</xsl:variable>
  <xsl:variable name="doi">http://dx.doi.org/</xsl:variable>
  <xsl:variable name="doi-ident">http://identifiers.org/doi/</xsl:variable>
  <xsl:variable name="pubmed">http://rdf.ncbi.nlm.nih.gov/pubmed/</xsl:variable>
  <xsl:variable name="pubmed-ident">http://identifiers.org/pubmed/</xsl:variable>
  <xsl:variable name="issn">http://www.worldcat.org/issn/</xsl:variable>
  <xsl:variable name="issn-ident">http://identifiers.org/issn/</xsl:variable>
  <xsl:variable name="isbn">http://www.isbnsearch.org/isbn/</xsl:variable>
  <xsl:variable name="isbn-ident">http://identifiers.org/isbn/</xsl:variable>
  <xsl:variable name="taxonomy">http://purl.uniprot.org/taxonomy/</xsl:variable>
  <xsl:variable name="taxonomy-ident">http://identifiers.org/taxonomy/</xsl:variable>
  <xsl:variable name="ec-code">http://enzyme.expasy.org/EC/</xsl:variable>
  <xsl:variable name="ec-code-ident">http://identifiers.org/ec-code/</xsl:variable>
  <xsl:variable name="uniprot">http://purl.uniprot.org/uniprot/</xsl:variable>
  <xsl:variable name="uniprot-ident">http://identifiers.org/uniprot/</xsl:variable>
  <xsl:variable name="ddbj">http://www.ncbi.nlm.nih.gov/protein/</xsl:variable>
  <xsl:variable name="embl">http://www.ncbi.nlm.nih.gov/protein/</xsl:variable>
  <xsl:variable name="genbank">http://www.ncbi.nlm.nih.gov/protein/</xsl:variable>
  <xsl:variable name="ncbiprotein-ident">http://identifiers.org/ncbiprotein/</xsl:variable>
  <xsl:variable name="pir">http://www.ncbi.nlm.nih.gov/protein/</xsl:variable>
  <xsl:variable name="prf">http://www.ncbi.nlm.nih.gov/protein/?term=prf+</xsl:variable>
  <xsl:variable name="refseq">http://www.ncbi.nlm.nih.gov/protein/</xsl:variable>
  <xsl:variable name="refseq-ident">http://identifiers.org/refseq/</xsl:variable>
  <xsl:variable name="scop">http://scop.berkeley.edu/sunid=</xsl:variable>
  <xsl:variable name="scop-ident">http://identifiers.org/scop/</xsl:variable>
  <xsl:variable name="pdb">https://rdf.wwpdb.org/pdb/</xsl:variable>
  <xsl:variable name="pdb-ident">http://identifiers.org/pdb/</xsl:variable>
  <xsl:variable name="pdb-ccd">https://rdf.wwpdb.org/cc/</xsl:variable>
  <xsl:variable name="pdb-ccd-ident">http://identifiers.org/pdb-ccd/</xsl:variable>
  <xsl:variable name="pdb.ligand">http://ligand-expo.rcsb.org/pyapps/ldHandler.py?formid=cc-index-search&amp;operation=ccid&amp;target=</xsl:variable>
  <xsl:variable name="pdb.ligand-ident">http://identifiers.org/pdb.ligand/</xsl:variable>
  <xsl:variable name="pubchem.substance">http://rdf.ncbi.nlm.nih.gov/pubchem/substance/SID</xsl:variable>
  <xsl:variable name="pubchem.substance-ident">http://identifiers.org/pubchem.substance/</xsl:variable>
  <xsl:variable name="pubchem.compound">http://rdf.ncbi.nlm.nih.gov/pubchem/compound/CID</xsl:variable>
  <xsl:variable name="pubchem.compound-ident">http://identifiers.org/pubchem.compound/</xsl:variable>

  <xsl:variable name="base">
    <xsl:choose>
      <xsl:when test="starts-with($entry_id, 'bms')">http://bmrbpub.protein.osaka-u.ac.jp/rdf/<xsl:value-of select="$entry_id"/></xsl:when>
      <xsl:otherwise>http://bmrbpub.protein.osaka-u.ac.jp/rdf/bmr<xsl:value-of select="$entry_id"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="bmrb">
    <xsl:choose>
      <xsl:when test="starts-with($entry_id, 'bmse')">http://www.bmrb.wisc.edu/ftp/pub/bmrb/metabolomics/NMR_STAR_experimental_entries/</xsl:when>
      <xsl:when test="starts-with($entry_id, 'bmst')">http://www.bmrb.wisc.edu/ftp/pub/bmrb/metabolomics/NMR_STAR_theoretical_entries/</xsl:when>
      <xsl:otherwise>http://www.bmrb.wisc.edu/ftp/pub/bmrb/entry_lists/nmr-star3.1/bmr</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="pdbj-bmrb">
    <xsl:choose>
      <xsl:when test="starts-with($entry_id, 'bmse')">http://bmrb.pdbj.org/ftp/pub/bmrb/metabolomics/NMR_STAR_experimental_entries/</xsl:when>
      <xsl:when test="starts-with($entry_id, 'bmst')">http://bmrb.pdbj.org/ftp/pub/bmrb/metabolomics/NMR_STAR_theoretical_entries/</xsl:when>
      <xsl:otherwise>http://bmrb.pdbj.org/ftp/pub/bmrb/entry_lists/nmr-star3.1/bmr</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="bmrb-cerm">
    <xsl:choose>
      <xsl:when test="starts-with($entry_id, 'bmse')">http://bmrb.cerm.unifi.it/ftp/pub/bmrb/metabolomics/NMR_STAR_experimental_entries/</xsl:when>
      <xsl:when test="starts-with($entry_id, 'bmst')">http://bmrb.cerm.unifi.it/ftp/pub/bmrb/metabolomics/NMR_STAR_theoretical_entries/</xsl:when>
      <xsl:otherwise>http://bmrb.cerm.unifi.it/ftp/pub/bmrb/entry_lists/nmr-star3.1/bmr</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="bmrbx">
    <xsl:choose>
      <xsl:when test="starts-with($entry_id, 'bms')">http://bmrbpub.protein.osaka-u.ac.jp/xml/bms/</xsl:when>
      <xsl:otherwise>http://bmrbpub.protein.osaka-u.ac.jp/xml/bmr/bmr</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="bmrb_urn">
    <xsl:choose>
      <xsl:when test="starts-with($entry_id, 'bms')">info:bmrb.metabolomics/</xsl:when>
      <xsl:otherwise>info:bmrb/</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="bmrb_url">
    <xsl:choose>
      <xsl:when test="starts-with($entry_id, 'bms')">http://bmrbpub.protein.osaka-u.ac.jp/rdf/</xsl:when>
      <xsl:otherwise>http://bmrbpub.protein.osaka-u.ac.jp/rdf/bmr</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="pdbj-bmrbdep">
    <xsl:choose>
      <xsl:when test="starts-with($entry_id, 'bms')">http://bmrbdep.pdbj.org/bms/</xsl:when>
      <xsl:otherwise>http://bmrbdep.pdbj.org/bmr/bmr</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:template match="/">
    <rdf:RDF>
      <xsl:apply-templates/>
    </rdf:RDF>
  </xsl:template>

  <!-- level 1 -->
  <xsl:template match="/BMRBx:datablock">
    <BMRBo:datablock rdf:about="{$base}" rdfs:label="{$bmrb_urn}{$entry_id}">
      <rdfs:seeAlso rdf:resource="{$bmrbx}{$entry_id}-noatom.xml"/>
      <rdfs:seeAlso rdf:resource="{$bmrb}{$entry_id}.str"/>
      <rdfs:seeAlso rdf:resource="{$pdbj-bmrb}{$entry_id}.str"/>
      <rdfs:seeAlso rdf:resource="{$bmrb-cerm}{$entry_id}.str"/>
      <rdfs:seeAlso rdf:resource="{$pdbj-bmrbdep}{$entry_id}"/>

      <BMRBo:datablockName><xsl:value-of select="@datablockName"/></BMRBo:datablockName>
      <xsl:apply-templates select="./*"/>
    </BMRBo:datablock>
  </xsl:template>

  <!-- level 2 -->
  <xsl:template match="/BMRBx:datablock/*">
    <xsl:element name="BMRBo:has_{local-name(.)}">
      <xsl:element name="BMRBo:{local-name(.)}">
	<xsl:attribute name="rdf:about">
	  <xsl:value-of select="concat($base,'/',local-name(.))"/>
	</xsl:attribute>
    <xsl:apply-templates>
      <xsl:with-param name="base" select="$base"/>
    </xsl:apply-templates>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <!-- level 4 (element) -->
  <xsl:template match="/BMRBx:datablock/*/*/*[not(xsi:nil) and text() != '']">
    <xsl:element name="BMRBo:{concat(local-name(parent::node()),'.',local-name())}">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <!-- level 4 (attribute) -->
  <xsl:template match="/BMRBx:datablock/*/*/@*">
    <xsl:element name="BMRBo:{concat(local-name(parent::node()),'.',translate(name(),'@',''))}">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <!-- level 4 (linked data) -->
  <xsl:template match="BMRBx:entry_author/BMRBx:orcid[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$orcid}{text()}" rdfs:label="info:orcid/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$orcid-ident}{text()}" rdfs:label="urn:miriam:orcid:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:citation_author/BMRBx:orcid[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$orcid}{text()}" rdfs:label="info:orcid/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$orcid-ident}{text()}" rdfs:label="urn:miriam:orcid:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entry/BMRBx:doi[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$doi}{text()}" rdfs:label="info:doi/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$doi-ident}{text()}" rdfs:label="urn:miriam:doi:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:auxiliary_files/BMRBx:doi[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$doi}{text()}" rdfs:label="info:doi/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$doi-ident}{text()}" rdfs:label="urn:miriam:doi:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:citation/BMRBx:doi[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$doi}{text()}" rdfs:label="info:doi/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$doi-ident}{text()}" rdfs:label="urn:miriam:doi:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:citation/BMRBx:pubmed_id[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pubmed}{text()}" rdfs:label="info:pmid/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$pubmed-ident}{text()}" rdfs:label="urn:miriam:pubmed:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:citation/BMRBx:journal_issn[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$issn}{text()}" rdfs:label="urn:ISSN:{text()}"/>
    <rdfs:seeAlso rdf:resource="{$issn-ident}{text()}" rdfs:label="urn:miriam:issn:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:citation/BMRBx:book_isbn[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$isbn}{text()}" rdfs:label="urn:ISBN:{text()}"/>
    <rdfs:seeAlso rdf:resource="{$isbn-ident}{text()}" rdfs:label="urn:miriam:isbn:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:citation/BMRBx:www_url[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_natural_src/BMRBx:ncbi_taxonomy_id[text() != '' and text() != 'na' and text() != 'n/a']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$taxonomy}{text()}" rdfs:label="info:taxonomy/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$taxonomy-ident}{text()}" rdfs:label="urn:miriam:taxonomy:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_experimental_src/BMRBx:host_org_ncbi_taxonomy_id[text() != '' and text() != 'na' and text() != 'n/a']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$taxonomy}{text()}" rdfs:label="info:taxonomy/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$taxonomy-ident}{text()}" rdfs:label="urn:miriam:taxonomy:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly/BMRBx:enzyme_commission_number[text() != '' and text() != 'na' and text() != 'n/a']" mode="linked">
    <xsl:choose>
      <xsl:when test="contains(text(), ',')">
        <xsl:for-each select="tokenize(text(), ', ')">
          <xsl:variable name="ec_number" select="."/>
          <rdfs:seeAlso rdf:resource="{$ec-code}{$ec_number}" rdfs:label="info:ec-code/{$ec_number}"/>
          <rdfs:seeAlso rdf:resource="{$ec-code-ident}{$ec_number}" rdfs:label="urn:miriam:ec-code:{$ec_number}"/>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$ec-code}{text()}" rdfs:label="info:ec-code/{text()}"/>
        <rdfs:seeAlso rdf:resource="{$ec-code-ident}{text()}" rdfs:label="urn:miriam:ec-code:{text()}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_subsystem/BMRBx:enzyme_commission_number[text() != '' and text() != 'na']" mode="linked">
    <xsl:choose>
      <xsl:when test="contains(text(), ',')">
        <xsl:for-each select="tokenize(text(), ', ')">
          <xsl:variable name="ec_number" select="."/>
          <rdfs:seeAlso rdf:resource="{$ec-code}{$ec_number}" rdfs:label="info:ec-code/{$ec_number}"/>
          <rdfs:seeAlso rdf:resource="{$ec-code-ident}{$ec_number}" rdfs:label="urn:miriam:ec-code:{$ec_number}"/>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$ec-code}{text()}" rdfs:label="info:ec-code/{text()}"/>
        <rdfs:seeAlso rdf:resource="{$ec-code-ident}{text()}" rdfs:label="urn:miriam:ec-code:{text()}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:entity/BMRBx:ec_number[text() != '' and text() != 'na']" mode="linked">
    <xsl:choose>
      <xsl:when test="contains(text(), ',')">
        <xsl:for-each select="tokenize(text(), ', ')">
          <xsl:variable name="ec_number" select="."/>
          <rdfs:seeAlso rdf:resource="{$ec-code}{$ec_number}" rdfs:label="info:ec-code/{$ec_number}"/>
          <rdfs:seeAlso rdf:resource="{$ec-code-ident}{$ec_number}" rdfs:label="urn:miriam:ec-code:{$ec_number}"/>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$ec-code}{text()}" rdfs:label="info:ec-code/{text()}"/>
        <rdfs:seeAlso rdf:resource="{$ec-code-ident}{text()}" rdfs:label="urn:miriam:ec-code:{text()}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='SP']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$uniprot}{.}" rdfs:label="info:uniprot/{.}"/>
    <rdfs:seeAlso rdf:resource="{$uniprot-ident}{.}" rdfs:label="urn:miriam:uniprot:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='SP']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$uniprot}{.}" rdfs:label="info:uniprot/{.}"/>
    <rdfs:seeAlso rdf:resource="{$uniprot-ident}{.}" rdfs:label="urn:miriam:uniprot:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='SP']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$uniprot}{.}" rdfs:label="info:uniprot/{.}"/>
    <rdfs:seeAlso rdf:resource="{$uniprot-ident}{.}" rdfs:label="urn:miriam:uniprot:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='SP']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$uniprot}{.}" rdfs:label="info:uniprot/{.}"/>
    <rdfs:seeAlso rdf:resource="{$uniprot-ident}{.}" rdfs:label="urn:miriam:uniprot:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='DBJ']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$ddbj}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='DBJ']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$ddbj}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='DBJ']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$ddbj}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='DBJ']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$ddbj}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='EMBL']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$embl}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='EMBL']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$embl}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='EMBL']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$embl}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='EMBL']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$embl}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='GB']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$genbank}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='GB']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$genbank}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='GB']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$genbank}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='GB']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$genbank}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/>
    <rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='PIR']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pir}{.}" rdfs:label="info:pir/{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='PIR']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pir}{.}" rdfs:label="info:pir/{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='PIR']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pir}{.}" rdfs:label="info:pir/{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='PIR']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pir}{.}" rdfs:label="info:pir/{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='PRF']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$prf}{.}" rdfs:label="info:prf/{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='PRF']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$prf}{.}" rdfs:label="info:prf/{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='PRF']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$prf}{.}" rdfs:label="info:prf/{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='PRF']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$prf}{.}" rdfs:label="info:prf/{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='REF']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$refseq}{.}" rdfs:label="info:refseq/{.}"/>
    <rdfs:seeAlso rdf:resource="{$refseq-ident}{.}" rdfs:label="urn:miriam:refseq:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='REF']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$refseq}{.}" rdfs:label="info:refseq/{.}"/>
    <rdfs:seeAlso rdf:resource="{$refseq-ident}{.}" rdfs:label="urn:miriam:refseq:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='REF']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$refseq}{.}" rdfs:label="info:refseq/{.}"/>
    <rdfs:seeAlso rdf:resource="{$refseq-ident}{.}" rdfs:label="urn:miriam:refseq:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='REF']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$refseq}{.}" rdfs:label="info:refseq/{.}"/>
    <rdfs:seeAlso rdf:resource="{$refseq-ident}{.}" rdfs:label="urn:miriam:refseq:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:struct_classification/BMRBx:sunid[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$scop}{text()}" rdfs:label="info:scop/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$scop-ident}{text()}" rdfs:label="urn:miriam:scop:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entry/BMRBx:assigned_pdb_id[text() != '']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:conformer_family_coord_set/BMRBx:pdb_accession_code[text() != '']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:representative_conformer/BMRBx:pdb_accession_code[text() != '']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:structure_annotation/BMRBx:pdb_id[text() != '']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:pb_list/BMRBx:pdb_id[text() != '']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='PDB']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{.}" rdfs:label="info:pdb/{.}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{.}" rdfs:label="urn:miriam:pdb:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='PDB']/@accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{.}" rdfs:label="info:pdb/{.}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{.}" rdfs:label="urn:miriam:pdb:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='PDB']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{.}" rdfs:label="info:pdb/{.}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{.}" rdfs:label="urn:miriam:pdb:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='PDB']/@database_accession_code" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pdb}{.}" rdfs:label="info:pdb/{.}"/>
    <rdfs:seeAlso rdf:resource="{$pdb-ident}{.}" rdfs:label="urn:miriam:pdb:{.}"/>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='BMRB']/@accession_code" mode="linked">
    <xsl:variable name="bmrb_id" select="."/>
    <xsl:choose>
      <xsl:when test="starts-with($bmrb_id, 'bms')">
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='BMRB']/@accession_code" mode="linked">
    <xsl:variable name="bmrb_id" select="."/>
    <xsl:choose>
      <xsl:when test="starts-with($bmrb_id, 'bms')">
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='BMRB']/@database_accession_code" mode="linked">
    <xsl:variable name="bmrb_id" select="."/>
    <xsl:choose>
      <xsl:when test="starts-with($bmrb_id, 'bms')">
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='BMRB']/@database_accession_code" mode="linked">
    <xsl:variable name="bmrb_id" select="."/>
    <xsl:choose>
      <xsl:when test="starts-with($bmrb_id, 'bms')">
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:assembly_db_link[@database_code='BMRB(withdrawn)']/@accession_code" mode="linked">
    <xsl:variable name="bmrb_id" select="."/>
    <xsl:choose>
      <xsl:when test="starts-with($bmrb_id, 'bms')">
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:entity_db_link[@database_code='BMRB(withdrawn)']/@accession_code" mode="linked">
    <xsl:variable name="bmrb_id" select="."/>
    <xsl:choose>
      <xsl:when test="starts-with($bmrb_id, 'bms')">
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:related_entries[@database_name='BMRB(withdrawn)']/@database_accession_code" mode="linked">
    <xsl:variable name="bmrb_id" select="."/>
    <xsl:choose>
      <xsl:when test="starts-with($bmrb_id, 'bms')">
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:matched_entries[@database_name='BMRB(withdrawn)']/@database_accession_code" mode="linked">
    <xsl:variable name="bmrb_id" select="."/>
    <xsl:choose>
      <xsl:when test="starts-with($bmrb_id, 'bms')">
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/>
      </xsl:when>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:chem_comp/BMRBx:pdb_code[text() != '' and text() != 'na']" mode="linked">
    <xsl:choose>
      <xsl:when test="starts-with(text(), 'pdb/')">
        <xsl:variable name="pdb_code" select="substring-after(text(),'pdb/')"/>
        <xsl:variable name="cc_code" select="substring-after(text(),'chem_comp/')"/>
        <rdfs:seeAlso rdf:resource="{$pdb}{translate($pdb_code,' []@#%+&amp;','_()a....')}" rdfs:label="info:pdb/{$pdb_code}"/>
        <rdfs:seeAlso rdf:resource="{$pdb-ident}{translate($pdb_code,' []@#%+&amp;','_()a....')}" rdfs:label="urn:miriam:pdb:{$pdb_code}"/>
        <rdfs:seeAlso rdf:resource="{$pdb.ligand}{translate($cc_code,' []@#%+&amp;','_()a....')}" rdfs:label="info:pdb.ligand/{$cc_code}"/>
        <rdfs:seeAlso rdf:resource="{$pdb.ligand-ident}{translate($cc_code,' []@#%+&amp;','_()a....')}" rdfs:label="urn:miriam:pdb.ligand:{$cc_code}"/>
      </xsl:when>
      <xsl:when test="starts-with(text(), 'bmrb_ligand_expo/')"/>
      <xsl:when test="starts-with(text(), 'no_records/')"/>
      <xsl:otherwise>
        <rdfs:seeAlso rdf:resource="{$pdb-ccd}{translate(text(),' []@#%+&amp;','_()a....')}" rdfs:label="info:pdb-ccd/{text()}"/>
        <rdfs:seeAlso rdf:resource="{$pdb-ccd-ident}{translate(text(),' []@#%+&amp;','_()a....')}" rdfs:label="urn:miriam:pdb-ccd:{text()}"/>
        <rdfs:seeAlso rdf:resource="{$pdb.ligand}{translate(text(),' []@#%+&amp;','_()a....')}" rdfs:label="info:pdb.ligand/{text()}"/>
        <rdfs:seeAlso rdf:resource="{$pdb.ligand-ident}{translate(text(),' []@#%+&amp;','_()a....')}" rdfs:label="urn:miriam:pdb.ligand:{text()}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BMRBx:chem_comp/BMRBx:pubchem_code[text() != '' and text() != 'na']" mode="linked">
    <rdfs:seeAlso rdf:resource="{$pubchem.substance}{text()}" rdfs:label="info:pubchem.substance/{text()}"/>
    <rdfs:seeAlso rdf:resource="{$pubchem.substance-ident}{text()}" rdfs:label="urn:miriam:pubchem.substance:{text()}"/>
  </xsl:template>

  <xsl:template match="BMRBx:chem_comp_db_link[@database_code='PubChem' and @accession_code != '' and @accession_code != 'na']/BMRBx:accession_code_type" mode="linked">
    <xsl:variable name="pubchem_id" select="../@accession_code"/>
    <xsl:if test="text()='sid'">
       <rdfs:seeAlso rdf:resource="{$pubchem.substance}{$pubchem_id}" rdfs:label="info:pubchem.substance/{$pubchem_id}"/>
       <rdfs:seeAlso rdf:resource="{$pubchem.substance-ident}{$pubchem_id}" rdfs:label="urn:miriam:pubchem.substance:{$pubchem_id}"/>
    </xsl:if>
    <xsl:if test="text()='cid'">
       <rdfs:seeAlso rdf:resource="{$pubchem.compound}{$pubchem_id}" rdfs:label="info:pubchem.compound/{$pubchem_id}"/>
       <rdfs:seeAlso rdf:resource="{$pubchem.compound-ident}{$pubchem_id}" rdfs:label="urn:miriam:pubchem.compound:{$pubchem_id}"/>
    </xsl:if>
  </xsl:template>

  <!-- level 3 (templates follow) -->
    
  <xsl:template match="BMRBx:datablock/BMRBx:ambiguous_atom_chem_shiftCategory/BMRBx:ambiguous_atom_chem_shift">
      <BMRBo:has_ambiguous_atom_chem_shift>
      <BMRBo:ambiguous_atom_chem_shift rdf:about="{$base}/ambiguous_atom_chem_shift/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@atom_chem_shift_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ambiguous_atom_chem_shift>
      </BMRBo:has_ambiguous_atom_chem_shift>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:angleCategory/BMRBx:angle">
      <BMRBo:has_angle>
      <BMRBo:angle rdf:about="{$base}/angle/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:angle>
      </BMRBo:has_angle>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:angular_order_paramCategory/BMRBx:angular_order_param">
      <BMRBo:has_angular_order_param>
      <BMRBo:angular_order_param rdf:about="{$base}/angular_order_param/{translate(@angular_order_parameter_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_angular_order_param rdf:resource="{$base}/angular_order_param/{translate(@angular_order_parameter_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_0_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:angular_order_param>
      </BMRBo:has_angular_order_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:angular_order_parameter_listCategory/BMRBx:angular_order_parameter_list">
      <BMRBo:has_angular_order_parameter_list>
      <BMRBo:angular_order_parameter_list rdf:about="{$base}/angular_order_parameter_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_angular_order_parameter_list rdf:resource="{$base}/angular_order_parameter_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_1_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:angular_order_parameter_list>
      </BMRBo:has_angular_order_parameter_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assemblyCategory/BMRBx:assembly">
      <BMRBo:has_assembly>
      <BMRBo:assembly rdf:about="{$base}/assembly/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_assembly rdf:resource="{$base}/assembly/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_2_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly>
      </BMRBo:has_assembly>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_annotation_listCategory/BMRBx:assembly_annotation_list">
      <BMRBo:has_assembly_annotation_list>
      <BMRBo:assembly_annotation_list rdf:about="{$base}/assembly_annotation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_assembly_annotation_list rdf:resource="{$base}/assembly_annotation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_3_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_annotation_list>
      </BMRBo:has_assembly_annotation_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_bio_functionCategory/BMRBx:assembly_bio_function">
      <BMRBo:has_assembly_bio_function>
      <BMRBo:assembly_bio_function rdf:about="{$base}/assembly_bio_function/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@biological_function,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_bio_function>
      </BMRBo:has_assembly_bio_function>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_citationCategory/BMRBx:assembly_citation">
      <BMRBo:has_assembly_citation>
      <BMRBo:assembly_citation rdf:about="{$base}/assembly_citation/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_citation>
      </BMRBo:has_assembly_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_common_nameCategory/BMRBx:assembly_common_name">
      <BMRBo:has_assembly_common_name>
      <BMRBo:assembly_common_name rdf:about="{$base}/assembly_common_name/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_common_name>
      </BMRBo:has_assembly_common_name>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_db_linkCategory/BMRBx:assembly_db_link">
      <BMRBo:has_assembly_db_link>
      <BMRBo:assembly_db_link rdf:about="{$base}/assembly_db_link/{translate(@accession_code,' []@#%+&amp;','_()a....')},{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@database_code,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_db_link>
      </BMRBo:has_assembly_db_link>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_interactionCategory/BMRBx:assembly_interaction">
      <BMRBo:has_assembly_interaction>
      <BMRBo:assembly_interaction rdf:about="{$base}/assembly_interaction/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_interaction>
      </BMRBo:has_assembly_interaction>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_keywordCategory/BMRBx:assembly_keyword">
      <BMRBo:has_assembly_keyword>
      <BMRBo:assembly_keyword rdf:about="{$base}/assembly_keyword/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@keyword,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_keyword>
      </BMRBo:has_assembly_keyword>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_segmentCategory/BMRBx:assembly_segment">
      <BMRBo:has_assembly_segment>
      <BMRBo:assembly_segment rdf:about="{$base}/assembly_segment/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_segment>
      </BMRBo:has_assembly_segment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_segment_descriptionCategory/BMRBx:assembly_segment_description">
      <BMRBo:has_assembly_segment_description>
      <BMRBo:assembly_segment_description rdf:about="{$base}/assembly_segment_description/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@assembly_segment_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_segment_description>
      </BMRBo:has_assembly_segment_description>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_subsystemCategory/BMRBx:assembly_subsystem">
      <BMRBo:has_assembly_subsystem>
      <BMRBo:assembly_subsystem rdf:about="{$base}/assembly_subsystem/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_assembly_subsystem rdf:resource="{$base}/assembly_subsystem/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_4_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_subsystem>
      </BMRBo:has_assembly_subsystem>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_systematic_nameCategory/BMRBx:assembly_systematic_name">
      <BMRBo:has_assembly_systematic_name>
      <BMRBo:assembly_systematic_name rdf:about="{$base}/assembly_systematic_name/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@naming_system,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_systematic_name>
      </BMRBo:has_assembly_systematic_name>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assembly_typeCategory/BMRBx:assembly_type">
      <BMRBo:has_assembly_type>
      <BMRBo:assembly_type rdf:about="{$base}/assembly_type/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assembly_type>
      </BMRBo:has_assembly_type>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assigned_chem_shift_listCategory/BMRBx:assigned_chem_shift_list">
      <BMRBo:has_assigned_chem_shift_list>
      <BMRBo:assigned_chem_shift_list rdf:about="{$base}/assigned_chem_shift_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_assigned_chem_shift_list rdf:resource="{$base}/assigned_chem_shift_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_5_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assigned_chem_shift_list>
      </BMRBo:has_assigned_chem_shift_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assigned_peak_chem_shiftCategory/BMRBx:assigned_peak_chem_shift">
      <BMRBo:has_assigned_peak_chem_shift>
      <BMRBo:assigned_peak_chem_shift rdf:about="{$base}/assigned_peak_chem_shift/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@peak_id,' []@#%+&amp;','_()a....')},{translate(@spectral_dim_id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assigned_peak_chem_shift>
      </BMRBo:has_assigned_peak_chem_shift>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:assigned_spectral_transitionCategory/BMRBx:assigned_spectral_transition">
      <BMRBo:has_assigned_spectral_transition>
      <BMRBo:assigned_spectral_transition rdf:about="{$base}/assigned_spectral_transition/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@spectral_dim_id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')},{translate(@spectral_transition_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:assigned_spectral_transition>
      </BMRBo:has_assigned_spectral_transition>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:atomCategory/BMRBx:atom">
      <BMRBo:has_atom>
      <BMRBo:atom rdf:about="{$base}/atom/{translate(@assembly_atom_id,' []@#%+&amp;','_()a....')},{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:atom>
      </BMRBo:has_atom>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:atom_chem_shiftCategory/BMRBx:atom_chem_shift">
      <BMRBo:has_atom_chem_shift>
      <BMRBo:atom_chem_shift rdf:about="{$base}/atom_chem_shift/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:atom_chem_shift>
      </BMRBo:has_atom_chem_shift>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:atom_nomenclatureCategory/BMRBx:atom_nomenclature">
      <BMRBo:has_atom_nomenclature>
      <BMRBo:atom_nomenclature rdf:about="{$base}/atom_nomenclature/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:atom_nomenclature>
      </BMRBo:has_atom_nomenclature>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:atom_siteCategory/BMRBx:atom_site">
      <BMRBo:has_atom_site>
      <BMRBo:atom_site rdf:about="{$base}/atom_site/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_atom_site rdf:resource="{$base}/atom_site/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_6_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:atom_site>
      </BMRBo:has_atom_site>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:atom_sites_footnoteCategory/BMRBx:atom_sites_footnote">
      <BMRBo:has_atom_sites_footnote>
      <BMRBo:atom_sites_footnote rdf:about="{$base}/atom_sites_footnote/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@footnote_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_atom_sites_footnote rdf:resource="{$base}/atom_sites_footnote/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@footnote_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_7_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:atom_sites_footnote>
      </BMRBo:has_atom_sites_footnote>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:atom_typeCategory/BMRBx:atom_type">
      <BMRBo:has_atom_type>
      <BMRBo:atom_type rdf:about="{$base}/atom_type/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:atom_type>
      </BMRBo:has_atom_type>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:author_annotationCategory/BMRBx:author_annotation">
      <BMRBo:has_author_annotation>
      <BMRBo:author_annotation rdf:about="{$base}/author_annotation/{translate(@assembly_annotation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:author_annotation>
      </BMRBo:has_author_annotation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:auto_relaxationCategory/BMRBx:auto_relaxation">
      <BMRBo:has_auto_relaxation>
      <BMRBo:auto_relaxation rdf:about="{$base}/auto_relaxation/{translate(@auto_relaxation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_auto_relaxation rdf:resource="{$base}/auto_relaxation/{translate(@auto_relaxation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_8_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:auto_relaxation>
      </BMRBo:has_auto_relaxation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:auto_relaxation_experimentCategory/BMRBx:auto_relaxation_experiment">
      <BMRBo:has_auto_relaxation_experiment>
      <BMRBo:auto_relaxation_experiment rdf:about="{$base}/auto_relaxation_experiment/{translate(@auto_relaxation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_auto_relaxation_experiment rdf:resource="{$base}/auto_relaxation_experiment/{translate(@auto_relaxation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_9_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:auto_relaxation_experiment>
      </BMRBo:has_auto_relaxation_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:auto_relaxation_listCategory/BMRBx:auto_relaxation_list">
      <BMRBo:has_auto_relaxation_list>
      <BMRBo:auto_relaxation_list rdf:about="{$base}/auto_relaxation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_auto_relaxation_list rdf:resource="{$base}/auto_relaxation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_10_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:auto_relaxation_list>
      </BMRBo:has_auto_relaxation_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:auto_relaxation_softwareCategory/BMRBx:auto_relaxation_software">
      <BMRBo:has_auto_relaxation_software>
      <BMRBo:auto_relaxation_software rdf:about="{$base}/auto_relaxation_software/{translate(@auto_relaxation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_auto_relaxation_software rdf:resource="{$base}/auto_relaxation_software/{translate(@auto_relaxation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_11_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:auto_relaxation_software>
      </BMRBo:has_auto_relaxation_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:auxiliary_filesCategory/BMRBx:auxiliary_files">
      <BMRBo:has_auxiliary_files>
      <BMRBo:auxiliary_files rdf:about="{$base}/auxiliary_files/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_auxiliary_files rdf:resource="{$base}/auxiliary_files/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_12_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:auxiliary_files>
      </BMRBo:has_auxiliary_files>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:binding_experimentCategory/BMRBx:binding_experiment">
      <BMRBo:has_binding_experiment>
      <BMRBo:binding_experiment rdf:about="{$base}/binding_experiment/{translate(@binding_value_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_binding_experiment rdf:resource="{$base}/binding_experiment/{translate(@binding_value_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_13_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:binding_experiment>
      </BMRBo:has_binding_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:binding_paramCategory/BMRBx:binding_param">
      <BMRBo:has_binding_param>
      <BMRBo:binding_param rdf:about="{$base}/binding_param/{translate(@binding_param_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_binding_param rdf:resource="{$base}/binding_param/{translate(@binding_param_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_14_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:binding_param>
      </BMRBo:has_binding_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:binding_param_listCategory/BMRBx:binding_param_list">
      <BMRBo:has_binding_param_list>
      <BMRBo:binding_param_list rdf:about="{$base}/binding_param_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_binding_param_list rdf:resource="{$base}/binding_param_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_15_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:binding_param_list>
      </BMRBo:has_binding_param_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:binding_partnersCategory/BMRBx:binding_partners">
      <BMRBo:has_binding_partners>
      <BMRBo:binding_partners rdf:about="{$base}/binding_partners/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@binding_value_list_id,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_binding_partners rdf:resource="{$base}/binding_partners/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@binding_value_list_id,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_16_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:binding_partners>
      </BMRBo:has_binding_partners>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:binding_resultCategory/BMRBx:binding_result">
      <BMRBo:has_binding_result>
      <BMRBo:binding_result rdf:about="{$base}/binding_result/{translate(@binding_value_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_binding_result rdf:resource="{$base}/binding_result/{translate(@binding_value_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_17_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:binding_result>
      </BMRBo:has_binding_result>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:binding_softwareCategory/BMRBx:binding_software">
      <BMRBo:has_binding_software>
      <BMRBo:binding_software rdf:about="{$base}/binding_software/{translate(@binding_value_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_binding_software rdf:resource="{$base}/binding_software/{translate(@binding_value_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_18_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:binding_software>
      </BMRBo:has_binding_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:binding_value_listCategory/BMRBx:binding_value_list">
      <BMRBo:has_binding_value_list>
      <BMRBo:binding_value_list rdf:about="{$base}/binding_value_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_binding_value_list rdf:resource="{$base}/binding_value_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_19_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:binding_value_list>
      </BMRBo:has_binding_value_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:bondCategory/BMRBx:bond">
      <BMRBo:has_bond>
      <BMRBo:bond rdf:about="{$base}/bond/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:bond>
      </BMRBo:has_bond>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:bond_annotationCategory/BMRBx:bond_annotation">
      <BMRBo:has_bond_annotation>
      <BMRBo:bond_annotation rdf:about="{$base}/bond_annotation/{translate(@bond_annotation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_bond_annotation rdf:resource="{$base}/bond_annotation/{translate(@bond_annotation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_20_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:bond_annotation>
      </BMRBo:has_bond_annotation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:bond_annotation_listCategory/BMRBx:bond_annotation_list">
      <BMRBo:has_bond_annotation_list>
      <BMRBo:bond_annotation_list rdf:about="{$base}/bond_annotation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_bond_annotation_list rdf:resource="{$base}/bond_annotation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_21_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:bond_annotation_list>
      </BMRBo:has_bond_annotation_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:bond_observed_conformerCategory/BMRBx:bond_observed_conformer">
      <BMRBo:has_bond_observed_conformer>
      <BMRBo:bond_observed_conformer rdf:about="{$base}/bond_observed_conformer/{translate(@atom_site_model_id,' []@#%+&amp;','_()a....')},{translate(@bond_annotation_id,' []@#%+&amp;','_()a....')},{translate(@bond_annotation_list_id,' []@#%+&amp;','_()a....')},{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_bond_observed_conformer rdf:resource="{$base}/bond_observed_conformer/{translate(@atom_site_model_id,' []@#%+&amp;','_()a....')},{translate(@bond_annotation_id,' []@#%+&amp;','_()a....')},{translate(@bond_annotation_list_id,' []@#%+&amp;','_()a....')},{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_22_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:bond_observed_conformer>
      </BMRBo:has_bond_observed_conformer>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ca_cb_constraintCategory/BMRBx:ca_cb_constraint">
      <BMRBo:has_ca_cb_constraint>
      <BMRBo:ca_cb_constraint rdf:about="{$base}/ca_cb_constraint/{translate(@ca_cb_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ca_cb_constraint rdf:resource="{$base}/ca_cb_constraint/{translate(@ca_cb_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_23_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ca_cb_constraint>
      </BMRBo:has_ca_cb_constraint>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ca_cb_constraint_exptCategory/BMRBx:ca_cb_constraint_expt">
      <BMRBo:has_ca_cb_constraint_expt>
      <BMRBo:ca_cb_constraint_expt rdf:about="{$base}/ca_cb_constraint_expt/{translate(@ca_cb_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ca_cb_constraint_expt rdf:resource="{$base}/ca_cb_constraint_expt/{translate(@ca_cb_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_24_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ca_cb_constraint_expt>
      </BMRBo:has_ca_cb_constraint_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ca_cb_constraint_listCategory/BMRBx:ca_cb_constraint_list">
      <BMRBo:has_ca_cb_constraint_list>
      <BMRBo:ca_cb_constraint_list rdf:about="{$base}/ca_cb_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ca_cb_constraint_list rdf:resource="{$base}/ca_cb_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_25_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ca_cb_constraint_list>
      </BMRBo:has_ca_cb_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ca_cb_constraint_softwareCategory/BMRBx:ca_cb_constraint_software">
      <BMRBo:has_ca_cb_constraint_software>
      <BMRBo:ca_cb_constraint_software rdf:about="{$base}/ca_cb_constraint_software/{translate(@ca_cb_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ca_cb_constraint_software rdf:resource="{$base}/ca_cb_constraint_software/{translate(@ca_cb_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_26_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ca_cb_constraint_software>
      </BMRBo:has_ca_cb_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:characteristicCategory/BMRBx:characteristic">
      <BMRBo:has_characteristic>
      <BMRBo:characteristic rdf:about="{$base}/characteristic/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:characteristic>
      </BMRBo:has_characteristic>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_compCategory/BMRBx:chem_comp">
      <BMRBo:has_chem_comp>
      <BMRBo:chem_comp rdf:about="{$base}/chem_comp/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_comp rdf:resource="{$base}/chem_comp/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_27_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp>
      </BMRBo:has_chem_comp>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_angleCategory/BMRBx:chem_comp_angle">
      <BMRBo:has_chem_comp_angle>
      <BMRBo:chem_comp_angle rdf:about="{$base}/chem_comp_angle/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_angle>
      </BMRBo:has_chem_comp_angle>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_assemblyCategory/BMRBx:chem_comp_assembly">
      <BMRBo:has_chem_comp_assembly>
      <BMRBo:chem_comp_assembly rdf:about="{$base}/chem_comp_assembly/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_assembly>
      </BMRBo:has_chem_comp_assembly>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_atomCategory/BMRBx:chem_comp_atom">
      <BMRBo:has_chem_comp_atom>
      <BMRBo:chem_comp_atom rdf:about="{$base}/chem_comp_atom/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_comp_atom rdf:resource="{$base}/chem_comp_atom/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_28_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_atom>
      </BMRBo:has_chem_comp_atom>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_bio_functionCategory/BMRBx:chem_comp_bio_function">
      <BMRBo:has_chem_comp_bio_function>
      <BMRBo:chem_comp_bio_function rdf:about="{$base}/chem_comp_bio_function/{translate(@biological_function,' []@#%+&amp;','_()a....')},{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_bio_function>
      </BMRBo:has_chem_comp_bio_function>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_bondCategory/BMRBx:chem_comp_bond">
      <BMRBo:has_chem_comp_bond>
      <BMRBo:chem_comp_bond rdf:about="{$base}/chem_comp_bond/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_bond>
      </BMRBo:has_chem_comp_bond>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_citationCategory/BMRBx:chem_comp_citation">
      <BMRBo:has_chem_comp_citation>
      <BMRBo:chem_comp_citation rdf:about="{$base}/chem_comp_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_citation>
      </BMRBo:has_chem_comp_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_common_nameCategory/BMRBx:chem_comp_common_name">
      <BMRBo:has_chem_comp_common_name>
      <BMRBo:chem_comp_common_name rdf:about="{$base}/chem_comp_common_name/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_common_name>
      </BMRBo:has_chem_comp_common_name>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_db_linkCategory/BMRBx:chem_comp_db_link">
      <BMRBo:has_chem_comp_db_link>
      <BMRBo:chem_comp_db_link rdf:about="{$base}/chem_comp_db_link/{translate(@accession_code,' []@#%+&amp;','_()a....')},{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@database_code,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_db_link>
      </BMRBo:has_chem_comp_db_link>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_descriptorCategory/BMRBx:chem_comp_descriptor">
      <BMRBo:has_chem_comp_descriptor>
      <BMRBo:chem_comp_descriptor rdf:about="{$base}/chem_comp_descriptor/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@descriptor,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@program,' []@#%+&amp;','_()a....')},{translate(@program_version,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_descriptor>
      </BMRBo:has_chem_comp_descriptor>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_identifierCategory/BMRBx:chem_comp_identifier">
      <BMRBo:has_chem_comp_identifier>
      <BMRBo:chem_comp_identifier rdf:about="{$base}/chem_comp_identifier/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@identifier,' []@#%+&amp;','_()a....')},{translate(@program,' []@#%+&amp;','_()a....')},{translate(@program_version,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_identifier>
      </BMRBo:has_chem_comp_identifier>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_keywordCategory/BMRBx:chem_comp_keyword">
      <BMRBo:has_chem_comp_keyword>
      <BMRBo:chem_comp_keyword rdf:about="{$base}/chem_comp_keyword/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@keyword,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_keyword>
      </BMRBo:has_chem_comp_keyword>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_smilesCategory/BMRBx:chem_comp_smiles">
      <BMRBo:has_chem_comp_smiles>
      <BMRBo:chem_comp_smiles rdf:about="{$base}/chem_comp_smiles/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@string,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_smiles>
      </BMRBo:has_chem_comp_smiles>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_systematic_nameCategory/BMRBx:chem_comp_systematic_name">
      <BMRBo:has_chem_comp_systematic_name>
      <BMRBo:chem_comp_systematic_name rdf:about="{$base}/chem_comp_systematic_name/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@naming_system,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_systematic_name>
      </BMRBo:has_chem_comp_systematic_name>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_comp_torCategory/BMRBx:chem_comp_tor">
      <BMRBo:has_chem_comp_tor>
      <BMRBo:chem_comp_tor rdf:about="{$base}/chem_comp_tor/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_comp_tor>
      </BMRBo:has_chem_comp_tor>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_anisotropyCategory/BMRBx:chem_shift_anisotropy">
      <BMRBo:has_chem_shift_anisotropy>
      <BMRBo:chem_shift_anisotropy rdf:about="{$base}/chem_shift_anisotropy/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_shift_anisotropy rdf:resource="{$base}/chem_shift_anisotropy/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_29_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_anisotropy>
      </BMRBo:has_chem_shift_anisotropy>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_completeness_charCategory/BMRBx:chem_shift_completeness_char">
      <BMRBo:has_chem_shift_completeness_char>
      <BMRBo:chem_shift_completeness_char rdf:about="{$base}/chem_shift_completeness_char/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_shift_completeness_char rdf:resource="{$base}/chem_shift_completeness_char/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_30_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_completeness_char>
      </BMRBo:has_chem_shift_completeness_char>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_completeness_listCategory/BMRBx:chem_shift_completeness_list">
      <BMRBo:has_chem_shift_completeness_list>
      <BMRBo:chem_shift_completeness_list rdf:about="{$base}/chem_shift_completeness_list/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_shift_completeness_list rdf:resource="{$base}/chem_shift_completeness_list/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_31_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_completeness_list>
      </BMRBo:has_chem_shift_completeness_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_experimentCategory/BMRBx:chem_shift_experiment">
      <BMRBo:has_chem_shift_experiment>
      <BMRBo:chem_shift_experiment rdf:about="{$base}/chem_shift_experiment/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_experiment>
      </BMRBo:has_chem_shift_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_isotope_effect_listCategory/BMRBx:chem_shift_isotope_effect_list">
      <BMRBo:has_chem_shift_isotope_effect_list>
      <BMRBo:chem_shift_isotope_effect_list rdf:about="{$base}/chem_shift_isotope_effect_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_shift_isotope_effect_list rdf:resource="{$base}/chem_shift_isotope_effect_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_32_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_isotope_effect_list>
      </BMRBo:has_chem_shift_isotope_effect_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_perturbationCategory/BMRBx:chem_shift_perturbation">
      <BMRBo:has_chem_shift_perturbation>
      <BMRBo:chem_shift_perturbation rdf:about="{$base}/chem_shift_perturbation/{translate(@chem_shift_perturbation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_perturbation>
      </BMRBo:has_chem_shift_perturbation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_perturbation_experimentCategory/BMRBx:chem_shift_perturbation_experiment">
      <BMRBo:has_chem_shift_perturbation_experiment>
      <BMRBo:chem_shift_perturbation_experiment rdf:about="{$base}/chem_shift_perturbation_experiment/{translate(@chem_shift_perturbation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_perturbation_experiment>
      </BMRBo:has_chem_shift_perturbation_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_perturbation_listCategory/BMRBx:chem_shift_perturbation_list">
      <BMRBo:has_chem_shift_perturbation_list>
      <BMRBo:chem_shift_perturbation_list rdf:about="{$base}/chem_shift_perturbation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_shift_perturbation_list rdf:resource="{$base}/chem_shift_perturbation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_33_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_perturbation_list>
      </BMRBo:has_chem_shift_perturbation_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_perturbation_softwareCategory/BMRBx:chem_shift_perturbation_software">
      <BMRBo:has_chem_shift_perturbation_software>
      <BMRBo:chem_shift_perturbation_software rdf:about="{$base}/chem_shift_perturbation_software/{translate(@chem_shift_perturbation_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_perturbation_software>
      </BMRBo:has_chem_shift_perturbation_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_refCategory/BMRBx:chem_shift_ref">
      <BMRBo:has_chem_shift_ref>
      <BMRBo:chem_shift_ref rdf:about="{$base}/chem_shift_ref/{translate(@atom_isotope_number,' []@#%+&amp;','_()a....')},{translate(@atom_type,' []@#%+&amp;','_()a....')},{translate(@chem_shift_reference_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@mol_common_name,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_ref>
      </BMRBo:has_chem_shift_ref>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_referenceCategory/BMRBx:chem_shift_reference">
      <BMRBo:has_chem_shift_reference>
      <BMRBo:chem_shift_reference rdf:about="{$base}/chem_shift_reference/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_shift_reference rdf:resource="{$base}/chem_shift_reference/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_34_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_reference>
      </BMRBo:has_chem_shift_reference>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shift_softwareCategory/BMRBx:chem_shift_software">
      <BMRBo:has_chem_shift_software>
      <BMRBo:chem_shift_software rdf:about="{$base}/chem_shift_software/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shift_software>
      </BMRBo:has_chem_shift_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shifts_calc_softwareCategory/BMRBx:chem_shifts_calc_software">
      <BMRBo:has_chem_shifts_calc_software>
      <BMRBo:chem_shifts_calc_software rdf:about="{$base}/chem_shifts_calc_software/{translate(@chem_shifts_calc_type_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shifts_calc_software>
      </BMRBo:has_chem_shifts_calc_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_shifts_calc_typeCategory/BMRBx:chem_shifts_calc_type">
      <BMRBo:has_chem_shifts_calc_type>
      <BMRBo:chem_shifts_calc_type rdf:about="{$base}/chem_shifts_calc_type/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chem_shifts_calc_type rdf:resource="{$base}/chem_shifts_calc_type/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_35_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_shifts_calc_type>
      </BMRBo:has_chem_shifts_calc_type>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chem_struct_descriptorCategory/BMRBx:chem_struct_descriptor">
      <BMRBo:has_chem_struct_descriptor>
      <BMRBo:chem_struct_descriptor rdf:about="{$base}/chem_struct_descriptor/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chem_struct_descriptor>
      </BMRBo:has_chem_struct_descriptor>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chemical_rateCategory/BMRBx:chemical_rate">
      <BMRBo:has_chemical_rate>
      <BMRBo:chemical_rate rdf:about="{$base}/chemical_rate/{translate(@chemical_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chemical_rate rdf:resource="{$base}/chemical_rate/{translate(@chemical_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_36_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chemical_rate>
      </BMRBo:has_chemical_rate>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chemical_rate_experimentCategory/BMRBx:chemical_rate_experiment">
      <BMRBo:has_chemical_rate_experiment>
      <BMRBo:chemical_rate_experiment rdf:about="{$base}/chemical_rate_experiment/{translate(@chemical_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chemical_rate_experiment rdf:resource="{$base}/chemical_rate_experiment/{translate(@chemical_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_37_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chemical_rate_experiment>
      </BMRBo:has_chemical_rate_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chemical_rate_listCategory/BMRBx:chemical_rate_list">
      <BMRBo:has_chemical_rate_list>
      <BMRBo:chemical_rate_list rdf:about="{$base}/chemical_rate_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chemical_rate_list rdf:resource="{$base}/chemical_rate_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_38_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chemical_rate_list>
      </BMRBo:has_chemical_rate_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chemical_rate_softwareCategory/BMRBx:chemical_rate_software">
      <BMRBo:has_chemical_rate_software>
      <BMRBo:chemical_rate_software rdf:about="{$base}/chemical_rate_software/{translate(@chemical_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chemical_rate_software rdf:resource="{$base}/chemical_rate_software/{translate(@chemical_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_39_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chemical_rate_software>
      </BMRBo:has_chemical_rate_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chromatographic_columnCategory/BMRBx:chromatographic_column">
      <BMRBo:has_chromatographic_column>
      <BMRBo:chromatographic_column rdf:about="{$base}/chromatographic_column/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chromatographic_column rdf:resource="{$base}/chromatographic_column/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_40_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chromatographic_column>
      </BMRBo:has_chromatographic_column>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:chromatographic_systemCategory/BMRBx:chromatographic_system">
      <BMRBo:has_chromatographic_system>
      <BMRBo:chromatographic_system rdf:about="{$base}/chromatographic_system/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_chromatographic_system rdf:resource="{$base}/chromatographic_system/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_41_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:chromatographic_system>
      </BMRBo:has_chromatographic_system>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:citationCategory/BMRBx:citation">
      <BMRBo:has_citation>
      <BMRBo:citation rdf:about="{$base}/citation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_citation rdf:resource="{$base}/citation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_42_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:citation>
      </BMRBo:has_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:citation_authorCategory/BMRBx:citation_author">
      <BMRBo:has_citation_author>
      <BMRBo:citation_author rdf:about="{$base}/citation_author/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ordinal,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:citation_author>
      </BMRBo:has_citation_author>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:citation_editorCategory/BMRBx:citation_editor">
      <BMRBo:has_citation_editor>
      <BMRBo:citation_editor rdf:about="{$base}/citation_editor/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ordinal,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:citation_editor>
      </BMRBo:has_citation_editor>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:citation_keywordCategory/BMRBx:citation_keyword">
      <BMRBo:has_citation_keyword>
      <BMRBo:citation_keyword rdf:about="{$base}/citation_keyword/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@keyword,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:citation_keyword>
      </BMRBo:has_citation_keyword>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:computerCategory/BMRBx:computer">
      <BMRBo:has_computer>
      <BMRBo:computer rdf:about="{$base}/computer/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_computer rdf:resource="{$base}/computer/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_43_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:computer>
      </BMRBo:has_computer>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:computer_citationCategory/BMRBx:computer_citation">
      <BMRBo:has_computer_citation>
      <BMRBo:computer_citation rdf:about="{$base}/computer_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@computer_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:computer_citation>
      </BMRBo:has_computer_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conf_family_coord_set_constr_listCategory/BMRBx:conf_family_coord_set_constr_list">
      <BMRBo:has_conf_family_coord_set_constr_list>
      <BMRBo:conf_family_coord_set_constr_list rdf:about="{$base}/conf_family_coord_set_constr_list/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@constraint_list_category,' []@#%+&amp;','_()a....')},{translate(@constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conf_family_coord_set_constr_list rdf:resource="{$base}/conf_family_coord_set_constr_list/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@constraint_list_category,' []@#%+&amp;','_()a....')},{translate(@constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_44_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conf_family_coord_set_constr_list>
      </BMRBo:has_conf_family_coord_set_constr_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conf_stats_softwareCategory/BMRBx:conf_stats_software">
      <BMRBo:has_conf_stats_software>
      <BMRBo:conf_stats_software rdf:about="{$base}/conf_stats_software/{translate(@conformer_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conf_stats_software rdf:resource="{$base}/conf_stats_software/{translate(@conformer_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_45_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conf_stats_software>
      </BMRBo:has_conf_stats_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conformer_family_coord_setCategory/BMRBx:conformer_family_coord_set">
      <BMRBo:has_conformer_family_coord_set>
      <BMRBo:conformer_family_coord_set rdf:about="{$base}/conformer_family_coord_set/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conformer_family_coord_set rdf:resource="{$base}/conformer_family_coord_set/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_46_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conformer_family_coord_set>
      </BMRBo:has_conformer_family_coord_set>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conformer_family_coord_set_exptCategory/BMRBx:conformer_family_coord_set_expt">
      <BMRBo:has_conformer_family_coord_set_expt>
      <BMRBo:conformer_family_coord_set_expt rdf:about="{$base}/conformer_family_coord_set_expt/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conformer_family_coord_set_expt rdf:resource="{$base}/conformer_family_coord_set_expt/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_47_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conformer_family_coord_set_expt>
      </BMRBo:has_conformer_family_coord_set_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conformer_family_refinementCategory/BMRBx:conformer_family_refinement">
      <BMRBo:has_conformer_family_refinement>
      <BMRBo:conformer_family_refinement rdf:about="{$base}/conformer_family_refinement/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@refine_method,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conformer_family_refinement rdf:resource="{$base}/conformer_family_refinement/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@refine_method,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_48_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conformer_family_refinement>
      </BMRBo:has_conformer_family_refinement>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conformer_family_softwareCategory/BMRBx:conformer_family_software">
      <BMRBo:has_conformer_family_software>
      <BMRBo:conformer_family_software rdf:about="{$base}/conformer_family_software/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conformer_family_software rdf:resource="{$base}/conformer_family_software/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_49_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conformer_family_software>
      </BMRBo:has_conformer_family_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conformer_stat_listCategory/BMRBx:conformer_stat_list">
      <BMRBo:has_conformer_stat_list>
      <BMRBo:conformer_stat_list rdf:about="{$base}/conformer_stat_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conformer_stat_list rdf:resource="{$base}/conformer_stat_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_50_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conformer_stat_list>
      </BMRBo:has_conformer_stat_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conformer_stat_list_ensCategory/BMRBx:conformer_stat_list_ens">
      <BMRBo:has_conformer_stat_list_ens>
      <BMRBo:conformer_stat_list_ens rdf:about="{$base}/conformer_stat_list_ens/{translate(@conformer_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conformer_stat_list_ens rdf:resource="{$base}/conformer_stat_list_ens/{translate(@conformer_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_51_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conformer_stat_list_ens>
      </BMRBo:has_conformer_stat_list_ens>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:conformer_stat_list_repCategory/BMRBx:conformer_stat_list_rep">
      <BMRBo:has_conformer_stat_list_rep>
      <BMRBo:conformer_stat_list_rep rdf:about="{$base}/conformer_stat_list_rep/{translate(@conformer_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_conformer_stat_list_rep rdf:resource="{$base}/conformer_stat_list_rep/{translate(@conformer_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_52_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:conformer_stat_list_rep>
      </BMRBo:has_conformer_stat_list_rep>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:constraint_fileCategory/BMRBx:constraint_file">
      <BMRBo:has_constraint_file>
      <BMRBo:constraint_file rdf:about="{$base}/constraint_file/{translate(@constraint_filename,' []@#%+&amp;','_()a....')},{translate(@constraint_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@constraint_subtype,' []@#%+&amp;','_()a....')},{translate(@constraint_type,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_constraint_file rdf:resource="{$base}/constraint_file/{translate(@constraint_filename,' []@#%+&amp;','_()a....')},{translate(@constraint_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@constraint_subtype,' []@#%+&amp;','_()a....')},{translate(@constraint_type,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_53_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:constraint_file>
      </BMRBo:has_constraint_file>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:constraint_stat_listCategory/BMRBx:constraint_stat_list">
      <BMRBo:has_constraint_stat_list>
      <BMRBo:constraint_stat_list rdf:about="{$base}/constraint_stat_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_constraint_stat_list rdf:resource="{$base}/constraint_stat_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_54_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:constraint_stat_list>
      </BMRBo:has_constraint_stat_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:constraint_stat_list_ensCategory/BMRBx:constraint_stat_list_ens">
      <BMRBo:has_constraint_stat_list_ens>
      <BMRBo:constraint_stat_list_ens rdf:about="{$base}/constraint_stat_list_ens/{translate(@constraint_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_constraint_stat_list_ens rdf:resource="{$base}/constraint_stat_list_ens/{translate(@constraint_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_55_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:constraint_stat_list_ens>
      </BMRBo:has_constraint_stat_list_ens>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:constraint_stat_list_repCategory/BMRBx:constraint_stat_list_rep">
      <BMRBo:has_constraint_stat_list_rep>
      <BMRBo:constraint_stat_list_rep rdf:about="{$base}/constraint_stat_list_rep/{translate(@constraint_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_constraint_stat_list_rep rdf:resource="{$base}/constraint_stat_list_rep/{translate(@constraint_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_56_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:constraint_stat_list_rep>
      </BMRBo:has_constraint_stat_list_rep>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:constraint_stats_constr_listCategory/BMRBx:constraint_stats_constr_list">
      <BMRBo:has_constraint_stats_constr_list>
      <BMRBo:constraint_stats_constr_list rdf:about="{$base}/constraint_stats_constr_list/{translate(@constraint_list_category,' []@#%+&amp;','_()a....')},{translate(@constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@constraint_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_constraint_stats_constr_list rdf:resource="{$base}/constraint_stats_constr_list/{translate(@constraint_list_category,' []@#%+&amp;','_()a....')},{translate(@constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@constraint_stat_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_57_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:constraint_stats_constr_list>
      </BMRBo:has_constraint_stats_constr_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:coupling_constantCategory/BMRBx:coupling_constant">
      <BMRBo:has_coupling_constant>
      <BMRBo:coupling_constant rdf:about="{$base}/coupling_constant/{translate(@coupling_constant_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:coupling_constant>
      </BMRBo:has_coupling_constant>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:coupling_constant_experimentCategory/BMRBx:coupling_constant_experiment">
      <BMRBo:has_coupling_constant_experiment>
      <BMRBo:coupling_constant_experiment rdf:about="{$base}/coupling_constant_experiment/{translate(@coupling_constant_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:coupling_constant_experiment>
      </BMRBo:has_coupling_constant_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:coupling_constant_listCategory/BMRBx:coupling_constant_list">
      <BMRBo:has_coupling_constant_list>
      <BMRBo:coupling_constant_list rdf:about="{$base}/coupling_constant_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_coupling_constant_list rdf:resource="{$base}/coupling_constant_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_58_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:coupling_constant_list>
      </BMRBo:has_coupling_constant_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:coupling_constant_softwareCategory/BMRBx:coupling_constant_software">
      <BMRBo:has_coupling_constant_software>
      <BMRBo:coupling_constant_software rdf:about="{$base}/coupling_constant_software/{translate(@coupling_constant_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:coupling_constant_software>
      </BMRBo:has_coupling_constant_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cross_correlation_d_csaCategory/BMRBx:cross_correlation_d_csa">
      <BMRBo:has_cross_correlation_d_csa>
      <BMRBo:cross_correlation_d_csa rdf:about="{$base}/cross_correlation_d_csa/{translate(@cross_correlation_d_csa_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_cross_correlation_d_csa rdf:resource="{$base}/cross_correlation_d_csa/{translate(@cross_correlation_d_csa_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_59_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cross_correlation_d_csa>
      </BMRBo:has_cross_correlation_d_csa>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cross_correlation_d_csa_experimentCategory/BMRBx:cross_correlation_d_csa_experiment">
      <BMRBo:has_cross_correlation_d_csa_experiment>
      <BMRBo:cross_correlation_d_csa_experiment rdf:about="{$base}/cross_correlation_d_csa_experiment/{translate(@cross_correlation_d_csa_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_cross_correlation_d_csa_experiment rdf:resource="{$base}/cross_correlation_d_csa_experiment/{translate(@cross_correlation_d_csa_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_60_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cross_correlation_d_csa_experiment>
      </BMRBo:has_cross_correlation_d_csa_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cross_correlation_d_csa_listCategory/BMRBx:cross_correlation_d_csa_list">
      <BMRBo:has_cross_correlation_d_csa_list>
      <BMRBo:cross_correlation_d_csa_list rdf:about="{$base}/cross_correlation_d_csa_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_cross_correlation_d_csa_list rdf:resource="{$base}/cross_correlation_d_csa_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_61_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cross_correlation_d_csa_list>
      </BMRBo:has_cross_correlation_d_csa_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cross_correlation_d_csa_softwareCategory/BMRBx:cross_correlation_d_csa_software">
      <BMRBo:has_cross_correlation_d_csa_software>
      <BMRBo:cross_correlation_d_csa_software rdf:about="{$base}/cross_correlation_d_csa_software/{translate(@cross_correlation_d_csa_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_cross_correlation_d_csa_software rdf:resource="{$base}/cross_correlation_d_csa_software/{translate(@cross_correlation_d_csa_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_62_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cross_correlation_d_csa_software>
      </BMRBo:has_cross_correlation_d_csa_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cross_correlation_ddCategory/BMRBx:cross_correlation_dd">
      <BMRBo:has_cross_correlation_dd>
      <BMRBo:cross_correlation_dd rdf:about="{$base}/cross_correlation_dd/{translate(@cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_cross_correlation_dd rdf:resource="{$base}/cross_correlation_dd/{translate(@cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_63_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cross_correlation_dd>
      </BMRBo:has_cross_correlation_dd>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cross_correlation_dd_experimentCategory/BMRBx:cross_correlation_dd_experiment">
      <BMRBo:has_cross_correlation_dd_experiment>
      <BMRBo:cross_correlation_dd_experiment rdf:about="{$base}/cross_correlation_dd_experiment/{translate(@cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_cross_correlation_dd_experiment rdf:resource="{$base}/cross_correlation_dd_experiment/{translate(@cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_64_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cross_correlation_dd_experiment>
      </BMRBo:has_cross_correlation_dd_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cross_correlation_dd_listCategory/BMRBx:cross_correlation_dd_list">
      <BMRBo:has_cross_correlation_dd_list>
      <BMRBo:cross_correlation_dd_list rdf:about="{$base}/cross_correlation_dd_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_cross_correlation_dd_list rdf:resource="{$base}/cross_correlation_dd_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_65_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cross_correlation_dd_list>
      </BMRBo:has_cross_correlation_dd_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cross_correlation_dd_softwareCategory/BMRBx:cross_correlation_dd_software">
      <BMRBo:has_cross_correlation_dd_software>
      <BMRBo:cross_correlation_dd_software rdf:about="{$base}/cross_correlation_dd_software/{translate(@cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_cross_correlation_dd_software rdf:resource="{$base}/cross_correlation_dd_software/{translate(@cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_66_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cross_correlation_dd_software>
      </BMRBo:has_cross_correlation_dd_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cs_anisotropyCategory/BMRBx:cs_anisotropy">
      <BMRBo:has_cs_anisotropy>
      <BMRBo:cs_anisotropy rdf:about="{$base}/cs_anisotropy/{translate(@chem_shift_anisotropy_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cs_anisotropy>
      </BMRBo:has_cs_anisotropy>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cs_anisotropy_experimentCategory/BMRBx:cs_anisotropy_experiment">
      <BMRBo:has_cs_anisotropy_experiment>
      <BMRBo:cs_anisotropy_experiment rdf:about="{$base}/cs_anisotropy_experiment/{translate(@chem_shift_anisotropy_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cs_anisotropy_experiment>
      </BMRBo:has_cs_anisotropy_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:cs_anisotropy_softwareCategory/BMRBx:cs_anisotropy_software">
      <BMRBo:has_cs_anisotropy_software>
      <BMRBo:cs_anisotropy_software rdf:about="{$base}/cs_anisotropy_software/{translate(@chem_shift_anisotropy_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:cs_anisotropy_software>
      </BMRBo:has_cs_anisotropy_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:d_h_fract_factor_experimentCategory/BMRBx:d_h_fract_factor_experiment">
      <BMRBo:has_d_h_fract_factor_experiment>
      <BMRBo:d_h_fract_factor_experiment rdf:about="{$base}/d_h_fract_factor_experiment/{translate(@d_h_fractionation_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_d_h_fract_factor_experiment rdf:resource="{$base}/d_h_fract_factor_experiment/{translate(@d_h_fractionation_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_67_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:d_h_fract_factor_experiment>
      </BMRBo:has_d_h_fract_factor_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:d_h_fract_factor_softwareCategory/BMRBx:d_h_fract_factor_software">
      <BMRBo:has_d_h_fract_factor_software>
      <BMRBo:d_h_fract_factor_software rdf:about="{$base}/d_h_fract_factor_software/{translate(@d_h_fractionation_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_d_h_fract_factor_software rdf:resource="{$base}/d_h_fract_factor_software/{translate(@d_h_fractionation_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_68_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:d_h_fract_factor_software>
      </BMRBo:has_d_h_fract_factor_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:d_h_fractionation_factorCategory/BMRBx:d_h_fractionation_factor">
      <BMRBo:has_d_h_fractionation_factor>
      <BMRBo:d_h_fractionation_factor rdf:about="{$base}/d_h_fractionation_factor/{translate(@d_h_fractionation_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_d_h_fractionation_factor rdf:resource="{$base}/d_h_fractionation_factor/{translate(@d_h_fractionation_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_69_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:d_h_fractionation_factor>
      </BMRBo:has_d_h_fractionation_factor>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:d_h_fractionation_factor_listCategory/BMRBx:d_h_fractionation_factor_list">
      <BMRBo:has_d_h_fractionation_factor_list>
      <BMRBo:d_h_fractionation_factor_list rdf:about="{$base}/d_h_fractionation_factor_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_d_h_fractionation_factor_list rdf:resource="{$base}/d_h_fractionation_factor_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_70_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:d_h_fractionation_factor_list>
      </BMRBo:has_d_h_fractionation_factor_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:data_setCategory/BMRBx:data_set">
      <BMRBo:has_data_set>
      <BMRBo:data_set rdf:about="{$base}/data_set/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_data_set rdf:resource="{$base}/data_set/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_71_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:data_set>
      </BMRBo:has_data_set>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:datumCategory/BMRBx:datum">
      <BMRBo:has_datum>
      <BMRBo:datum rdf:about="{$base}/datum/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_datum rdf:resource="{$base}/datum/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_72_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:datum>
      </BMRBo:has_datum>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:decoupling_pulse_sequenceCategory/BMRBx:decoupling_pulse_sequence">
      <BMRBo:has_decoupling_pulse_sequence>
      <BMRBo:decoupling_pulse_sequence rdf:about="{$base}/decoupling_pulse_sequence/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@nmr_spec_expt_id,' []@#%+&amp;','_()a....')},{translate(@time_period,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:decoupling_pulse_sequence>
      </BMRBo:has_decoupling_pulse_sequence>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_h_bondCategory/BMRBx:deduced_h_bond">
      <BMRBo:has_deduced_h_bond>
      <BMRBo:deduced_h_bond rdf:about="{$base}/deduced_h_bond/{translate(@deduced_hydrogen_bond_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_h_bond rdf:resource="{$base}/deduced_h_bond/{translate(@deduced_hydrogen_bond_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_73_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_h_bond>
      </BMRBo:has_deduced_h_bond>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_h_bond_experimentCategory/BMRBx:deduced_h_bond_experiment">
      <BMRBo:has_deduced_h_bond_experiment>
      <BMRBo:deduced_h_bond_experiment rdf:about="{$base}/deduced_h_bond_experiment/{translate(@deduced_h_bond_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_h_bond_experiment rdf:resource="{$base}/deduced_h_bond_experiment/{translate(@deduced_h_bond_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_74_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_h_bond_experiment>
      </BMRBo:has_deduced_h_bond_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_h_bond_listCategory/BMRBx:deduced_h_bond_list">
      <BMRBo:has_deduced_h_bond_list>
      <BMRBo:deduced_h_bond_list rdf:about="{$base}/deduced_h_bond_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_h_bond_list rdf:resource="{$base}/deduced_h_bond_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_75_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_h_bond_list>
      </BMRBo:has_deduced_h_bond_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_h_bond_softwareCategory/BMRBx:deduced_h_bond_software">
      <BMRBo:has_deduced_h_bond_software>
      <BMRBo:deduced_h_bond_software rdf:about="{$base}/deduced_h_bond_software/{translate(@deduced_h_bond_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_h_bond_software rdf:resource="{$base}/deduced_h_bond_software/{translate(@deduced_h_bond_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_76_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_h_bond_software>
      </BMRBo:has_deduced_h_bond_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_secd_struct_experimentCategory/BMRBx:deduced_secd_struct_experiment">
      <BMRBo:has_deduced_secd_struct_experiment>
      <BMRBo:deduced_secd_struct_experiment rdf:about="{$base}/deduced_secd_struct_experiment/{translate(@deduced_secd_struct_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_secd_struct_experiment rdf:resource="{$base}/deduced_secd_struct_experiment/{translate(@deduced_secd_struct_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_77_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_secd_struct_experiment>
      </BMRBo:has_deduced_secd_struct_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_secd_struct_exptlCategory/BMRBx:deduced_secd_struct_exptl">
      <BMRBo:has_deduced_secd_struct_exptl>
      <BMRBo:deduced_secd_struct_exptl rdf:about="{$base}/deduced_secd_struct_exptl/{translate(@deduced_secd_struct_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_secd_struct_exptl rdf:resource="{$base}/deduced_secd_struct_exptl/{translate(@deduced_secd_struct_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_78_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_secd_struct_exptl>
      </BMRBo:has_deduced_secd_struct_exptl>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_secd_struct_featureCategory/BMRBx:deduced_secd_struct_feature">
      <BMRBo:has_deduced_secd_struct_feature>
      <BMRBo:deduced_secd_struct_feature rdf:about="{$base}/deduced_secd_struct_feature/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@deduced_secd_struct_list_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_secd_struct_feature rdf:resource="{$base}/deduced_secd_struct_feature/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@deduced_secd_struct_list_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_79_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_secd_struct_feature>
      </BMRBo:has_deduced_secd_struct_feature>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_secd_struct_listCategory/BMRBx:deduced_secd_struct_list">
      <BMRBo:has_deduced_secd_struct_list>
      <BMRBo:deduced_secd_struct_list rdf:about="{$base}/deduced_secd_struct_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_secd_struct_list rdf:resource="{$base}/deduced_secd_struct_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_80_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_secd_struct_list>
      </BMRBo:has_deduced_secd_struct_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:deduced_secd_struct_softwareCategory/BMRBx:deduced_secd_struct_software">
      <BMRBo:has_deduced_secd_struct_software>
      <BMRBo:deduced_secd_struct_software rdf:about="{$base}/deduced_secd_struct_software/{translate(@deduced_secd_struct_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_deduced_secd_struct_software rdf:resource="{$base}/deduced_secd_struct_software/{translate(@deduced_secd_struct_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_81_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:deduced_secd_struct_software>
      </BMRBo:has_deduced_secd_struct_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dipolar_couplingCategory/BMRBx:dipolar_coupling">
      <BMRBo:has_dipolar_coupling>
      <BMRBo:dipolar_coupling rdf:about="{$base}/dipolar_coupling/{translate(@dipolar_coupling_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dipolar_coupling rdf:resource="{$base}/dipolar_coupling/{translate(@dipolar_coupling_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_82_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dipolar_coupling>
      </BMRBo:has_dipolar_coupling>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dipolar_coupling_experimentCategory/BMRBx:dipolar_coupling_experiment">
      <BMRBo:has_dipolar_coupling_experiment>
      <BMRBo:dipolar_coupling_experiment rdf:about="{$base}/dipolar_coupling_experiment/{translate(@dipolar_coupling_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dipolar_coupling_experiment rdf:resource="{$base}/dipolar_coupling_experiment/{translate(@dipolar_coupling_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_83_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dipolar_coupling_experiment>
      </BMRBo:has_dipolar_coupling_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dipolar_coupling_listCategory/BMRBx:dipolar_coupling_list">
      <BMRBo:has_dipolar_coupling_list>
      <BMRBo:dipolar_coupling_list rdf:about="{$base}/dipolar_coupling_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dipolar_coupling_list rdf:resource="{$base}/dipolar_coupling_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_84_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dipolar_coupling_list>
      </BMRBo:has_dipolar_coupling_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dipolar_coupling_softwareCategory/BMRBx:dipolar_coupling_software">
      <BMRBo:has_dipolar_coupling_software>
      <BMRBo:dipolar_coupling_software rdf:about="{$base}/dipolar_coupling_software/{translate(@dipolar_coupling_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dipolar_coupling_software rdf:resource="{$base}/dipolar_coupling_software/{translate(@dipolar_coupling_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_85_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dipolar_coupling_software>
      </BMRBo:has_dipolar_coupling_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dipole_dipole_relaxCategory/BMRBx:dipole_dipole_relax">
      <BMRBo:has_dipole_dipole_relax>
      <BMRBo:dipole_dipole_relax rdf:about="{$base}/dipole_dipole_relax/{translate(@dipole_dipole_relax_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dipole_dipole_relax rdf:resource="{$base}/dipole_dipole_relax/{translate(@dipole_dipole_relax_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_86_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dipole_dipole_relax>
      </BMRBo:has_dipole_dipole_relax>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dipole_dipole_relax_experimentCategory/BMRBx:dipole_dipole_relax_experiment">
      <BMRBo:has_dipole_dipole_relax_experiment>
      <BMRBo:dipole_dipole_relax_experiment rdf:about="{$base}/dipole_dipole_relax_experiment/{translate(@dipole_dipole_relax_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dipole_dipole_relax_experiment rdf:resource="{$base}/dipole_dipole_relax_experiment/{translate(@dipole_dipole_relax_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_87_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dipole_dipole_relax_experiment>
      </BMRBo:has_dipole_dipole_relax_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dipole_dipole_relax_listCategory/BMRBx:dipole_dipole_relax_list">
      <BMRBo:has_dipole_dipole_relax_list>
      <BMRBo:dipole_dipole_relax_list rdf:about="{$base}/dipole_dipole_relax_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dipole_dipole_relax_list rdf:resource="{$base}/dipole_dipole_relax_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_88_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dipole_dipole_relax_list>
      </BMRBo:has_dipole_dipole_relax_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dipole_dipole_relax_softwareCategory/BMRBx:dipole_dipole_relax_software">
      <BMRBo:has_dipole_dipole_relax_software>
      <BMRBo:dipole_dipole_relax_software rdf:about="{$base}/dipole_dipole_relax_software/{translate(@dipole_dipole_relax_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dipole_dipole_relax_software rdf:resource="{$base}/dipole_dipole_relax_software/{translate(@dipole_dipole_relax_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_89_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dipole_dipole_relax_software>
      </BMRBo:has_dipole_dipole_relax_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dist_constr_software_settingCategory/BMRBx:dist_constr_software_setting">
      <BMRBo:has_dist_constr_software_setting>
      <BMRBo:dist_constr_software_setting rdf:about="{$base}/dist_constr_software_setting/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dist_constr_software_setting rdf:resource="{$base}/dist_constr_software_setting/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_90_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dist_constr_software_setting>
      </BMRBo:has_dist_constr_software_setting>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dist_constraintCategory/BMRBx:dist_constraint">
      <BMRBo:has_dist_constraint>
      <BMRBo:dist_constraint rdf:about="{$base}/dist_constraint/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@tree_node_member_constraint_id,' []@#%+&amp;','_()a....')},{translate(@tree_node_member_node_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dist_constraint rdf:resource="{$base}/dist_constraint/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@tree_node_member_constraint_id,' []@#%+&amp;','_()a....')},{translate(@tree_node_member_node_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_91_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dist_constraint>
      </BMRBo:has_dist_constraint>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dist_constraint_comment_orgCategory/BMRBx:dist_constraint_comment_org">
      <BMRBo:has_dist_constraint_comment_org>
      <BMRBo:dist_constraint_comment_org rdf:about="{$base}/dist_constraint_comment_org/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dist_constraint_comment_org rdf:resource="{$base}/dist_constraint_comment_org/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_92_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dist_constraint_comment_org>
      </BMRBo:has_dist_constraint_comment_org>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dist_constraint_conv_errCategory/BMRBx:dist_constraint_conv_err">
      <BMRBo:has_dist_constraint_conv_err>
      <BMRBo:dist_constraint_conv_err rdf:about="{$base}/dist_constraint_conv_err/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dist_constraint_conv_err rdf:resource="{$base}/dist_constraint_conv_err/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_93_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dist_constraint_conv_err>
      </BMRBo:has_dist_constraint_conv_err>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dist_constraint_parse_errCategory/BMRBx:dist_constraint_parse_err">
      <BMRBo:has_dist_constraint_parse_err>
      <BMRBo:dist_constraint_parse_err rdf:about="{$base}/dist_constraint_parse_err/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dist_constraint_parse_err rdf:resource="{$base}/dist_constraint_parse_err/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_94_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dist_constraint_parse_err>
      </BMRBo:has_dist_constraint_parse_err>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dist_constraint_parse_fileCategory/BMRBx:dist_constraint_parse_file">
      <BMRBo:has_dist_constraint_parse_file>
      <BMRBo:dist_constraint_parse_file rdf:about="{$base}/dist_constraint_parse_file/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dist_constraint_parse_file rdf:resource="{$base}/dist_constraint_parse_file/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_95_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dist_constraint_parse_file>
      </BMRBo:has_dist_constraint_parse_file>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dist_constraint_treeCategory/BMRBx:dist_constraint_tree">
      <BMRBo:has_dist_constraint_tree>
      <BMRBo:dist_constraint_tree rdf:about="{$base}/dist_constraint_tree/{translate(@constraint_id,' []@#%+&amp;','_()a....')},{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@node_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dist_constraint_tree rdf:resource="{$base}/dist_constraint_tree/{translate(@constraint_id,' []@#%+&amp;','_()a....')},{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@node_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_96_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dist_constraint_tree>
      </BMRBo:has_dist_constraint_tree>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:dist_constraint_valueCategory/BMRBx:dist_constraint_value">
      <BMRBo:has_dist_constraint_value>
      <BMRBo:dist_constraint_value rdf:about="{$base}/dist_constraint_value/{translate(@constraint_id,' []@#%+&amp;','_()a....')},{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@tree_node_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_dist_constraint_value rdf:resource="{$base}/dist_constraint_value/{translate(@constraint_id,' []@#%+&amp;','_()a....')},{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@tree_node_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_97_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:dist_constraint_value>
      </BMRBo:has_dist_constraint_value>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:distance_constraint_exptCategory/BMRBx:distance_constraint_expt">
      <BMRBo:has_distance_constraint_expt>
      <BMRBo:distance_constraint_expt rdf:about="{$base}/distance_constraint_expt/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_distance_constraint_expt rdf:resource="{$base}/distance_constraint_expt/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_98_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:distance_constraint_expt>
      </BMRBo:has_distance_constraint_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:distance_constraint_listCategory/BMRBx:distance_constraint_list">
      <BMRBo:has_distance_constraint_list>
      <BMRBo:distance_constraint_list rdf:about="{$base}/distance_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_distance_constraint_list rdf:resource="{$base}/distance_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_99_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:distance_constraint_list>
      </BMRBo:has_distance_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:distance_constraint_softwareCategory/BMRBx:distance_constraint_software">
      <BMRBo:has_distance_constraint_software>
      <BMRBo:distance_constraint_software rdf:about="{$base}/distance_constraint_software/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_distance_constraint_software rdf:resource="{$base}/distance_constraint_software/{translate(@distance_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_100_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:distance_constraint_software>
      </BMRBo:has_distance_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:emr_exptCategory/BMRBx:emr_expt">
      <BMRBo:has_emr_expt>
      <BMRBo:emr_expt rdf:about="{$base}/emr_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:emr_expt>
      </BMRBo:has_emr_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:emr_instrumentCategory/BMRBx:emr_instrument">
      <BMRBo:has_emr_instrument>
      <BMRBo:emr_instrument rdf:about="{$base}/emr_instrument/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_emr_instrument rdf:resource="{$base}/emr_instrument/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_101_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:emr_instrument>
      </BMRBo:has_emr_instrument>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:energetic_penalty_functionCategory/BMRBx:energetic_penalty_function">
      <BMRBo:has_energetic_penalty_function>
      <BMRBo:energetic_penalty_function rdf:about="{$base}/energetic_penalty_function/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@function,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_energetic_penalty_function rdf:resource="{$base}/energetic_penalty_function/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@function,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_102_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:energetic_penalty_function>
      </BMRBo:has_energetic_penalty_function>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entityCategory/BMRBx:entity">
      <BMRBo:has_entity>
      <BMRBo:entity rdf:about="{$base}/entity/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_entity rdf:resource="{$base}/entity/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_103_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity>
      </BMRBo:has_entity>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_assemblyCategory/BMRBx:entity_assembly">
      <BMRBo:has_entity_assembly>
      <BMRBo:entity_assembly rdf:about="{$base}/entity_assembly/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_assembly>
      </BMRBo:has_entity_assembly>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_atom_listCategory/BMRBx:entity_atom_list">
      <BMRBo:has_entity_atom_list>
      <BMRBo:entity_atom_list rdf:about="{$base}/entity_atom_list/{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_atom_list>
      </BMRBo:has_entity_atom_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_biological_functionCategory/BMRBx:entity_biological_function">
      <BMRBo:has_entity_biological_function>
      <BMRBo:entity_biological_function rdf:about="{$base}/entity_biological_function/{translate(@biological_function,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_biological_function>
      </BMRBo:has_entity_biological_function>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_bondCategory/BMRBx:entity_bond">
      <BMRBo:has_entity_bond>
      <BMRBo:entity_bond rdf:about="{$base}/entity_bond/{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_bond>
      </BMRBo:has_entity_bond>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_chem_comp_deleted_atomCategory/BMRBx:entity_chem_comp_deleted_atom">
      <BMRBo:has_entity_chem_comp_deleted_atom>
      <BMRBo:entity_chem_comp_deleted_atom rdf:about="{$base}/entity_chem_comp_deleted_atom/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_chem_comp_deleted_atom>
      </BMRBo:has_entity_chem_comp_deleted_atom>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_chimera_segmentCategory/BMRBx:entity_chimera_segment">
      <BMRBo:has_entity_chimera_segment>
      <BMRBo:entity_chimera_segment rdf:about="{$base}/entity_chimera_segment/{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_chimera_segment>
      </BMRBo:has_entity_chimera_segment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_citationCategory/BMRBx:entity_citation">
      <BMRBo:has_entity_citation>
      <BMRBo:entity_citation rdf:about="{$base}/entity_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_citation>
      </BMRBo:has_entity_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_common_nameCategory/BMRBx:entity_common_name">
      <BMRBo:has_entity_common_name>
      <BMRBo:entity_common_name rdf:about="{$base}/entity_common_name/{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_common_name>
      </BMRBo:has_entity_common_name>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_comp_indexCategory/BMRBx:entity_comp_index">
      <BMRBo:has_entity_comp_index>
      <BMRBo:entity_comp_index rdf:about="{$base}/entity_comp_index/{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_comp_index>
      </BMRBo:has_entity_comp_index>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_comp_index_altCategory/BMRBx:entity_comp_index_alt">
      <BMRBo:has_entity_comp_index_alt>
      <BMRBo:entity_comp_index_alt rdf:about="{$base}/entity_comp_index_alt/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entity_comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_comp_index_alt>
      </BMRBo:has_entity_comp_index_alt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_db_linkCategory/BMRBx:entity_db_link">
      <BMRBo:has_entity_db_link>
      <BMRBo:entity_db_link rdf:about="{$base}/entity_db_link/{translate(@accession_code,' []@#%+&amp;','_()a....')},{translate(@database_code,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_db_link>
      </BMRBo:has_entity_db_link>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_deleted_atomCategory/BMRBx:entity_deleted_atom">
      <BMRBo:has_entity_deleted_atom>
      <BMRBo:entity_deleted_atom rdf:about="{$base}/entity_deleted_atom/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_deleted_atom>
      </BMRBo:has_entity_deleted_atom>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_experimental_srcCategory/BMRBx:entity_experimental_src">
      <BMRBo:has_entity_experimental_src>
      <BMRBo:entity_experimental_src rdf:about="{$base}/entity_experimental_src/{translate(@entity_experimental_src_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_experimental_src>
      </BMRBo:has_entity_experimental_src>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_experimental_src_listCategory/BMRBx:entity_experimental_src_list">
      <BMRBo:has_entity_experimental_src_list>
      <BMRBo:entity_experimental_src_list rdf:about="{$base}/entity_experimental_src_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_entity_experimental_src_list rdf:resource="{$base}/entity_experimental_src_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_104_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_experimental_src_list>
      </BMRBo:has_entity_experimental_src_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_keywordCategory/BMRBx:entity_keyword">
      <BMRBo:has_entity_keyword>
      <BMRBo:entity_keyword rdf:about="{$base}/entity_keyword/{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@keyword,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_keyword>
      </BMRBo:has_entity_keyword>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_natural_srcCategory/BMRBx:entity_natural_src">
      <BMRBo:has_entity_natural_src>
      <BMRBo:entity_natural_src rdf:about="{$base}/entity_natural_src/{translate(@entity_natural_src_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_entity_natural_src rdf:resource="{$base}/entity_natural_src/{translate(@entity_natural_src_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_105_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_natural_src>
      </BMRBo:has_entity_natural_src>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_natural_src_listCategory/BMRBx:entity_natural_src_list">
      <BMRBo:has_entity_natural_src_list>
      <BMRBo:entity_natural_src_list rdf:about="{$base}/entity_natural_src_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_entity_natural_src_list rdf:resource="{$base}/entity_natural_src_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_106_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_natural_src_list>
      </BMRBo:has_entity_natural_src_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_poly_seqCategory/BMRBx:entity_poly_seq">
      <BMRBo:has_entity_poly_seq>
      <BMRBo:entity_poly_seq rdf:about="{$base}/entity_poly_seq/{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@num,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_poly_seq>
      </BMRBo:has_entity_poly_seq>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_purityCategory/BMRBx:entity_purity">
      <BMRBo:has_entity_purity>
      <BMRBo:entity_purity rdf:about="{$base}/entity_purity/{translate(@entity_purity_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_purity>
      </BMRBo:has_entity_purity>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_purity_citationCategory/BMRBx:entity_purity_citation">
      <BMRBo:has_entity_purity_citation>
      <BMRBo:entity_purity_citation rdf:about="{$base}/entity_purity_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entity_purity_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_purity_citation>
      </BMRBo:has_entity_purity_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_purity_listCategory/BMRBx:entity_purity_list">
      <BMRBo:has_entity_purity_list>
      <BMRBo:entity_purity_list rdf:about="{$base}/entity_purity_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_entity_purity_list rdf:resource="{$base}/entity_purity_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_107_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_purity_list>
      </BMRBo:has_entity_purity_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entity_systematic_nameCategory/BMRBx:entity_systematic_name">
      <BMRBo:has_entity_systematic_name>
      <BMRBo:entity_systematic_name rdf:about="{$base}/entity_systematic_name/{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@naming_system,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entity_systematic_name>
      </BMRBo:has_entity_systematic_name>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entryCategory/BMRBx:entry">
      <BMRBo:has_entry>
      <BMRBo:entry rdf:about="{$base}/entry/{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entry>
      </BMRBo:has_entry>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entry_authorCategory/BMRBx:entry_author">
      <BMRBo:has_entry_author>
      <BMRBo:entry_author rdf:about="{$base}/entry_author/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ordinal,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_entry_author rdf:resource="{$base}/entry_author/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ordinal,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_108_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entry_author>
      </BMRBo:has_entry_author>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entry_experimental_methodsCategory/BMRBx:entry_experimental_methods">
      <BMRBo:has_entry_experimental_methods>
      <BMRBo:entry_experimental_methods rdf:about="{$base}/entry_experimental_methods/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_entry_experimental_methods rdf:resource="{$base}/entry_experimental_methods/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_109_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entry_experimental_methods>
      </BMRBo:has_entry_experimental_methods>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:entry_srcCategory/BMRBx:entry_src">
      <BMRBo:has_entry_src>
      <BMRBo:entry_src rdf:about="{$base}/entry_src/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_entry_src rdf:resource="{$base}/entry_src/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_110_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:entry_src>
      </BMRBo:has_entry_src>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:experimentCategory/BMRBx:experiment">
      <BMRBo:has_experiment>
      <BMRBo:experiment rdf:about="{$base}/experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:experiment>
      </BMRBo:has_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:experiment_fileCategory/BMRBx:experiment_file">
      <BMRBo:has_experiment_file>
      <BMRBo:experiment_file rdf:about="{$base}/experiment_file/{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:experiment_file>
      </BMRBo:has_experiment_file>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:experiment_listCategory/BMRBx:experiment_list">
      <BMRBo:has_experiment_list>
      <BMRBo:experiment_list rdf:about="{$base}/experiment_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_experiment_list rdf:resource="{$base}/experiment_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_111_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:experiment_list>
      </BMRBo:has_experiment_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:floating_chiralityCategory/BMRBx:floating_chirality">
      <BMRBo:has_floating_chirality>
      <BMRBo:floating_chirality rdf:about="{$base}/floating_chirality/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@floating_chirality_assign_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_floating_chirality rdf:resource="{$base}/floating_chirality/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@floating_chirality_assign_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_112_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:floating_chirality>
      </BMRBo:has_floating_chirality>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:floating_chirality_assignCategory/BMRBx:floating_chirality_assign">
      <BMRBo:has_floating_chirality_assign>
      <BMRBo:floating_chirality_assign rdf:about="{$base}/floating_chirality_assign/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_floating_chirality_assign rdf:resource="{$base}/floating_chirality_assign/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_113_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:floating_chirality_assign>
      </BMRBo:has_floating_chirality_assign>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:floating_chirality_softwareCategory/BMRBx:floating_chirality_software">
      <BMRBo:has_floating_chirality_software>
      <BMRBo:floating_chirality_software rdf:about="{$base}/floating_chirality_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@floating_chirality_assign_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_floating_chirality_software rdf:resource="{$base}/floating_chirality_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@floating_chirality_assign_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_114_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:floating_chirality_software>
      </BMRBo:has_floating_chirality_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:fluorescence_instrumentCategory/BMRBx:fluorescence_instrument">
      <BMRBo:has_fluorescence_instrument>
      <BMRBo:fluorescence_instrument rdf:about="{$base}/fluorescence_instrument/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_fluorescence_instrument rdf:resource="{$base}/fluorescence_instrument/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_115_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:fluorescence_instrument>
      </BMRBo:has_fluorescence_instrument>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:force_constantCategory/BMRBx:force_constant">
      <BMRBo:has_force_constant>
      <BMRBo:force_constant rdf:about="{$base}/force_constant/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@force_constant_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_force_constant rdf:resource="{$base}/force_constant/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@force_constant_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_116_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:force_constant>
      </BMRBo:has_force_constant>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:force_constant_listCategory/BMRBx:force_constant_list">
      <BMRBo:has_force_constant_list>
      <BMRBo:force_constant_list rdf:about="{$base}/force_constant_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_force_constant_list rdf:resource="{$base}/force_constant_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_117_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:force_constant_list>
      </BMRBo:has_force_constant_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:force_constant_softwareCategory/BMRBx:force_constant_software">
      <BMRBo:has_force_constant_software>
      <BMRBo:force_constant_software rdf:about="{$base}/force_constant_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@force_constant_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_force_constant_software rdf:resource="{$base}/force_constant_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@force_constant_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_118_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:force_constant_software>
      </BMRBo:has_force_constant_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:fret_exptCategory/BMRBx:fret_expt">
      <BMRBo:has_fret_expt>
      <BMRBo:fret_expt rdf:about="{$base}/fret_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:fret_expt>
      </BMRBo:has_fret_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraintCategory/BMRBx:gen_dist_constraint">
      <BMRBo:has_gen_dist_constraint>
      <BMRBo:gen_dist_constraint rdf:about="{$base}/gen_dist_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@index_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint rdf:resource="{$base}/gen_dist_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@index_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_119_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint>
      </BMRBo:has_gen_dist_constraint>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraint_comment_orgCategory/BMRBx:gen_dist_constraint_comment_org">
      <BMRBo:has_gen_dist_constraint_comment_org>
      <BMRBo:gen_dist_constraint_comment_org rdf:about="{$base}/gen_dist_constraint_comment_org/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint_comment_org rdf:resource="{$base}/gen_dist_constraint_comment_org/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_120_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint_comment_org>
      </BMRBo:has_gen_dist_constraint_comment_org>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraint_conv_errCategory/BMRBx:gen_dist_constraint_conv_err">
      <BMRBo:has_gen_dist_constraint_conv_err>
      <BMRBo:gen_dist_constraint_conv_err rdf:about="{$base}/gen_dist_constraint_conv_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint_conv_err rdf:resource="{$base}/gen_dist_constraint_conv_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_121_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint_conv_err>
      </BMRBo:has_gen_dist_constraint_conv_err>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraint_exptCategory/BMRBx:gen_dist_constraint_expt">
      <BMRBo:has_gen_dist_constraint_expt>
      <BMRBo:gen_dist_constraint_expt rdf:about="{$base}/gen_dist_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint_expt rdf:resource="{$base}/gen_dist_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_122_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint_expt>
      </BMRBo:has_gen_dist_constraint_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraint_listCategory/BMRBx:gen_dist_constraint_list">
      <BMRBo:has_gen_dist_constraint_list>
      <BMRBo:gen_dist_constraint_list rdf:about="{$base}/gen_dist_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint_list rdf:resource="{$base}/gen_dist_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_123_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint_list>
      </BMRBo:has_gen_dist_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraint_parse_errCategory/BMRBx:gen_dist_constraint_parse_err">
      <BMRBo:has_gen_dist_constraint_parse_err>
      <BMRBo:gen_dist_constraint_parse_err rdf:about="{$base}/gen_dist_constraint_parse_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint_parse_err rdf:resource="{$base}/gen_dist_constraint_parse_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_124_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint_parse_err>
      </BMRBo:has_gen_dist_constraint_parse_err>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraint_parse_fileCategory/BMRBx:gen_dist_constraint_parse_file">
      <BMRBo:has_gen_dist_constraint_parse_file>
      <BMRBo:gen_dist_constraint_parse_file rdf:about="{$base}/gen_dist_constraint_parse_file/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint_parse_file rdf:resource="{$base}/gen_dist_constraint_parse_file/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_125_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint_parse_file>
      </BMRBo:has_gen_dist_constraint_parse_file>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraint_softwareCategory/BMRBx:gen_dist_constraint_software">
      <BMRBo:has_gen_dist_constraint_software>
      <BMRBo:gen_dist_constraint_software rdf:about="{$base}/gen_dist_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint_software rdf:resource="{$base}/gen_dist_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_126_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint_software>
      </BMRBo:has_gen_dist_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:gen_dist_constraint_software_paramCategory/BMRBx:gen_dist_constraint_software_param">
      <BMRBo:has_gen_dist_constraint_software_param>
      <BMRBo:gen_dist_constraint_software_param rdf:about="{$base}/gen_dist_constraint_software_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_gen_dist_constraint_software_param rdf:resource="{$base}/gen_dist_constraint_software_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@gen_dist_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_127_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:gen_dist_constraint_software_param>
      </BMRBo:has_gen_dist_constraint_software_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_chem_shift_constraintCategory/BMRBx:h_chem_shift_constraint">
      <BMRBo:has_h_chem_shift_constraint>
      <BMRBo:h_chem_shift_constraint rdf:about="{$base}/h_chem_shift_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_chem_shift_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_chem_shift_constraint rdf:resource="{$base}/h_chem_shift_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_chem_shift_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_128_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_chem_shift_constraint>
      </BMRBo:has_h_chem_shift_constraint>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_chem_shift_constraint_exptCategory/BMRBx:h_chem_shift_constraint_expt">
      <BMRBo:has_h_chem_shift_constraint_expt>
      <BMRBo:h_chem_shift_constraint_expt rdf:about="{$base}/h_chem_shift_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@h_chem_shift_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_chem_shift_constraint_expt rdf:resource="{$base}/h_chem_shift_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@h_chem_shift_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_129_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_chem_shift_constraint_expt>
      </BMRBo:has_h_chem_shift_constraint_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_chem_shift_constraint_listCategory/BMRBx:h_chem_shift_constraint_list">
      <BMRBo:has_h_chem_shift_constraint_list>
      <BMRBo:h_chem_shift_constraint_list rdf:about="{$base}/h_chem_shift_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_chem_shift_constraint_list rdf:resource="{$base}/h_chem_shift_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_130_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_chem_shift_constraint_list>
      </BMRBo:has_h_chem_shift_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_chem_shift_constraint_softwareCategory/BMRBx:h_chem_shift_constraint_software">
      <BMRBo:has_h_chem_shift_constraint_software>
      <BMRBo:h_chem_shift_constraint_software rdf:about="{$base}/h_chem_shift_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_chem_shift_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_chem_shift_constraint_software rdf:resource="{$base}/h_chem_shift_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_chem_shift_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_131_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_chem_shift_constraint_software>
      </BMRBo:has_h_chem_shift_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_exch_protection_fact_experimentCategory/BMRBx:h_exch_protection_fact_experiment">
      <BMRBo:has_h_exch_protection_fact_experiment>
      <BMRBo:h_exch_protection_fact_experiment rdf:about="{$base}/h_exch_protection_fact_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_protection_factor_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_exch_protection_fact_experiment rdf:resource="{$base}/h_exch_protection_fact_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_protection_factor_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_132_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_exch_protection_fact_experiment>
      </BMRBo:has_h_exch_protection_fact_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_exch_protection_fact_softwareCategory/BMRBx:h_exch_protection_fact_software">
      <BMRBo:has_h_exch_protection_fact_software>
      <BMRBo:h_exch_protection_fact_software rdf:about="{$base}/h_exch_protection_fact_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_protection_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_exch_protection_fact_software rdf:resource="{$base}/h_exch_protection_fact_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_protection_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_133_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_exch_protection_fact_software>
      </BMRBo:has_h_exch_protection_fact_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_exch_protection_factorCategory/BMRBx:h_exch_protection_factor">
      <BMRBo:has_h_exch_protection_factor>
      <BMRBo:h_exch_protection_factor rdf:about="{$base}/h_exch_protection_factor/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_protection_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_exch_protection_factor rdf:resource="{$base}/h_exch_protection_factor/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_protection_factor_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_134_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_exch_protection_factor>
      </BMRBo:has_h_exch_protection_factor>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_exch_protection_factor_listCategory/BMRBx:h_exch_protection_factor_list">
      <BMRBo:has_h_exch_protection_factor_list>
      <BMRBo:h_exch_protection_factor_list rdf:about="{$base}/h_exch_protection_factor_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_exch_protection_factor_list rdf:resource="{$base}/h_exch_protection_factor_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_135_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_exch_protection_factor_list>
      </BMRBo:has_h_exch_protection_factor_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_exch_rateCategory/BMRBx:h_exch_rate">
      <BMRBo:has_h_exch_rate>
      <BMRBo:h_exch_rate rdf:about="{$base}/h_exch_rate/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_exch_rate rdf:resource="{$base}/h_exch_rate/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_136_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_exch_rate>
      </BMRBo:has_h_exch_rate>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_exch_rate_experimentCategory/BMRBx:h_exch_rate_experiment">
      <BMRBo:has_h_exch_rate_experiment>
      <BMRBo:h_exch_rate_experiment rdf:about="{$base}/h_exch_rate_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_rate_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_exch_rate_experiment rdf:resource="{$base}/h_exch_rate_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_rate_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_137_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_exch_rate_experiment>
      </BMRBo:has_h_exch_rate_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_exch_rate_listCategory/BMRBx:h_exch_rate_list">
      <BMRBo:has_h_exch_rate_list>
      <BMRBo:h_exch_rate_list rdf:about="{$base}/h_exch_rate_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_exch_rate_list rdf:resource="{$base}/h_exch_rate_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_138_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_exch_rate_list>
      </BMRBo:has_h_exch_rate_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:h_exch_rate_softwareCategory/BMRBx:h_exch_rate_software">
      <BMRBo:has_h_exch_rate_software>
      <BMRBo:h_exch_rate_software rdf:about="{$base}/h_exch_rate_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_h_exch_rate_software rdf:resource="{$base}/h_exch_rate_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@h_exch_rate_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_139_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:h_exch_rate_software>
      </BMRBo:has_h_exch_rate_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_noeCategory/BMRBx:heteronucl_noe">
      <BMRBo:has_heteronucl_noe>
      <BMRBo:heteronucl_noe rdf:about="{$base}/heteronucl_noe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_noe_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_noe rdf:resource="{$base}/heteronucl_noe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_noe_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_140_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_noe>
      </BMRBo:has_heteronucl_noe>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_noe_experimentCategory/BMRBx:heteronucl_noe_experiment">
      <BMRBo:has_heteronucl_noe_experiment>
      <BMRBo:heteronucl_noe_experiment rdf:about="{$base}/heteronucl_noe_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_noe_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_noe_experiment rdf:resource="{$base}/heteronucl_noe_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_noe_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_141_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_noe_experiment>
      </BMRBo:has_heteronucl_noe_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_noe_listCategory/BMRBx:heteronucl_noe_list">
      <BMRBo:has_heteronucl_noe_list>
      <BMRBo:heteronucl_noe_list rdf:about="{$base}/heteronucl_noe_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_noe_list rdf:resource="{$base}/heteronucl_noe_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_142_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_noe_list>
      </BMRBo:has_heteronucl_noe_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_noe_softwareCategory/BMRBx:heteronucl_noe_software">
      <BMRBo:has_heteronucl_noe_software>
      <BMRBo:heteronucl_noe_software rdf:about="{$base}/heteronucl_noe_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_noe_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_noe_software rdf:resource="{$base}/heteronucl_noe_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_noe_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_143_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_noe_software>
      </BMRBo:has_heteronucl_noe_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t1_experimentCategory/BMRBx:heteronucl_t1_experiment">
      <BMRBo:has_heteronucl_t1_experiment>
      <BMRBo:heteronucl_t1_experiment rdf:about="{$base}/heteronucl_t1_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t1_experiment rdf:resource="{$base}/heteronucl_t1_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_144_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t1_experiment>
      </BMRBo:has_heteronucl_t1_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t1_listCategory/BMRBx:heteronucl_t1_list">
      <BMRBo:has_heteronucl_t1_list>
      <BMRBo:heteronucl_t1_list rdf:about="{$base}/heteronucl_t1_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t1_list rdf:resource="{$base}/heteronucl_t1_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_145_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t1_list>
      </BMRBo:has_heteronucl_t1_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t1_softwareCategory/BMRBx:heteronucl_t1_software">
      <BMRBo:has_heteronucl_t1_software>
      <BMRBo:heteronucl_t1_software rdf:about="{$base}/heteronucl_t1_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t1_software rdf:resource="{$base}/heteronucl_t1_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_146_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t1_software>
      </BMRBo:has_heteronucl_t1_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t1rho_experimentCategory/BMRBx:heteronucl_t1rho_experiment">
      <BMRBo:has_heteronucl_t1rho_experiment>
      <BMRBo:heteronucl_t1rho_experiment rdf:about="{$base}/heteronucl_t1rho_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1rho_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t1rho_experiment rdf:resource="{$base}/heteronucl_t1rho_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1rho_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_147_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t1rho_experiment>
      </BMRBo:has_heteronucl_t1rho_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t1rho_listCategory/BMRBx:heteronucl_t1rho_list">
      <BMRBo:has_heteronucl_t1rho_list>
      <BMRBo:heteronucl_t1rho_list rdf:about="{$base}/heteronucl_t1rho_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t1rho_list rdf:resource="{$base}/heteronucl_t1rho_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_148_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t1rho_list>
      </BMRBo:has_heteronucl_t1rho_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t1rho_softwareCategory/BMRBx:heteronucl_t1rho_software">
      <BMRBo:has_heteronucl_t1rho_software>
      <BMRBo:heteronucl_t1rho_software rdf:about="{$base}/heteronucl_t1rho_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1rho_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t1rho_software rdf:resource="{$base}/heteronucl_t1rho_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1rho_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_149_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t1rho_software>
      </BMRBo:has_heteronucl_t1rho_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t2_experimentCategory/BMRBx:heteronucl_t2_experiment">
      <BMRBo:has_heteronucl_t2_experiment>
      <BMRBo:heteronucl_t2_experiment rdf:about="{$base}/heteronucl_t2_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t2_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t2_experiment rdf:resource="{$base}/heteronucl_t2_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t2_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_150_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t2_experiment>
      </BMRBo:has_heteronucl_t2_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t2_listCategory/BMRBx:heteronucl_t2_list">
      <BMRBo:has_heteronucl_t2_list>
      <BMRBo:heteronucl_t2_list rdf:about="{$base}/heteronucl_t2_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t2_list rdf:resource="{$base}/heteronucl_t2_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_151_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t2_list>
      </BMRBo:has_heteronucl_t2_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:heteronucl_t2_softwareCategory/BMRBx:heteronucl_t2_software">
      <BMRBo:has_heteronucl_t2_software>
      <BMRBo:heteronucl_t2_software rdf:about="{$base}/heteronucl_t2_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t2_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_heteronucl_t2_software rdf:resource="{$base}/heteronucl_t2_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t2_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_152_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:heteronucl_t2_software>
      </BMRBo:has_heteronucl_t2_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:historyCategory/BMRBx:history">
      <BMRBo:has_history>
      <BMRBo:history rdf:about="{$base}/history/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@run_number,' []@#%+&amp;','_()a....')},{translate(@software_applied_history_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_history rdf:resource="{$base}/history/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@run_number,' []@#%+&amp;','_()a....')},{translate(@software_applied_history_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_153_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:history>
      </BMRBo:has_history>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:homonucl_noeCategory/BMRBx:homonucl_noe">
      <BMRBo:has_homonucl_noe>
      <BMRBo:homonucl_noe rdf:about="{$base}/homonucl_noe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@homonucl_noe_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_homonucl_noe rdf:resource="{$base}/homonucl_noe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@homonucl_noe_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_154_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:homonucl_noe>
      </BMRBo:has_homonucl_noe>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:homonucl_noe_experimentCategory/BMRBx:homonucl_noe_experiment">
      <BMRBo:has_homonucl_noe_experiment>
      <BMRBo:homonucl_noe_experiment rdf:about="{$base}/homonucl_noe_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@homonucl_noe_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_homonucl_noe_experiment rdf:resource="{$base}/homonucl_noe_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@homonucl_noe_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_155_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:homonucl_noe_experiment>
      </BMRBo:has_homonucl_noe_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:homonucl_noe_listCategory/BMRBx:homonucl_noe_list">
      <BMRBo:has_homonucl_noe_list>
      <BMRBo:homonucl_noe_list rdf:about="{$base}/homonucl_noe_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_homonucl_noe_list rdf:resource="{$base}/homonucl_noe_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_156_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:homonucl_noe_list>
      </BMRBo:has_homonucl_noe_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:homonucl_noe_softwareCategory/BMRBx:homonucl_noe_software">
      <BMRBo:has_homonucl_noe_software>
      <BMRBo:homonucl_noe_software rdf:about="{$base}/homonucl_noe_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@homonucl_noe_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_homonucl_noe_software rdf:resource="{$base}/homonucl_noe_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@homonucl_noe_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_157_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:homonucl_noe_software>
      </BMRBo:has_homonucl_noe_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:interatomic_distCategory/BMRBx:interatomic_dist">
      <BMRBo:has_interatomic_dist>
      <BMRBo:interatomic_dist rdf:about="{$base}/interatomic_dist/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@interatomic_distance_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_interatomic_dist rdf:resource="{$base}/interatomic_dist/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@interatomic_distance_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_158_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:interatomic_dist>
      </BMRBo:has_interatomic_dist>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:interatomic_distance_listCategory/BMRBx:interatomic_distance_list">
      <BMRBo:has_interatomic_distance_list>
      <BMRBo:interatomic_distance_list rdf:about="{$base}/interatomic_distance_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_interatomic_distance_list rdf:resource="{$base}/interatomic_distance_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_159_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:interatomic_distance_list>
      </BMRBo:has_interatomic_distance_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:isotope_effectCategory/BMRBx:isotope_effect">
      <BMRBo:has_isotope_effect>
      <BMRBo:isotope_effect rdf:about="{$base}/isotope_effect/{translate(@chem_shift_isotope_effect_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:isotope_effect>
      </BMRBo:has_isotope_effect>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:isotope_effect_experimentCategory/BMRBx:isotope_effect_experiment">
      <BMRBo:has_isotope_effect_experiment>
      <BMRBo:isotope_effect_experiment rdf:about="{$base}/isotope_effect_experiment/{translate(@chem_shift_isotope_effect_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:isotope_effect_experiment>
      </BMRBo:has_isotope_effect_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:isotope_effect_softwareCategory/BMRBx:isotope_effect_software">
      <BMRBo:has_isotope_effect_software>
      <BMRBo:isotope_effect_software rdf:about="{$base}/isotope_effect_software/{translate(@chem_shift_isotope_effect_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:isotope_effect_software>
      </BMRBo:has_isotope_effect_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:isotope_label_patternCategory/BMRBx:isotope_label_pattern">
      <BMRBo:has_isotope_label_pattern>
      <BMRBo:isotope_label_pattern rdf:about="{$base}/isotope_label_pattern/{translate(@chem_shift_isotope_effect_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:isotope_label_pattern>
      </BMRBo:has_isotope_label_pattern>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:j_three_bond_constraintCategory/BMRBx:j_three_bond_constraint">
      <BMRBo:has_j_three_bond_constraint>
      <BMRBo:j_three_bond_constraint rdf:about="{$base}/j_three_bond_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@j_three_bond_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_j_three_bond_constraint rdf:resource="{$base}/j_three_bond_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@j_three_bond_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_160_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:j_three_bond_constraint>
      </BMRBo:has_j_three_bond_constraint>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:j_three_bond_constraint_exptCategory/BMRBx:j_three_bond_constraint_expt">
      <BMRBo:has_j_three_bond_constraint_expt>
      <BMRBo:j_three_bond_constraint_expt rdf:about="{$base}/j_three_bond_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@j_three_bond_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_j_three_bond_constraint_expt rdf:resource="{$base}/j_three_bond_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@j_three_bond_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_161_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:j_three_bond_constraint_expt>
      </BMRBo:has_j_three_bond_constraint_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:j_three_bond_constraint_listCategory/BMRBx:j_three_bond_constraint_list">
      <BMRBo:has_j_three_bond_constraint_list>
      <BMRBo:j_three_bond_constraint_list rdf:about="{$base}/j_three_bond_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_j_three_bond_constraint_list rdf:resource="{$base}/j_three_bond_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_162_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:j_three_bond_constraint_list>
      </BMRBo:has_j_three_bond_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:j_three_bond_constraint_softwareCategory/BMRBx:j_three_bond_constraint_software">
      <BMRBo:has_j_three_bond_constraint_software>
      <BMRBo:j_three_bond_constraint_software rdf:about="{$base}/j_three_bond_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@j_three_bond_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_j_three_bond_constraint_software rdf:resource="{$base}/j_three_bond_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@j_three_bond_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_163_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:j_three_bond_constraint_software>
      </BMRBo:has_j_three_bond_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:karplus_equationCategory/BMRBx:karplus_equation">
      <BMRBo:has_karplus_equation>
      <BMRBo:karplus_equation rdf:about="{$base}/karplus_equation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_code,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_karplus_equation rdf:resource="{$base}/karplus_equation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_code,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_164_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:karplus_equation>
      </BMRBo:has_karplus_equation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:lacs_charCategory/BMRBx:lacs_char">
      <BMRBo:has_lacs_char>
      <BMRBo:lacs_char rdf:about="{$base}/lacs_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@lacs_plot_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_lacs_char rdf:resource="{$base}/lacs_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@lacs_plot_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_165_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:lacs_char>
      </BMRBo:has_lacs_char>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:lacs_plotCategory/BMRBx:lacs_plot">
      <BMRBo:has_lacs_plot>
      <BMRBo:lacs_plot rdf:about="{$base}/lacs_plot/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_lacs_plot rdf:resource="{$base}/lacs_plot/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_166_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:lacs_plot>
      </BMRBo:has_lacs_plot>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:local_structure_qualityCategory/BMRBx:local_structure_quality">
      <BMRBo:has_local_structure_quality>
      <BMRBo:local_structure_quality rdf:about="{$base}/local_structure_quality/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_local_structure_quality rdf:resource="{$base}/local_structure_quality/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_167_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:local_structure_quality>
      </BMRBo:has_local_structure_quality>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_specCategory/BMRBx:mass_spec">
      <BMRBo:has_mass_spec>
      <BMRBo:mass_spec rdf:about="{$base}/mass_spec/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mass_spec rdf:resource="{$base}/mass_spec/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_168_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spec>
      </BMRBo:has_mass_spec>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_spec_citationCategory/BMRBx:mass_spec_citation">
      <BMRBo:has_mass_spec_citation>
      <BMRBo:mass_spec_citation rdf:about="{$base}/mass_spec_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@mass_spec_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spec_citation>
      </BMRBo:has_mass_spec_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_spec_component_paramCategory/BMRBx:mass_spec_component_param">
      <BMRBo:has_mass_spec_component_param>
      <BMRBo:mass_spec_component_param rdf:about="{$base}/mass_spec_component_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mass_spec_config_id,' []@#%+&amp;','_()a....')},{translate(@mass_spec_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spec_component_param>
      </BMRBo:has_mass_spec_component_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_spec_configCategory/BMRBx:mass_spec_config">
      <BMRBo:has_mass_spec_config>
      <BMRBo:mass_spec_config rdf:about="{$base}/mass_spec_config/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mass_spec_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spec_config>
      </BMRBo:has_mass_spec_config>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_spec_ref_compdCategory/BMRBx:mass_spec_ref_compd">
      <BMRBo:has_mass_spec_ref_compd>
      <BMRBo:mass_spec_ref_compd rdf:about="{$base}/mass_spec_ref_compd/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mass_spec_ref_compd_set_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spec_ref_compd>
      </BMRBo:has_mass_spec_ref_compd>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_spec_ref_compd_setCategory/BMRBx:mass_spec_ref_compd_set">
      <BMRBo:has_mass_spec_ref_compd_set>
      <BMRBo:mass_spec_ref_compd_set rdf:about="{$base}/mass_spec_ref_compd_set/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mass_spec_ref_compd_set rdf:resource="{$base}/mass_spec_ref_compd_set/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_169_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spec_ref_compd_set>
      </BMRBo:has_mass_spec_ref_compd_set>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_spec_softwareCategory/BMRBx:mass_spec_software">
      <BMRBo:has_mass_spec_software>
      <BMRBo:mass_spec_software rdf:about="{$base}/mass_spec_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@mass_spec_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spec_software>
      </BMRBo:has_mass_spec_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_spectrometer_listCategory/BMRBx:mass_spectrometer_list">
      <BMRBo:has_mass_spectrometer_list>
      <BMRBo:mass_spectrometer_list rdf:about="{$base}/mass_spectrometer_list/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mass_spectrometer_list rdf:resource="{$base}/mass_spectrometer_list/{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_170_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spectrometer_list>
      </BMRBo:has_mass_spectrometer_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mass_spectrometer_viewCategory/BMRBx:mass_spectrometer_view">
      <BMRBo:has_mass_spectrometer_view>
      <BMRBo:mass_spectrometer_view rdf:about="{$base}/mass_spectrometer_view/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mass_spectrometer_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mass_spectrometer_view>
      </BMRBo:has_mass_spectrometer_view>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:matched_entriesCategory/BMRBx:matched_entries">
      <BMRBo:has_matched_entries>
      <BMRBo:matched_entries rdf:about="{$base}/matched_entries/{translate(@database_accession_code,' []@#%+&amp;','_()a....')},{translate(@database_name,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_matched_entries rdf:resource="{$base}/matched_entries/{translate(@database_accession_code,' []@#%+&amp;','_()a....')},{translate(@database_name,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_171_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:matched_entries>
      </BMRBo:has_matched_entries>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:methodCategory/BMRBx:method">
      <BMRBo:has_method>
      <BMRBo:method rdf:about="{$base}/method/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_method rdf:resource="{$base}/method/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_172_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:method>
      </BMRBo:has_method>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:method_citationCategory/BMRBx:method_citation">
      <BMRBo:has_method_citation>
      <BMRBo:method_citation rdf:about="{$base}/method_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@method_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:method_citation>
      </BMRBo:has_method_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:method_fileCategory/BMRBx:method_file">
      <BMRBo:has_method_file>
      <BMRBo:method_file rdf:about="{$base}/method_file/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@method_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:method_file>
      </BMRBo:has_method_file>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:method_paramCategory/BMRBx:method_param">
      <BMRBo:has_method_param>
      <BMRBo:method_param rdf:about="{$base}/method_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@file_name,' []@#%+&amp;','_()a....')},{translate(@method_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:method_param>
      </BMRBo:has_method_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:model_typeCategory/BMRBx:model_type">
      <BMRBo:has_model_type>
      <BMRBo:model_type rdf:about="{$base}/model_type/{translate(@atom_site_model_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="BMRBx:entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(BMRBx:entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_model_type rdf:resource="{$base}/model_type/{translate(@atom_site_model_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_173_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:model_type>
      </BMRBo:has_model_type>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_chrom_ion_annotationCategory/BMRBx:ms_chrom_ion_annotation">
      <BMRBo:has_ms_chrom_ion_annotation>
      <BMRBo:ms_chrom_ion_annotation rdf:about="{$base}/ms_chrom_ion_annotation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_chrom_ion_annotation rdf:resource="{$base}/ms_chrom_ion_annotation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_174_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_chrom_ion_annotation>
      </BMRBo:has_ms_chrom_ion_annotation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_chromatogram_experimentCategory/BMRBx:ms_chromatogram_experiment">
      <BMRBo:has_ms_chromatogram_experiment>
      <BMRBo:ms_chromatogram_experiment rdf:about="{$base}/ms_chromatogram_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_chromatogram_experiment rdf:resource="{$base}/ms_chromatogram_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_175_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_chromatogram_experiment>
      </BMRBo:has_ms_chromatogram_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_chromatogram_ionCategory/BMRBx:ms_chromatogram_ion">
      <BMRBo:has_ms_chromatogram_ion>
      <BMRBo:ms_chromatogram_ion rdf:about="{$base}/ms_chromatogram_ion/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_chromatogram_ion rdf:resource="{$base}/ms_chromatogram_ion/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_176_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_chromatogram_ion>
      </BMRBo:has_ms_chromatogram_ion>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_chromatogram_listCategory/BMRBx:ms_chromatogram_list">
      <BMRBo:has_ms_chromatogram_list>
      <BMRBo:ms_chromatogram_list rdf:about="{$base}/ms_chromatogram_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_chromatogram_list rdf:resource="{$base}/ms_chromatogram_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_177_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_chromatogram_list>
      </BMRBo:has_ms_chromatogram_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_chromatogram_paramCategory/BMRBx:ms_chromatogram_param">
      <BMRBo:has_ms_chromatogram_param>
      <BMRBo:ms_chromatogram_param rdf:about="{$base}/ms_chromatogram_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_chromatogram_param rdf:resource="{$base}/ms_chromatogram_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_178_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_chromatogram_param>
      </BMRBo:has_ms_chromatogram_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_chromatogram_softwareCategory/BMRBx:ms_chromatogram_software">
      <BMRBo:has_ms_chromatogram_software>
      <BMRBo:ms_chromatogram_software rdf:about="{$base}/ms_chromatogram_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_chromatogram_software rdf:resource="{$base}/ms_chromatogram_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ms_chromatogram_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_179_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_chromatogram_software>
      </BMRBo:has_ms_chromatogram_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_exptCategory/BMRBx:ms_expt">
      <BMRBo:has_ms_expt>
      <BMRBo:ms_expt rdf:about="{$base}/ms_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_expt rdf:resource="{$base}/ms_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_180_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_expt>
      </BMRBo:has_ms_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_expt_paramCategory/BMRBx:ms_expt_param">
      <BMRBo:has_ms_expt_param>
      <BMRBo:ms_expt_param rdf:about="{$base}/ms_expt_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ms_expt_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_expt_param rdf:resource="{$base}/ms_expt_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ms_expt_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_181_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_expt_param>
      </BMRBo:has_ms_expt_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ms_expt_softwareCategory/BMRBx:ms_expt_software">
      <BMRBo:has_ms_expt_software>
      <BMRBo:ms_expt_software rdf:about="{$base}/ms_expt_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ms_expt_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ms_expt_software rdf:resource="{$base}/ms_expt_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ms_expt_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_182_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ms_expt_software>
      </BMRBo:has_ms_expt_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mz_precursor_ionCategory/BMRBx:mz_precursor_ion">
      <BMRBo:has_mz_precursor_ion>
      <BMRBo:mz_precursor_ion rdf:about="{$base}/mz_precursor_ion/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mz_precursor_ion rdf:resource="{$base}/mz_precursor_ion/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_183_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mz_precursor_ion>
      </BMRBo:has_mz_precursor_ion>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mz_precursor_ion_annotationCategory/BMRBx:mz_precursor_ion_annotation">
      <BMRBo:has_mz_precursor_ion_annotation>
      <BMRBo:mz_precursor_ion_annotation rdf:about="{$base}/mz_precursor_ion_annotation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_precursor_ion_id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mz_precursor_ion_annotation rdf:resource="{$base}/mz_precursor_ion_annotation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_precursor_ion_id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_184_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mz_precursor_ion_annotation>
      </BMRBo:has_mz_precursor_ion_annotation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mz_product_ionCategory/BMRBx:mz_product_ion">
      <BMRBo:has_mz_product_ion>
      <BMRBo:mz_product_ion rdf:about="{$base}/mz_product_ion/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mz_product_ion rdf:resource="{$base}/mz_product_ion/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_185_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mz_product_ion>
      </BMRBo:has_mz_product_ion>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mz_product_ion_annotationCategory/BMRBx:mz_product_ion_annotation">
      <BMRBo:has_mz_product_ion_annotation>
      <BMRBo:mz_product_ion_annotation rdf:about="{$base}/mz_product_ion_annotation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_product_ion_id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mz_product_ion_annotation rdf:resource="{$base}/mz_product_ion_annotation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_product_ion_id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_186_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mz_product_ion_annotation>
      </BMRBo:has_mz_product_ion_annotation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mz_ratio_data_listCategory/BMRBx:mz_ratio_data_list">
      <BMRBo:has_mz_ratio_data_list>
      <BMRBo:mz_ratio_data_list rdf:about="{$base}/mz_ratio_data_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mz_ratio_data_list rdf:resource="{$base}/mz_ratio_data_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_187_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mz_ratio_data_list>
      </BMRBo:has_mz_ratio_data_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mz_ratio_experimentCategory/BMRBx:mz_ratio_experiment">
      <BMRBo:has_mz_ratio_experiment>
      <BMRBo:mz_ratio_experiment rdf:about="{$base}/mz_ratio_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mz_ratio_experiment rdf:resource="{$base}/mz_ratio_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_188_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mz_ratio_experiment>
      </BMRBo:has_mz_ratio_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mz_ratio_softwareCategory/BMRBx:mz_ratio_software">
      <BMRBo:has_mz_ratio_software>
      <BMRBo:mz_ratio_software rdf:about="{$base}/mz_ratio_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mz_ratio_software rdf:resource="{$base}/mz_ratio_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_189_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mz_ratio_software>
      </BMRBo:has_mz_ratio_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:mz_ratio_spectrum_paramCategory/BMRBx:mz_ratio_spectrum_param">
      <BMRBo:has_mz_ratio_spectrum_param>
      <BMRBo:mz_ratio_spectrum_param rdf:about="{$base}/mz_ratio_spectrum_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_mz_ratio_spectrum_param rdf:resource="{$base}/mz_ratio_spectrum_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@mz_ratio_data_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_190_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:mz_ratio_spectrum_param>
      </BMRBo:has_mz_ratio_spectrum_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:natural_source_dbCategory/BMRBx:natural_source_db">
      <BMRBo:has_natural_source_db>
      <BMRBo:natural_source_db rdf:about="{$base}/natural_source_db/{translate(@database_code,' []@#%+&amp;','_()a....')},{translate(@entity_natural_src_id,' []@#%+&amp;','_()a....')},{translate(@entity_natural_src_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_code,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:natural_source_db>
      </BMRBo:has_natural_source_db>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_experiment_citationCategory/BMRBx:nmr_experiment_citation">
      <BMRBo:has_nmr_experiment_citation>
      <BMRBo:nmr_experiment_citation rdf:about="{$base}/nmr_experiment_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@nmr_spec_expt_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_experiment_citation>
      </BMRBo:has_nmr_experiment_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_experiment_fileCategory/BMRBx:nmr_experiment_file">
      <BMRBo:has_nmr_experiment_file>
      <BMRBo:nmr_experiment_file rdf:about="{$base}/nmr_experiment_file/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@nmr_spec_expt_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_experiment_file>
      </BMRBo:has_nmr_experiment_file>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_expt_systematic_nameCategory/BMRBx:nmr_expt_systematic_name">
      <BMRBo:has_nmr_expt_systematic_name>
      <BMRBo:nmr_expt_systematic_name rdf:about="{$base}/nmr_expt_systematic_name/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@naming_system,' []@#%+&amp;','_()a....')},{translate(@nmr_spec_expt_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_expt_systematic_name>
      </BMRBo:has_nmr_expt_systematic_name>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_probeCategory/BMRBx:nmr_probe">
      <BMRBo:has_nmr_probe>
      <BMRBo:nmr_probe rdf:about="{$base}/nmr_probe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@nmr_spectrometer_probe_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_probe>
      </BMRBo:has_nmr_probe>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spec_exptCategory/BMRBx:nmr_spec_expt">
      <BMRBo:has_nmr_spec_expt>
      <BMRBo:nmr_spec_expt rdf:about="{$base}/nmr_spec_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_nmr_spec_expt rdf:resource="{$base}/nmr_spec_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_191_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spec_expt>
      </BMRBo:has_nmr_spec_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spectral_proc_softwareCategory/BMRBx:nmr_spectral_proc_software">
      <BMRBo:has_nmr_spectral_proc_software>
      <BMRBo:nmr_spectral_proc_software rdf:about="{$base}/nmr_spectral_proc_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@nmr_spectral_processing_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spectral_proc_software>
      </BMRBo:has_nmr_spectral_proc_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spectral_processingCategory/BMRBx:nmr_spectral_processing">
      <BMRBo:has_nmr_spectral_processing>
      <BMRBo:nmr_spectral_processing rdf:about="{$base}/nmr_spectral_processing/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_nmr_spectral_processing rdf:resource="{$base}/nmr_spectral_processing/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_192_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spectral_processing>
      </BMRBo:has_nmr_spectral_processing>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spectrometerCategory/BMRBx:nmr_spectrometer">
      <BMRBo:has_nmr_spectrometer>
      <BMRBo:nmr_spectrometer rdf:about="{$base}/nmr_spectrometer/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_nmr_spectrometer rdf:resource="{$base}/nmr_spectrometer/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_193_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spectrometer>
      </BMRBo:has_nmr_spectrometer>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spectrometer_citationCategory/BMRBx:nmr_spectrometer_citation">
      <BMRBo:has_nmr_spectrometer_citation>
      <BMRBo:nmr_spectrometer_citation rdf:about="{$base}/nmr_spectrometer_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@nmr_spectrometer_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spectrometer_citation>
      </BMRBo:has_nmr_spectrometer_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spectrometer_listCategory/BMRBx:nmr_spectrometer_list">
      <BMRBo:has_nmr_spectrometer_list>
      <BMRBo:nmr_spectrometer_list rdf:about="{$base}/nmr_spectrometer_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_nmr_spectrometer_list rdf:resource="{$base}/nmr_spectrometer_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_194_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spectrometer_list>
      </BMRBo:has_nmr_spectrometer_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spectrometer_probeCategory/BMRBx:nmr_spectrometer_probe">
      <BMRBo:has_nmr_spectrometer_probe>
      <BMRBo:nmr_spectrometer_probe rdf:about="{$base}/nmr_spectrometer_probe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_nmr_spectrometer_probe rdf:resource="{$base}/nmr_spectrometer_probe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_195_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spectrometer_probe>
      </BMRBo:has_nmr_spectrometer_probe>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spectrometer_probe_citationCategory/BMRBx:nmr_spectrometer_probe_citation">
      <BMRBo:has_nmr_spectrometer_probe_citation>
      <BMRBo:nmr_spectrometer_probe_citation rdf:about="{$base}/nmr_spectrometer_probe_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@nmr_spectrometer_probe_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spectrometer_probe_citation>
      </BMRBo:has_nmr_spectrometer_probe_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:nmr_spectrometer_viewCategory/BMRBx:nmr_spectrometer_view">
      <BMRBo:has_nmr_spectrometer_view>
      <BMRBo:nmr_spectrometer_view rdf:about="{$base}/nmr_spectrometer_view/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@nmr_spectrometer_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:nmr_spectrometer_view>
      </BMRBo:has_nmr_spectrometer_view>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:observed_conformerCategory/BMRBx:observed_conformer">
      <BMRBo:has_observed_conformer>
      <BMRBo:observed_conformer rdf:about="{$base}/observed_conformer/{translate(@atom_site_model_id,' []@#%+&amp;','_()a....')},{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@structure_interaction_id,' []@#%+&amp;','_()a....')},{translate(@structure_interaction_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_observed_conformer rdf:resource="{$base}/observed_conformer/{translate(@atom_site_model_id,' []@#%+&amp;','_()a....')},{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@structure_interaction_id,' []@#%+&amp;','_()a....')},{translate(@structure_interaction_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_196_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:observed_conformer>
      </BMRBo:has_observed_conformer>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:order_paramCategory/BMRBx:order_param">
      <BMRBo:has_order_param>
      <BMRBo:order_param rdf:about="{$base}/order_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@order_parameter_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_order_param rdf:resource="{$base}/order_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@order_parameter_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_197_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:order_param>
      </BMRBo:has_order_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:order_parameter_experimentCategory/BMRBx:order_parameter_experiment">
      <BMRBo:has_order_parameter_experiment>
      <BMRBo:order_parameter_experiment rdf:about="{$base}/order_parameter_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@order_parameter_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_order_parameter_experiment rdf:resource="{$base}/order_parameter_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@order_parameter_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_198_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:order_parameter_experiment>
      </BMRBo:has_order_parameter_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:order_parameter_listCategory/BMRBx:order_parameter_list">
      <BMRBo:has_order_parameter_list>
      <BMRBo:order_parameter_list rdf:about="{$base}/order_parameter_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_order_parameter_list rdf:resource="{$base}/order_parameter_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_199_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:order_parameter_list>
      </BMRBo:has_order_parameter_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:order_parameter_softwareCategory/BMRBx:order_parameter_software">
      <BMRBo:has_order_parameter_software>
      <BMRBo:order_parameter_software rdf:about="{$base}/order_parameter_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@order_parameter_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_order_parameter_software rdf:resource="{$base}/order_parameter_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@order_parameter_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_200_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:order_parameter_software>
      </BMRBo:has_order_parameter_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:org_constr_file_commentCategory/BMRBx:org_constr_file_comment">
      <BMRBo:has_org_constr_file_comment>
      <BMRBo:org_constr_file_comment rdf:about="{$base}/org_constr_file_comment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_org_constr_file_comment rdf:resource="{$base}/org_constr_file_comment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_201_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:org_constr_file_comment>
      </BMRBo:has_org_constr_file_comment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_constraint_exptCategory/BMRBx:other_constraint_expt">
      <BMRBo:has_other_constraint_expt>
      <BMRBo:other_constraint_expt rdf:about="{$base}/other_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@other_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_constraint_expt rdf:resource="{$base}/other_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@other_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_202_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_constraint_expt>
      </BMRBo:has_other_constraint_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_constraint_listCategory/BMRBx:other_constraint_list">
      <BMRBo:has_other_constraint_list>
      <BMRBo:other_constraint_list rdf:about="{$base}/other_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_constraint_list rdf:resource="{$base}/other_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_203_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_constraint_list>
      </BMRBo:has_other_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_constraint_softwareCategory/BMRBx:other_constraint_software">
      <BMRBo:has_other_constraint_software>
      <BMRBo:other_constraint_software rdf:about="{$base}/other_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@other_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_constraint_software rdf:resource="{$base}/other_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@other_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_204_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_constraint_software>
      </BMRBo:has_other_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_dataCategory/BMRBx:other_data">
      <BMRBo:has_other_data>
      <BMRBo:other_data rdf:about="{$base}/other_data/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@other_data_type_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_data rdf:resource="{$base}/other_data/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@other_data_type_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_205_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_data>
      </BMRBo:has_other_data>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_data_experimentCategory/BMRBx:other_data_experiment">
      <BMRBo:has_other_data_experiment>
      <BMRBo:other_data_experiment rdf:about="{$base}/other_data_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@other_data_type_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_data_experiment rdf:resource="{$base}/other_data_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@other_data_type_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_206_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_data_experiment>
      </BMRBo:has_other_data_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_data_softwareCategory/BMRBx:other_data_software">
      <BMRBo:has_other_data_software>
      <BMRBo:other_data_software rdf:about="{$base}/other_data_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@other_data_type_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_data_software rdf:resource="{$base}/other_data_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@other_data_type_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_207_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_data_software>
      </BMRBo:has_other_data_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_data_type_listCategory/BMRBx:other_data_type_list">
      <BMRBo:has_other_data_type_list>
      <BMRBo:other_data_type_list rdf:about="{$base}/other_data_type_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_data_type_list rdf:resource="{$base}/other_data_type_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_208_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_data_type_list>
      </BMRBo:has_other_data_type_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_struct_featureCategory/BMRBx:other_struct_feature">
      <BMRBo:has_other_struct_feature>
      <BMRBo:other_struct_feature rdf:about="{$base}/other_struct_feature/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@other_struct_feature_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_struct_feature rdf:resource="{$base}/other_struct_feature/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@other_struct_feature_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_209_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_struct_feature>
      </BMRBo:has_other_struct_feature>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:other_struct_feature_listCategory/BMRBx:other_struct_feature_list">
      <BMRBo:has_other_struct_feature_list>
      <BMRBo:other_struct_feature_list rdf:about="{$base}/other_struct_feature_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_other_struct_feature_list rdf:resource="{$base}/other_struct_feature_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_210_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:other_struct_feature_list>
      </BMRBo:has_other_struct_feature_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:pb_charCategory/BMRBx:pb_char">
      <BMRBo:has_pb_char>
      <BMRBo:pb_char rdf:about="{$base}/pb_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@pb_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_pb_char rdf:resource="{$base}/pb_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@pb_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_211_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:pb_char>
      </BMRBo:has_pb_char>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:pb_listCategory/BMRBx:pb_list">
      <BMRBo:has_pb_list>
      <BMRBo:pb_list rdf:about="{$base}/pb_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_pb_list rdf:resource="{$base}/pb_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_212_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:pb_list>
      </BMRBo:has_pb_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:pdbx_chem_comp_featureCategory/BMRBx:pdbx_chem_comp_feature">
      <BMRBo:has_pdbx_chem_comp_feature>
      <BMRBo:pdbx_chem_comp_feature rdf:about="{$base}/pdbx_chem_comp_feature/{translate(@comp_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@source,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')},{translate(@value,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:pdbx_chem_comp_feature>
      </BMRBo:has_pdbx_chem_comp_feature>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:pdbx_nonpoly_schemeCategory/BMRBx:pdbx_nonpoly_scheme">
      <BMRBo:has_pdbx_nonpoly_scheme>
      <BMRBo:pdbx_nonpoly_scheme rdf:about="{$base}/pdbx_nonpoly_scheme/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:pdbx_nonpoly_scheme>
      </BMRBo:has_pdbx_nonpoly_scheme>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:pdbx_poly_seq_schemeCategory/BMRBx:pdbx_poly_seq_scheme">
      <BMRBo:has_pdbx_poly_seq_scheme>
      <BMRBo:pdbx_poly_seq_scheme rdf:about="{$base}/pdbx_poly_seq_scheme/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:pdbx_poly_seq_scheme>
      </BMRBo:has_pdbx_poly_seq_scheme>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:peakCategory/BMRBx:peak">
      <BMRBo:has_peak>
      <BMRBo:peak rdf:about="{$base}/peak/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:peak>
      </BMRBo:has_peak>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:peak_charCategory/BMRBx:peak_char">
      <BMRBo:has_peak_char>
      <BMRBo:peak_char rdf:about="{$base}/peak_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@peak_id,' []@#%+&amp;','_()a....')},{translate(@spectral_dim_id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:peak_char>
      </BMRBo:has_peak_char>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:peak_constraint_linkCategory/BMRBx:peak_constraint_link">
      <BMRBo:has_peak_constraint_link>
      <BMRBo:peak_constraint_link rdf:about="{$base}/peak_constraint_link/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@peak_constraint_link_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_peak_constraint_link rdf:resource="{$base}/peak_constraint_link/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@peak_constraint_link_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_213_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:peak_constraint_link>
      </BMRBo:has_peak_constraint_link>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:peak_constraint_link_listCategory/BMRBx:peak_constraint_link_list">
      <BMRBo:has_peak_constraint_link_list>
      <BMRBo:peak_constraint_link_list rdf:about="{$base}/peak_constraint_link_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_peak_constraint_link_list rdf:resource="{$base}/peak_constraint_link_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_214_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:peak_constraint_link_list>
      </BMRBo:has_peak_constraint_link_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:peak_general_charCategory/BMRBx:peak_general_char">
      <BMRBo:has_peak_general_char>
      <BMRBo:peak_general_char rdf:about="{$base}/peak_general_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@intensity_val,' []@#%+&amp;','_()a....')},{translate(@peak_id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:peak_general_char>
      </BMRBo:has_peak_general_char>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:peak_row_formatCategory/BMRBx:peak_row_format">
      <BMRBo:has_peak_row_format>
      <BMRBo:peak_row_format rdf:about="{$base}/peak_row_format/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:peak_row_format>
      </BMRBo:has_peak_row_format>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ph_paramCategory/BMRBx:ph_param">
      <BMRBo:has_ph_param>
      <BMRBo:ph_param rdf:about="{$base}/ph_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ph_param_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ph_param rdf:resource="{$base}/ph_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ph_param_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_215_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ph_param>
      </BMRBo:has_ph_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ph_param_listCategory/BMRBx:ph_param_list">
      <BMRBo:has_ph_param_list>
      <BMRBo:ph_param_list rdf:about="{$base}/ph_param_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ph_param_list rdf:resource="{$base}/ph_param_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_216_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ph_param_list>
      </BMRBo:has_ph_param_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ph_titr_resultCategory/BMRBx:ph_titr_result">
      <BMRBo:has_ph_titr_result>
      <BMRBo:ph_titr_result rdf:about="{$base}/ph_titr_result/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ph_titration_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ph_titr_result rdf:resource="{$base}/ph_titr_result/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@ph_titration_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_217_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ph_titr_result>
      </BMRBo:has_ph_titr_result>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ph_titration_experimentCategory/BMRBx:ph_titration_experiment">
      <BMRBo:has_ph_titration_experiment>
      <BMRBo:ph_titration_experiment rdf:about="{$base}/ph_titration_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@ph_titration_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ph_titration_experiment rdf:resource="{$base}/ph_titration_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@ph_titration_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_218_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ph_titration_experiment>
      </BMRBo:has_ph_titration_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ph_titration_listCategory/BMRBx:ph_titration_list">
      <BMRBo:has_ph_titration_list>
      <BMRBo:ph_titration_list rdf:about="{$base}/ph_titration_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ph_titration_list rdf:resource="{$base}/ph_titration_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_219_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ph_titration_list>
      </BMRBo:has_ph_titration_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ph_titration_softwareCategory/BMRBx:ph_titration_software">
      <BMRBo:has_ph_titration_software>
      <BMRBo:ph_titration_software rdf:about="{$base}/ph_titration_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ph_titration_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ph_titration_software rdf:resource="{$base}/ph_titration_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@ph_titration_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_220_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ph_titration_software>
      </BMRBo:has_ph_titration_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdcCategory/BMRBx:rdc">
      <BMRBo:has_rdc>
      <BMRBo:rdc rdf:about="{$base}/rdc/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc rdf:resource="{$base}/rdc/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_221_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc>
      </BMRBo:has_rdc>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_constraintCategory/BMRBx:rdc_constraint">
      <BMRBo:has_rdc_constraint>
      <BMRBo:rdc_constraint rdf:about="{$base}/rdc_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@index_id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_constraint rdf:resource="{$base}/rdc_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@index_id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_222_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_constraint>
      </BMRBo:has_rdc_constraint>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_constraint_comment_orgCategory/BMRBx:rdc_constraint_comment_org">
      <BMRBo:has_rdc_constraint_comment_org>
      <BMRBo:rdc_constraint_comment_org rdf:about="{$base}/rdc_constraint_comment_org/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_constraint_comment_org rdf:resource="{$base}/rdc_constraint_comment_org/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_223_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_constraint_comment_org>
      </BMRBo:has_rdc_constraint_comment_org>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_constraint_conv_errCategory/BMRBx:rdc_constraint_conv_err">
      <BMRBo:has_rdc_constraint_conv_err>
      <BMRBo:rdc_constraint_conv_err rdf:about="{$base}/rdc_constraint_conv_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_constraint_conv_err rdf:resource="{$base}/rdc_constraint_conv_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_224_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_constraint_conv_err>
      </BMRBo:has_rdc_constraint_conv_err>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_constraint_exptCategory/BMRBx:rdc_constraint_expt">
      <BMRBo:has_rdc_constraint_expt>
      <BMRBo:rdc_constraint_expt rdf:about="{$base}/rdc_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_constraint_expt rdf:resource="{$base}/rdc_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_225_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_constraint_expt>
      </BMRBo:has_rdc_constraint_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_constraint_listCategory/BMRBx:rdc_constraint_list">
      <BMRBo:has_rdc_constraint_list>
      <BMRBo:rdc_constraint_list rdf:about="{$base}/rdc_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_constraint_list rdf:resource="{$base}/rdc_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_226_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_constraint_list>
      </BMRBo:has_rdc_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_constraint_parse_errCategory/BMRBx:rdc_constraint_parse_err">
      <BMRBo:has_rdc_constraint_parse_err>
      <BMRBo:rdc_constraint_parse_err rdf:about="{$base}/rdc_constraint_parse_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_constraint_parse_err rdf:resource="{$base}/rdc_constraint_parse_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_227_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_constraint_parse_err>
      </BMRBo:has_rdc_constraint_parse_err>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_constraint_parse_fileCategory/BMRBx:rdc_constraint_parse_file">
      <BMRBo:has_rdc_constraint_parse_file>
      <BMRBo:rdc_constraint_parse_file rdf:about="{$base}/rdc_constraint_parse_file/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_constraint_parse_file rdf:resource="{$base}/rdc_constraint_parse_file/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_228_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_constraint_parse_file>
      </BMRBo:has_rdc_constraint_parse_file>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_constraint_softwareCategory/BMRBx:rdc_constraint_software">
      <BMRBo:has_rdc_constraint_software>
      <BMRBo:rdc_constraint_software rdf:about="{$base}/rdc_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_constraint_software rdf:resource="{$base}/rdc_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@rdc_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_229_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_constraint_software>
      </BMRBo:has_rdc_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_experimentCategory/BMRBx:rdc_experiment">
      <BMRBo:has_rdc_experiment>
      <BMRBo:rdc_experiment rdf:about="{$base}/rdc_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@rdc_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_experiment rdf:resource="{$base}/rdc_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@rdc_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_230_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_experiment>
      </BMRBo:has_rdc_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_listCategory/BMRBx:rdc_list">
      <BMRBo:has_rdc_list>
      <BMRBo:rdc_list rdf:about="{$base}/rdc_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_list rdf:resource="{$base}/rdc_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_231_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_list>
      </BMRBo:has_rdc_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rdc_softwareCategory/BMRBx:rdc_software">
      <BMRBo:has_rdc_software>
      <BMRBo:rdc_software rdf:about="{$base}/rdc_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@rdc_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rdc_software rdf:resource="{$base}/rdc_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@rdc_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_232_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rdc_software>
      </BMRBo:has_rdc_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:recoupling_pulse_sequenceCategory/BMRBx:recoupling_pulse_sequence">
      <BMRBo:has_recoupling_pulse_sequence>
      <BMRBo:recoupling_pulse_sequence rdf:about="{$base}/recoupling_pulse_sequence/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@nmr_spec_expt_id,' []@#%+&amp;','_()a....')},{translate(@time_period,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:recoupling_pulse_sequence>
      </BMRBo:has_recoupling_pulse_sequence>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:related_entriesCategory/BMRBx:related_entries">
      <BMRBo:has_related_entries>
      <BMRBo:related_entries rdf:about="{$base}/related_entries/{translate(@database_accession_code,' []@#%+&amp;','_()a....')},{translate(@database_name,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_related_entries rdf:resource="{$base}/related_entries/{translate(@database_accession_code,' []@#%+&amp;','_()a....')},{translate(@database_name,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_233_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:related_entries>
      </BMRBo:has_related_entries>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:releaseCategory/BMRBx:release">
      <BMRBo:has_release>
      <BMRBo:release rdf:about="{$base}/release/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@release_number,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_release rdf:resource="{$base}/release/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@release_number,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_234_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:release>
      </BMRBo:has_release>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rep_confCategory/BMRBx:rep_conf">
      <BMRBo:has_rep_conf>
      <BMRBo:rep_conf rdf:about="{$base}/rep_conf/{translate(@atom_coordinate_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rep_conf rdf:resource="{$base}/rep_conf/{translate(@atom_coordinate_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_235_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rep_conf>
      </BMRBo:has_rep_conf>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rep_conf_refinementCategory/BMRBx:rep_conf_refinement">
      <BMRBo:has_rep_conf_refinement>
      <BMRBo:rep_conf_refinement rdf:about="{$base}/rep_conf_refinement/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@refine_method,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rep_conf_refinement rdf:resource="{$base}/rep_conf_refinement/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@refine_method,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_236_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rep_conf_refinement>
      </BMRBo:has_rep_conf_refinement>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rep_conf_softwareCategory/BMRBx:rep_conf_software">
      <BMRBo:has_rep_conf_software>
      <BMRBo:rep_conf_software rdf:about="{$base}/rep_conf_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rep_conf_software rdf:resource="{$base}/rep_conf_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_237_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rep_conf_software>
      </BMRBo:has_rep_conf_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:rep_coordinate_detailsCategory/BMRBx:rep_coordinate_details">
      <BMRBo:has_rep_coordinate_details>
      <BMRBo:rep_coordinate_details rdf:about="{$base}/rep_coordinate_details/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@footnote_id,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_rep_coordinate_details rdf:resource="{$base}/rep_coordinate_details/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@footnote_id,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_238_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:rep_coordinate_details>
      </BMRBo:has_rep_coordinate_details>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:representative_conformerCategory/BMRBx:representative_conformer">
      <BMRBo:has_representative_conformer>
      <BMRBo:representative_conformer rdf:about="{$base}/representative_conformer/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_representative_conformer rdf:resource="{$base}/representative_conformer/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_239_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:representative_conformer>
      </BMRBo:has_representative_conformer>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:resonanceCategory/BMRBx:resonance">
      <BMRBo:has_resonance>
      <BMRBo:resonance rdf:about="{$base}/resonance/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@resonance_linker_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:resonance>
      </BMRBo:has_resonance>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:resonance_assignmentCategory/BMRBx:resonance_assignment">
      <BMRBo:has_resonance_assignment>
      <BMRBo:resonance_assignment rdf:about="{$base}/resonance_assignment/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@resonance_linker_list_id,' []@#%+&amp;','_()a....')},{translate(@resonance_set_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_resonance_assignment rdf:resource="{$base}/resonance_assignment/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@resonance_linker_list_id,' []@#%+&amp;','_()a....')},{translate(@resonance_set_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_240_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:resonance_assignment>
      </BMRBo:has_resonance_assignment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:resonance_covalent_linkCategory/BMRBx:resonance_covalent_link">
      <BMRBo:has_resonance_covalent_link>
      <BMRBo:resonance_covalent_link rdf:about="{$base}/resonance_covalent_link/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@resonance_id_1,' []@#%+&amp;','_()a....')},{translate(@resonance_id_2,' []@#%+&amp;','_()a....')},{translate(@resonance_linker_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:resonance_covalent_link>
      </BMRBo:has_resonance_covalent_link>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:resonance_linker_listCategory/BMRBx:resonance_linker_list">
      <BMRBo:has_resonance_linker_list>
      <BMRBo:resonance_linker_list rdf:about="{$base}/resonance_linker_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_resonance_linker_list rdf:resource="{$base}/resonance_linker_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_241_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:resonance_linker_list>
      </BMRBo:has_resonance_linker_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:sampleCategory/BMRBx:sample">
      <BMRBo:has_sample>
      <BMRBo:sample rdf:about="{$base}/sample/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_sample rdf:resource="{$base}/sample/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_242_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:sample>
      </BMRBo:has_sample>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:sample_citationCategory/BMRBx:sample_citation">
      <BMRBo:has_sample_citation>
      <BMRBo:sample_citation rdf:about="{$base}/sample_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@sample_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:sample_citation>
      </BMRBo:has_sample_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:sample_componentCategory/BMRBx:sample_component">
      <BMRBo:has_sample_component>
      <BMRBo:sample_component rdf:about="{$base}/sample_component/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@sample_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:sample_component>
      </BMRBo:has_sample_component>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:sample_component_atom_isotopeCategory/BMRBx:sample_component_atom_isotope">
      <BMRBo:has_sample_component_atom_isotope>
      <BMRBo:sample_component_atom_isotope rdf:about="{$base}/sample_component_atom_isotope/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@atom_isotope_number,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@sample_component_id,' []@#%+&amp;','_()a....')},{translate(@sample_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:sample_component_atom_isotope>
      </BMRBo:has_sample_component_atom_isotope>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:sample_condition_citationCategory/BMRBx:sample_condition_citation">
      <BMRBo:has_sample_condition_citation>
      <BMRBo:sample_condition_citation rdf:about="{$base}/sample_condition_citation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@sample_condition_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:sample_condition_citation>
      </BMRBo:has_sample_condition_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:sample_condition_listCategory/BMRBx:sample_condition_list">
      <BMRBo:has_sample_condition_list>
      <BMRBo:sample_condition_list rdf:about="{$base}/sample_condition_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_sample_condition_list rdf:resource="{$base}/sample_condition_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_243_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:sample_condition_list>
      </BMRBo:has_sample_condition_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:sample_condition_variableCategory/BMRBx:sample_condition_variable">
      <BMRBo:has_sample_condition_variable>
      <BMRBo:sample_condition_variable rdf:about="{$base}/sample_condition_variable/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@sample_condition_list_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:sample_condition_variable>
      </BMRBo:has_sample_condition_variable>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:saxs_constraintCategory/BMRBx:saxs_constraint">
      <BMRBo:has_saxs_constraint>
      <BMRBo:saxs_constraint rdf:about="{$base}/saxs_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@saxs_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_saxs_constraint rdf:resource="{$base}/saxs_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@saxs_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_244_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:saxs_constraint>
      </BMRBo:has_saxs_constraint>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:saxs_constraint_exptCategory/BMRBx:saxs_constraint_expt">
      <BMRBo:has_saxs_constraint_expt>
      <BMRBo:saxs_constraint_expt rdf:about="{$base}/saxs_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@sample_id,' []@#%+&amp;','_()a....')},{translate(@saxs_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_saxs_constraint_expt rdf:resource="{$base}/saxs_constraint_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@sample_id,' []@#%+&amp;','_()a....')},{translate(@saxs_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_245_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:saxs_constraint_expt>
      </BMRBo:has_saxs_constraint_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:saxs_constraint_listCategory/BMRBx:saxs_constraint_list">
      <BMRBo:has_saxs_constraint_list>
      <BMRBo:saxs_constraint_list rdf:about="{$base}/saxs_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_saxs_constraint_list rdf:resource="{$base}/saxs_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_246_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:saxs_constraint_list>
      </BMRBo:has_saxs_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:saxs_constraint_softwareCategory/BMRBx:saxs_constraint_software">
      <BMRBo:has_saxs_constraint_software>
      <BMRBo:saxs_constraint_software rdf:about="{$base}/saxs_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@saxs_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_saxs_constraint_software rdf:resource="{$base}/saxs_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@saxs_constraint_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_247_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:saxs_constraint_software>
      </BMRBo:has_saxs_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:saxs_exptCategory/BMRBx:saxs_expt">
      <BMRBo:has_saxs_expt>
      <BMRBo:saxs_expt rdf:about="{$base}/saxs_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:saxs_expt>
      </BMRBo:has_saxs_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:secondary_structCategory/BMRBx:secondary_struct">
      <BMRBo:has_secondary_struct>
      <BMRBo:secondary_struct rdf:about="{$base}/secondary_struct/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@secondary_struct_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_secondary_struct rdf:resource="{$base}/secondary_struct/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@secondary_struct_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_248_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:secondary_struct>
      </BMRBo:has_secondary_struct>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:secondary_struct_listCategory/BMRBx:secondary_struct_list">
      <BMRBo:has_secondary_struct_list>
      <BMRBo:secondary_struct_list rdf:about="{$base}/secondary_struct_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_secondary_struct_list rdf:resource="{$base}/secondary_struct_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_249_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:secondary_struct_list>
      </BMRBo:has_secondary_struct_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:secondary_struct_selCategory/BMRBx:secondary_struct_sel">
      <BMRBo:has_secondary_struct_sel>
      <BMRBo:secondary_struct_sel rdf:about="{$base}/secondary_struct_sel/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@method_id,' []@#%+&amp;','_()a....')},{translate(@secondary_struct_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_secondary_struct_sel rdf:resource="{$base}/secondary_struct_sel/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@method_id,' []@#%+&amp;','_()a....')},{translate(@secondary_struct_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_250_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:secondary_struct_sel>
      </BMRBo:has_secondary_struct_sel>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:sg_projectCategory/BMRBx:sg_project">
      <BMRBo:has_sg_project>
      <BMRBo:sg_project rdf:about="{$base}/sg_project/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@sg_project_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_sg_project rdf:resource="{$base}/sg_project/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@sg_project_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_251_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:sg_project>
      </BMRBo:has_sg_project>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:softwareCategory/BMRBx:software">
      <BMRBo:has_software>
      <BMRBo:software rdf:about="{$base}/software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_software rdf:resource="{$base}/software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_252_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:software>
      </BMRBo:has_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:software_applied_historyCategory/BMRBx:software_applied_history">
      <BMRBo:has_software_applied_history>
      <BMRBo:software_applied_history rdf:about="{$base}/software_applied_history/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_software_applied_history rdf:resource="{$base}/software_applied_history/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_253_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:software_applied_history>
      </BMRBo:has_software_applied_history>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:software_applied_listCategory/BMRBx:software_applied_list">
      <BMRBo:has_software_applied_list>
      <BMRBo:software_applied_list rdf:about="{$base}/software_applied_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_software_applied_list rdf:resource="{$base}/software_applied_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_254_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:software_applied_list>
      </BMRBo:has_software_applied_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:software_applied_methodsCategory/BMRBx:software_applied_methods">
      <BMRBo:has_software_applied_methods>
      <BMRBo:software_applied_methods rdf:about="{$base}/software_applied_methods/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_applied_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_software_applied_methods rdf:resource="{$base}/software_applied_methods/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_applied_list_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_255_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:software_applied_methods>
      </BMRBo:has_software_applied_methods>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:software_citationCategory/BMRBx:software_citation">
      <BMRBo:has_software_citation>
      <BMRBo:software_citation rdf:about="{$base}/software_citation/{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:software_citation>
      </BMRBo:has_software_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:software_specific_infoCategory/BMRBx:software_specific_info">
      <BMRBo:has_software_specific_info>
      <BMRBo:software_specific_info rdf:about="{$base}/software_specific_info/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_saveframe_id,' []@#%+&amp;','_()a....')},{translate(@software_specific_info_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_software_specific_info rdf:resource="{$base}/software_specific_info/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_saveframe_id,' []@#%+&amp;','_()a....')},{translate(@software_specific_info_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_256_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:software_specific_info>
      </BMRBo:has_software_specific_info>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:software_specific_info_listCategory/BMRBx:software_specific_info_list">
      <BMRBo:has_software_specific_info_list>
      <BMRBo:software_specific_info_list rdf:about="{$base}/software_specific_info_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_software_specific_info_list rdf:resource="{$base}/software_specific_info_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_257_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:software_specific_info_list>
      </BMRBo:has_software_specific_info_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_acq_paramCategory/BMRBx:spectral_acq_param">
      <BMRBo:has_spectral_acq_param>
      <BMRBo:spectral_acq_param rdf:about="{$base}/spectral_acq_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@nmr_spec_expt_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_acq_param>
      </BMRBo:has_spectral_acq_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_densityCategory/BMRBx:spectral_density">
      <BMRBo:has_spectral_density>
      <BMRBo:spectral_density rdf:about="{$base}/spectral_density/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@spectral_density_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_spectral_density rdf:resource="{$base}/spectral_density/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@spectral_density_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_258_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_density>
      </BMRBo:has_spectral_density>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_density_experimentCategory/BMRBx:spectral_density_experiment">
      <BMRBo:has_spectral_density_experiment>
      <BMRBo:spectral_density_experiment rdf:about="{$base}/spectral_density_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@spectral_density_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_spectral_density_experiment rdf:resource="{$base}/spectral_density_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@spectral_density_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_259_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_density_experiment>
      </BMRBo:has_spectral_density_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_density_listCategory/BMRBx:spectral_density_list">
      <BMRBo:has_spectral_density_list>
      <BMRBo:spectral_density_list rdf:about="{$base}/spectral_density_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_spectral_density_list rdf:resource="{$base}/spectral_density_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_260_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_density_list>
      </BMRBo:has_spectral_density_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_density_softwareCategory/BMRBx:spectral_density_software">
      <BMRBo:has_spectral_density_software>
      <BMRBo:spectral_density_software rdf:about="{$base}/spectral_density_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@spectral_density_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_spectral_density_software rdf:resource="{$base}/spectral_density_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@spectral_density_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_261_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_density_software>
      </BMRBo:has_spectral_density_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_dimCategory/BMRBx:spectral_dim">
      <BMRBo:has_spectral_dim>
      <BMRBo:spectral_dim rdf:about="{$base}/spectral_dim/{translate(@atom_type,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')},{translate(@spectral_region,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_dim>
      </BMRBo:has_spectral_dim>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_dim_transferCategory/BMRBx:spectral_dim_transfer">
      <BMRBo:has_spectral_dim_transfer>
      <BMRBo:spectral_dim_transfer rdf:about="{$base}/spectral_dim_transfer/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@spectral_dim_id_1,' []@#%+&amp;','_()a....')},{translate(@spectral_dim_id_2,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_dim_transfer>
      </BMRBo:has_spectral_dim_transfer>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_peak_listCategory/BMRBx:spectral_peak_list">
      <BMRBo:has_spectral_peak_list>
      <BMRBo:spectral_peak_list rdf:about="{$base}/spectral_peak_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_spectral_peak_list rdf:resource="{$base}/spectral_peak_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_262_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_peak_list>
      </BMRBo:has_spectral_peak_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_peak_softwareCategory/BMRBx:spectral_peak_software">
      <BMRBo:has_spectral_peak_software>
      <BMRBo:spectral_peak_software rdf:about="{$base}/spectral_peak_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_peak_software>
      </BMRBo:has_spectral_peak_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_processing_paramCategory/BMRBx:spectral_processing_param">
      <BMRBo:has_spectral_processing_param>
      <BMRBo:spectral_processing_param rdf:about="{$base}/spectral_processing_param/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@nmr_spectral_processing_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_processing_param>
      </BMRBo:has_spectral_processing_param>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_transitionCategory/BMRBx:spectral_transition">
      <BMRBo:has_spectral_transition>
      <BMRBo:spectral_transition rdf:about="{$base}/spectral_transition/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_transition>
      </BMRBo:has_spectral_transition>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_transition_charCategory/BMRBx:spectral_transition_char">
      <BMRBo:has_spectral_transition_char>
      <BMRBo:spectral_transition_char rdf:about="{$base}/spectral_transition_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@spectral_dim_id,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')},{translate(@spectral_transition_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_transition_char>
      </BMRBo:has_spectral_transition_char>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spectral_transition_general_charCategory/BMRBx:spectral_transition_general_char">
      <BMRBo:has_spectral_transition_general_char>
      <BMRBo:spectral_transition_general_char rdf:about="{$base}/spectral_transition_general_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@intensity_val,' []@#%+&amp;','_()a....')},{translate(@spectral_peak_list_id,' []@#%+&amp;','_()a....')},{translate(@spectral_transition_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spectral_transition_general_char>
      </BMRBo:has_spectral_transition_general_char>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spin_systemCategory/BMRBx:spin_system">
      <BMRBo:has_spin_system>
      <BMRBo:spin_system rdf:about="{$base}/spin_system/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@resonance_linker_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spin_system>
      </BMRBo:has_spin_system>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:spin_system_linkCategory/BMRBx:spin_system_link">
      <BMRBo:has_spin_system_link>
      <BMRBo:spin_system_link rdf:about="{$base}/spin_system_link/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@from_spin_system_id,' []@#%+&amp;','_()a....')},{translate(@resonance_linker_list_id,' []@#%+&amp;','_()a....')},{translate(@to_spin_system_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:spin_system_link>
      </BMRBo:has_spin_system_link>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:struct_anno_charCategory/BMRBx:struct_anno_char">
      <BMRBo:has_struct_anno_char>
      <BMRBo:struct_anno_char rdf:about="{$base}/struct_anno_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@structure_annotation_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_struct_anno_char rdf:resource="{$base}/struct_anno_char/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@structure_annotation_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_263_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:struct_anno_char>
      </BMRBo:has_struct_anno_char>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:struct_anno_softwareCategory/BMRBx:struct_anno_software">
      <BMRBo:has_struct_anno_software>
      <BMRBo:struct_anno_software rdf:about="{$base}/struct_anno_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@structure_annotation_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_struct_anno_software rdf:resource="{$base}/struct_anno_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@structure_annotation_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_264_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:struct_anno_software>
      </BMRBo:has_struct_anno_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:struct_asymCategory/BMRBx:struct_asym">
      <BMRBo:has_struct_asym>
      <BMRBo:struct_asym rdf:about="{$base}/struct_asym/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:struct_asym>
      </BMRBo:has_struct_asym>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:struct_classificationCategory/BMRBx:struct_classification">
      <BMRBo:has_struct_classification>
      <BMRBo:struct_classification rdf:about="{$base}/struct_classification/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@structure_annotation_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_struct_classification rdf:resource="{$base}/struct_classification/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@structure_annotation_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_265_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:struct_classification>
      </BMRBo:has_struct_classification>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:struct_imageCategory/BMRBx:struct_image">
      <BMRBo:has_struct_image>
      <BMRBo:struct_image rdf:about="{$base}/struct_image/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@file_name,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_struct_image rdf:resource="{$base}/struct_image/{translate(@conformer_family_coord_set_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@file_name,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_266_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:struct_image>
      </BMRBo:has_struct_image>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:struct_keywordsCategory/BMRBx:struct_keywords">
      <BMRBo:has_struct_keywords>
      <BMRBo:struct_keywords rdf:about="{$base}/struct_keywords/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@keywords,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_struct_keywords rdf:resource="{$base}/struct_keywords/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@keywords,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_267_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:struct_keywords>
      </BMRBo:has_struct_keywords>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:structure_annotationCategory/BMRBx:structure_annotation">
      <BMRBo:has_structure_annotation>
      <BMRBo:structure_annotation rdf:about="{$base}/structure_annotation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_structure_annotation rdf:resource="{$base}/structure_annotation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_268_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:structure_annotation>
      </BMRBo:has_structure_annotation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:structure_interactionCategory/BMRBx:structure_interaction">
      <BMRBo:has_structure_interaction>
      <BMRBo:structure_interaction rdf:about="{$base}/structure_interaction/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@structure_interaction_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_structure_interaction rdf:resource="{$base}/structure_interaction/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@structure_interaction_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_269_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:structure_interaction>
      </BMRBo:has_structure_interaction>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:structure_interaction_listCategory/BMRBx:structure_interaction_list">
      <BMRBo:has_structure_interaction_list>
      <BMRBo:structure_interaction_list rdf:about="{$base}/structure_interaction_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_structure_interaction_list rdf:resource="{$base}/structure_interaction_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_270_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:structure_interaction_list>
      </BMRBo:has_structure_interaction_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:studyCategory/BMRBx:study">
      <BMRBo:has_study>
      <BMRBo:study rdf:about="{$base}/study/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@study_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:study>
      </BMRBo:has_study>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:study_entry_listCategory/BMRBx:study_entry_list">
      <BMRBo:has_study_entry_list>
      <BMRBo:study_entry_list rdf:about="{$base}/study_entry_list/{translate(@bmrb_accession_code,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@study_id,' []@#%+&amp;','_()a....')},{translate(@study_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:study_entry_list>
      </BMRBo:has_study_entry_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:study_keywordCategory/BMRBx:study_keyword">
      <BMRBo:has_study_keyword>
      <BMRBo:study_keyword rdf:about="{$base}/study_keyword/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@keyword,' []@#%+&amp;','_()a....')},{translate(@study_id,' []@#%+&amp;','_()a....')},{translate(@study_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:study_keyword>
      </BMRBo:has_study_keyword>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:study_listCategory/BMRBx:study_list">
      <BMRBo:has_study_list>
      <BMRBo:study_list rdf:about="{$base}/study_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_study_list rdf:resource="{$base}/study_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_271_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:study_list>
      </BMRBo:has_study_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:subsystem_biological_functionCategory/BMRBx:subsystem_biological_function">
      <BMRBo:has_subsystem_biological_function>
      <BMRBo:subsystem_biological_function rdf:about="{$base}/subsystem_biological_function/{translate(@assembly_subsystem_id,' []@#%+&amp;','_()a....')},{translate(@biological_function,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:subsystem_biological_function>
      </BMRBo:has_subsystem_biological_function>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:subsystem_citationCategory/BMRBx:subsystem_citation">
      <BMRBo:has_subsystem_citation>
      <BMRBo:subsystem_citation rdf:about="{$base}/subsystem_citation/{translate(@assembly_subsystem_id,' []@#%+&amp;','_()a....')},{translate(@citation_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:subsystem_citation>
      </BMRBo:has_subsystem_citation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:subsystem_common_nameCategory/BMRBx:subsystem_common_name">
      <BMRBo:has_subsystem_common_name>
      <BMRBo:subsystem_common_name rdf:about="{$base}/subsystem_common_name/{translate(@assembly_subsystem_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:subsystem_common_name>
      </BMRBo:has_subsystem_common_name>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:subsystem_componentCategory/BMRBx:subsystem_component">
      <BMRBo:has_subsystem_component>
      <BMRBo:subsystem_component rdf:about="{$base}/subsystem_component/{translate(@assembly_subsystem_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:subsystem_component>
      </BMRBo:has_subsystem_component>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:subsystem_db_linkCategory/BMRBx:subsystem_db_link">
      <BMRBo:has_subsystem_db_link>
      <BMRBo:subsystem_db_link rdf:about="{$base}/subsystem_db_link/{translate(@accession_code,' []@#%+&amp;','_()a....')},{translate(@assembly_subsystem_id,' []@#%+&amp;','_()a....')},{translate(@database_code,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:subsystem_db_link>
      </BMRBo:has_subsystem_db_link>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:subsystem_keywordCategory/BMRBx:subsystem_keyword">
      <BMRBo:has_subsystem_keyword>
      <BMRBo:subsystem_keyword rdf:about="{$base}/subsystem_keyword/{translate(@assembly_subsystem_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@keyword,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:subsystem_keyword>
      </BMRBo:has_subsystem_keyword>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:subsystem_typeCategory/BMRBx:subsystem_type">
      <BMRBo:has_subsystem_type>
      <BMRBo:subsystem_type rdf:about="{$base}/subsystem_type/{translate(@assembly_subsystem_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:subsystem_type>
      </BMRBo:has_subsystem_type>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:systematic_chem_shift_offsetCategory/BMRBx:systematic_chem_shift_offset">
      <BMRBo:has_systematic_chem_shift_offset>
      <BMRBo:systematic_chem_shift_offset rdf:about="{$base}/systematic_chem_shift_offset/{translate(@assigned_chem_shift_list_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@type,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:systematic_chem_shift_offset>
      </BMRBo:has_systematic_chem_shift_offset>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:t1Category/BMRBx:t1">
      <BMRBo:has_t1>
      <BMRBo:t1 rdf:about="{$base}/t1/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_t1 rdf:resource="{$base}/t1/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_272_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:t1>
      </BMRBo:has_t1>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:t1rhoCategory/BMRBx:t1rho">
      <BMRBo:has_t1rho>
      <BMRBo:t1rho rdf:about="{$base}/t1rho/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1rho_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_t1rho rdf:resource="{$base}/t1rho/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t1rho_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_273_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:t1rho>
      </BMRBo:has_t1rho>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:t2Category/BMRBx:t2">
      <BMRBo:has_t2>
      <BMRBo:t2 rdf:about="{$base}/t2/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t2_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_t2 rdf:resource="{$base}/t2/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@heteronucl_t2_list_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_274_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:t2>
      </BMRBo:has_t2>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ta_constraint_comment_orgCategory/BMRBx:ta_constraint_comment_org">
      <BMRBo:has_ta_constraint_comment_org>
      <BMRBo:ta_constraint_comment_org rdf:about="{$base}/ta_constraint_comment_org/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ta_constraint_comment_org rdf:resource="{$base}/ta_constraint_comment_org/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_275_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ta_constraint_comment_org>
      </BMRBo:has_ta_constraint_comment_org>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ta_constraint_conv_errCategory/BMRBx:ta_constraint_conv_err">
      <BMRBo:has_ta_constraint_conv_err>
      <BMRBo:ta_constraint_conv_err rdf:about="{$base}/ta_constraint_conv_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ta_constraint_conv_err rdf:resource="{$base}/ta_constraint_conv_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_276_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ta_constraint_conv_err>
      </BMRBo:has_ta_constraint_conv_err>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ta_constraint_parse_errCategory/BMRBx:ta_constraint_parse_err">
      <BMRBo:has_ta_constraint_parse_err>
      <BMRBo:ta_constraint_parse_err rdf:about="{$base}/ta_constraint_parse_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ta_constraint_parse_err rdf:resource="{$base}/ta_constraint_parse_err/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_277_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ta_constraint_parse_err>
      </BMRBo:has_ta_constraint_parse_err>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:ta_constraint_parse_fileCategory/BMRBx:ta_constraint_parse_file">
      <BMRBo:has_ta_constraint_parse_file>
      <BMRBo:ta_constraint_parse_file rdf:about="{$base}/ta_constraint_parse_file/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_ta_constraint_parse_file rdf:resource="{$base}/ta_constraint_parse_file/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_278_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:ta_constraint_parse_file>
      </BMRBo:has_ta_constraint_parse_file>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:taskCategory/BMRBx:task">
      <BMRBo:has_task>
      <BMRBo:task rdf:about="{$base}/task/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@task,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:task>
      </BMRBo:has_task>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:tensorCategory/BMRBx:tensor">
      <BMRBo:has_tensor>
      <BMRBo:tensor rdf:about="{$base}/tensor/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@tensor_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:tensor>
      </BMRBo:has_tensor>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:tensor_listCategory/BMRBx:tensor_list">
      <BMRBo:has_tensor_list>
      <BMRBo:tensor_list rdf:about="{$base}/tensor_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_tensor_list rdf:resource="{$base}/tensor_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_279_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:tensor_list>
      </BMRBo:has_tensor_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:terminal_residueCategory/BMRBx:terminal_residue">
      <BMRBo:has_terminal_residue>
      <BMRBo:terminal_residue rdf:about="{$base}/terminal_residue/{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_terminal_residue rdf:resource="{$base}/terminal_residue/{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@representative_conformer_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_280_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:terminal_residue>
      </BMRBo:has_terminal_residue>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:tertiary_structCategory/BMRBx:tertiary_struct">
      <BMRBo:has_tertiary_struct>
      <BMRBo:tertiary_struct rdf:about="{$base}/tertiary_struct/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@tertiary_struct_element_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_tertiary_struct rdf:resource="{$base}/tertiary_struct/{translate(@atom_id,' []@#%+&amp;','_()a....')},{translate(@comp_index_id,' []@#%+&amp;','_()a....')},{translate(@entity_assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@tertiary_struct_element_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_281_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:tertiary_struct>
      </BMRBo:has_tertiary_struct>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:tertiary_struct_element_listCategory/BMRBx:tertiary_struct_element_list">
      <BMRBo:has_tertiary_struct_element_list>
      <BMRBo:tertiary_struct_element_list rdf:about="{$base}/tertiary_struct_element_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_tertiary_struct_element_list rdf:resource="{$base}/tertiary_struct_element_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_282_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:tertiary_struct_element_list>
      </BMRBo:has_tertiary_struct_element_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:tertiary_struct_element_selCategory/BMRBx:tertiary_struct_element_sel">
      <BMRBo:has_tertiary_struct_element_sel>
      <BMRBo:tertiary_struct_element_sel rdf:about="{$base}/tertiary_struct_element_sel/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@method_id,' []@#%+&amp;','_()a....')},{translate(@tertiary_struct_element_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_tertiary_struct_element_sel rdf:resource="{$base}/tertiary_struct_element_sel/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@method_id,' []@#%+&amp;','_()a....')},{translate(@tertiary_struct_element_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_283_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:tertiary_struct_element_sel>
      </BMRBo:has_tertiary_struct_element_sel>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_auto_relaxationCategory/BMRBx:theoretical_auto_relaxation">
      <BMRBo:has_theoretical_auto_relaxation>
      <BMRBo:theoretical_auto_relaxation rdf:about="{$base}/theoretical_auto_relaxation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_auto_relaxation_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_auto_relaxation rdf:resource="{$base}/theoretical_auto_relaxation/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_auto_relaxation_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_284_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_auto_relaxation>
      </BMRBo:has_theoretical_auto_relaxation>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_auto_relaxation_experimentCategory/BMRBx:theoretical_auto_relaxation_experiment">
      <BMRBo:has_theoretical_auto_relaxation_experiment>
      <BMRBo:theoretical_auto_relaxation_experiment rdf:about="{$base}/theoretical_auto_relaxation_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_auto_relaxation_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_auto_relaxation_experiment rdf:resource="{$base}/theoretical_auto_relaxation_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_auto_relaxation_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_285_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_auto_relaxation_experiment>
      </BMRBo:has_theoretical_auto_relaxation_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_auto_relaxation_listCategory/BMRBx:theoretical_auto_relaxation_list">
      <BMRBo:has_theoretical_auto_relaxation_list>
      <BMRBo:theoretical_auto_relaxation_list rdf:about="{$base}/theoretical_auto_relaxation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_auto_relaxation_list rdf:resource="{$base}/theoretical_auto_relaxation_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_286_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_auto_relaxation_list>
      </BMRBo:has_theoretical_auto_relaxation_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_auto_relaxation_softwareCategory/BMRBx:theoretical_auto_relaxation_software">
      <BMRBo:has_theoretical_auto_relaxation_software>
      <BMRBo:theoretical_auto_relaxation_software rdf:about="{$base}/theoretical_auto_relaxation_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_auto_relaxation_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_auto_relaxation_software rdf:resource="{$base}/theoretical_auto_relaxation_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_auto_relaxation_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_287_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_auto_relaxation_software>
      </BMRBo:has_theoretical_auto_relaxation_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_chem_shiftCategory/BMRBx:theoretical_chem_shift">
      <BMRBo:has_theoretical_chem_shift>
      <BMRBo:theoretical_chem_shift rdf:about="{$base}/theoretical_chem_shift/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_chem_shift_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_chem_shift rdf:resource="{$base}/theoretical_chem_shift/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_chem_shift_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_288_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_chem_shift>
      </BMRBo:has_theoretical_chem_shift>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_chem_shift_listCategory/BMRBx:theoretical_chem_shift_list">
      <BMRBo:has_theoretical_chem_shift_list>
      <BMRBo:theoretical_chem_shift_list rdf:about="{$base}/theoretical_chem_shift_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_chem_shift_list rdf:resource="{$base}/theoretical_chem_shift_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_289_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_chem_shift_list>
      </BMRBo:has_theoretical_chem_shift_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_coupling_constantCategory/BMRBx:theoretical_coupling_constant">
      <BMRBo:has_theoretical_coupling_constant>
      <BMRBo:theoretical_coupling_constant rdf:about="{$base}/theoretical_coupling_constant/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_coupling_constant_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_coupling_constant>
      </BMRBo:has_theoretical_coupling_constant>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_coupling_constant_experimentCategory/BMRBx:theoretical_coupling_constant_experiment">
      <BMRBo:has_theoretical_coupling_constant_experiment>
      <BMRBo:theoretical_coupling_constant_experiment rdf:about="{$base}/theoretical_coupling_constant_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_coupling_constant_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_coupling_constant_experiment>
      </BMRBo:has_theoretical_coupling_constant_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_coupling_constant_listCategory/BMRBx:theoretical_coupling_constant_list">
      <BMRBo:has_theoretical_coupling_constant_list>
      <BMRBo:theoretical_coupling_constant_list rdf:about="{$base}/theoretical_coupling_constant_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_coupling_constant_list rdf:resource="{$base}/theoretical_coupling_constant_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_290_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_coupling_constant_list>
      </BMRBo:has_theoretical_coupling_constant_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_coupling_constant_softwareCategory/BMRBx:theoretical_coupling_constant_software">
      <BMRBo:has_theoretical_coupling_constant_software>
      <BMRBo:theoretical_coupling_constant_software rdf:about="{$base}/theoretical_coupling_constant_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_coupling_constant_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_coupling_constant_software>
      </BMRBo:has_theoretical_coupling_constant_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_cross_correlation_ddCategory/BMRBx:theoretical_cross_correlation_dd">
      <BMRBo:has_theoretical_cross_correlation_dd>
      <BMRBo:theoretical_cross_correlation_dd rdf:about="{$base}/theoretical_cross_correlation_dd/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_cross_correlation_dd rdf:resource="{$base}/theoretical_cross_correlation_dd/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_291_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_cross_correlation_dd>
      </BMRBo:has_theoretical_cross_correlation_dd>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_cross_correlation_dd_experimentCategory/BMRBx:theoretical_cross_correlation_dd_experiment">
      <BMRBo:has_theoretical_cross_correlation_dd_experiment>
      <BMRBo:theoretical_cross_correlation_dd_experiment rdf:about="{$base}/theoretical_cross_correlation_dd_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_cross_correlation_dd_experiment rdf:resource="{$base}/theoretical_cross_correlation_dd_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_292_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_cross_correlation_dd_experiment>
      </BMRBo:has_theoretical_cross_correlation_dd_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_cross_correlation_dd_listCategory/BMRBx:theoretical_cross_correlation_dd_list">
      <BMRBo:has_theoretical_cross_correlation_dd_list>
      <BMRBo:theoretical_cross_correlation_dd_list rdf:about="{$base}/theoretical_cross_correlation_dd_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_cross_correlation_dd_list rdf:resource="{$base}/theoretical_cross_correlation_dd_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_293_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_cross_correlation_dd_list>
      </BMRBo:has_theoretical_cross_correlation_dd_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_cross_correlation_dd_softwareCategory/BMRBx:theoretical_cross_correlation_dd_software">
      <BMRBo:has_theoretical_cross_correlation_dd_software>
      <BMRBo:theoretical_cross_correlation_dd_software rdf:about="{$base}/theoretical_cross_correlation_dd_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_cross_correlation_dd_software rdf:resource="{$base}/theoretical_cross_correlation_dd_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_cross_correlation_dd_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_294_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_cross_correlation_dd_software>
      </BMRBo:has_theoretical_cross_correlation_dd_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_noeCategory/BMRBx:theoretical_heteronucl_noe">
      <BMRBo:has_theoretical_heteronucl_noe>
      <BMRBo:theoretical_heteronucl_noe rdf:about="{$base}/theoretical_heteronucl_noe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_noe_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_noe rdf:resource="{$base}/theoretical_heteronucl_noe/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_noe_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_295_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_noe>
      </BMRBo:has_theoretical_heteronucl_noe>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_noe_experimentCategory/BMRBx:theoretical_heteronucl_noe_experiment">
      <BMRBo:has_theoretical_heteronucl_noe_experiment>
      <BMRBo:theoretical_heteronucl_noe_experiment rdf:about="{$base}/theoretical_heteronucl_noe_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_noe_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_noe_experiment rdf:resource="{$base}/theoretical_heteronucl_noe_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_noe_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_296_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_noe_experiment>
      </BMRBo:has_theoretical_heteronucl_noe_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_noe_listCategory/BMRBx:theoretical_heteronucl_noe_list">
      <BMRBo:has_theoretical_heteronucl_noe_list>
      <BMRBo:theoretical_heteronucl_noe_list rdf:about="{$base}/theoretical_heteronucl_noe_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_noe_list rdf:resource="{$base}/theoretical_heteronucl_noe_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_297_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_noe_list>
      </BMRBo:has_theoretical_heteronucl_noe_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_noe_softwareCategory/BMRBx:theoretical_heteronucl_noe_software">
      <BMRBo:has_theoretical_heteronucl_noe_software>
      <BMRBo:theoretical_heteronucl_noe_software rdf:about="{$base}/theoretical_heteronucl_noe_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_noe_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_noe_software rdf:resource="{$base}/theoretical_heteronucl_noe_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_noe_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_298_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_noe_software>
      </BMRBo:has_theoretical_heteronucl_noe_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_t1_experimentCategory/BMRBx:theoretical_heteronucl_t1_experiment">
      <BMRBo:has_theoretical_heteronucl_t1_experiment>
      <BMRBo:theoretical_heteronucl_t1_experiment rdf:about="{$base}/theoretical_heteronucl_t1_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t1_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_t1_experiment rdf:resource="{$base}/theoretical_heteronucl_t1_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t1_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_299_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_t1_experiment>
      </BMRBo:has_theoretical_heteronucl_t1_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_t1_listCategory/BMRBx:theoretical_heteronucl_t1_list">
      <BMRBo:has_theoretical_heteronucl_t1_list>
      <BMRBo:theoretical_heteronucl_t1_list rdf:about="{$base}/theoretical_heteronucl_t1_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_t1_list rdf:resource="{$base}/theoretical_heteronucl_t1_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_300_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_t1_list>
      </BMRBo:has_theoretical_heteronucl_t1_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_t1_softwareCategory/BMRBx:theoretical_heteronucl_t1_software">
      <BMRBo:has_theoretical_heteronucl_t1_software>
      <BMRBo:theoretical_heteronucl_t1_software rdf:about="{$base}/theoretical_heteronucl_t1_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t1_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_t1_software rdf:resource="{$base}/theoretical_heteronucl_t1_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t1_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_301_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_t1_software>
      </BMRBo:has_theoretical_heteronucl_t1_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_t2_experimentCategory/BMRBx:theoretical_heteronucl_t2_experiment">
      <BMRBo:has_theoretical_heteronucl_t2_experiment>
      <BMRBo:theoretical_heteronucl_t2_experiment rdf:about="{$base}/theoretical_heteronucl_t2_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t2_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_t2_experiment rdf:resource="{$base}/theoretical_heteronucl_t2_experiment/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t2_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_302_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_t2_experiment>
      </BMRBo:has_theoretical_heteronucl_t2_experiment>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_t2_listCategory/BMRBx:theoretical_heteronucl_t2_list">
      <BMRBo:has_theoretical_heteronucl_t2_list>
      <BMRBo:theoretical_heteronucl_t2_list rdf:about="{$base}/theoretical_heteronucl_t2_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_t2_list rdf:resource="{$base}/theoretical_heteronucl_t2_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_303_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_t2_list>
      </BMRBo:has_theoretical_heteronucl_t2_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_heteronucl_t2_softwareCategory/BMRBx:theoretical_heteronucl_t2_software">
      <BMRBo:has_theoretical_heteronucl_t2_software>
      <BMRBo:theoretical_heteronucl_t2_software rdf:about="{$base}/theoretical_heteronucl_t2_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t2_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_heteronucl_t2_software rdf:resource="{$base}/theoretical_heteronucl_t2_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t2_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_304_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_heteronucl_t2_software>
      </BMRBo:has_theoretical_heteronucl_t2_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_t1Category/BMRBx:theoretical_t1">
      <BMRBo:has_theoretical_t1>
      <BMRBo:theoretical_t1 rdf:about="{$base}/theoretical_t1/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t1_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_t1 rdf:resource="{$base}/theoretical_t1/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t1_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_305_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_t1>
      </BMRBo:has_theoretical_t1>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:theoretical_t2Category/BMRBx:theoretical_t2">
      <BMRBo:has_theoretical_t2>
      <BMRBo:theoretical_t2 rdf:about="{$base}/theoretical_t2/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t2_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_theoretical_t2 rdf:resource="{$base}/theoretical_t2/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@theoretical_heteronucl_t2_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_306_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:theoretical_t2>
      </BMRBo:has_theoretical_t2>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:torsion_angleCategory/BMRBx:torsion_angle">
      <BMRBo:has_torsion_angle>
      <BMRBo:torsion_angle rdf:about="{$base}/torsion_angle/{translate(@assembly_id,' []@#%+&amp;','_()a....')},{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:torsion_angle>
      </BMRBo:has_torsion_angle>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:torsion_angle_constraintCategory/BMRBx:torsion_angle_constraint">
      <BMRBo:has_torsion_angle_constraint>
      <BMRBo:torsion_angle_constraint rdf:about="{$base}/torsion_angle_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_torsion_angle_constraint rdf:resource="{$base}/torsion_angle_constraint/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_307_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:torsion_angle_constraint>
      </BMRBo:has_torsion_angle_constraint>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:torsion_angle_constraint_listCategory/BMRBx:torsion_angle_constraint_list">
      <BMRBo:has_torsion_angle_constraint_list>
      <BMRBo:torsion_angle_constraint_list rdf:about="{$base}/torsion_angle_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_torsion_angle_constraint_list rdf:resource="{$base}/torsion_angle_constraint_list/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_308_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:torsion_angle_constraint_list>
      </BMRBo:has_torsion_angle_constraint_list>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:torsion_angle_constraint_softwareCategory/BMRBx:torsion_angle_constraint_software">
      <BMRBo:has_torsion_angle_constraint_software>
      <BMRBo:torsion_angle_constraint_software rdf:about="{$base}/torsion_angle_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_torsion_angle_constraint_software rdf:resource="{$base}/torsion_angle_constraint_software/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_309_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:torsion_angle_constraint_software>
      </BMRBo:has_torsion_angle_constraint_software>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:torsion_angle_constraints_exptCategory/BMRBx:torsion_angle_constraints_expt">
      <BMRBo:has_torsion_angle_constraints_expt>
      <BMRBo:torsion_angle_constraints_expt rdf:about="{$base}/torsion_angle_constraints_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_torsion_angle_constraints_expt rdf:resource="{$base}/torsion_angle_constraints_expt/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@experiment_id,' []@#%+&amp;','_()a....')},{translate(@torsion_angle_constraint_list_id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_310_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:torsion_angle_constraints_expt>
      </BMRBo:has_torsion_angle_constraints_expt>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:vendorCategory/BMRBx:vendor">
      <BMRBo:has_vendor>
      <BMRBo:vendor rdf:about="{$base}/vendor/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@name,' []@#%+&amp;','_()a....')},{translate(@software_id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:vendor>
      </BMRBo:has_vendor>
  </xsl:template>


  <xsl:template match="BMRBx:datablock/BMRBx:xray_instrumentCategory/BMRBx:xray_instrument">
      <BMRBo:has_xray_instrument>
      <BMRBo:xray_instrument rdf:about="{$base}/xray_instrument/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}">
	<BMRBo:of_datablock rdf:resource="{$base}"/>
      <xsl:if test="@entry_id!=''">
	<BMRBo:reference_to_entry>
	  <rdf:Description  rdf:about="{$base}/entry/{translate(@entry_id,' []@#%+&amp;','_()a....')}">
	    <BMRBo:referenced_by_xray_instrument rdf:resource="{$base}/xray_instrument/{translate(@entry_id,' []@#%+&amp;','_()a....')},{translate(@id,' []@#%+&amp;','_()a....')}"/>
	  </rdf:Description>
	</BMRBo:reference_to_entry>
	    <!-- entryKeyref_0_0_311_0 -->
	
      </xsl:if>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="@*" mode="linked"/>
      <xsl:apply-templates/>
      <xsl:apply-templates mode="linked"/>
      </BMRBo:xray_instrument>
      </BMRBo:has_xray_instrument>
  </xsl:template>


  <xsl:template match="*[@xsi:nil='true']"/>
  <xsl:template match="*|text()|@*"/>
  <xsl:template match="*|text()|@*" mode="linked"/>
 
</xsl:stylesheet>