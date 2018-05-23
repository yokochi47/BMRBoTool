<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE rdf:RDF [
  <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#">
  <!ENTITY rdfs "http://www.w3.org/2000/01/rdf-schema#">
  <!ENTITY owl "http://www.w3.org/2002/07/owl#">
]>
<xsl2:stylesheet
   version="2.0"
   xmlns:xsl2="http://www.w3.org/1999/XSL/Transform"
   xmlns:xsd="http://www.w3.org/2001/XMLSchema">

  <xsl2:output method="xml" indent="yes"/>
  <xsl2:strip-space elements="*"/>

  <xsl2:template match="/">
    <xsl2:text disable-output-escaping="yes">
&lt;xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:BMRBx="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.xsd"
  xmlns:BMRBo="http://bmrbpub.protein.osaka-u.ac.jp/schema/mmcif_nmr-star.owl#"
  exclude-result-prefixes="BMRBx"&gt;
    </xsl2:text>
    <xsl2:apply-templates/>
    <xsl2:text disable-output-escaping="yes">
&lt;/xsl:stylesheet&gt;</xsl2:text>
  </xsl2:template>

  <xsl2:template match="/xsd:schema">
    <xsl2:text disable-output-escaping="yes">
  &lt;xsl:output method="xml" indent="yes"/&gt;
  &lt;xsl:strip-space elements="*"/&gt;
  &lt;xsl:variable name="entry_id"&gt;&lt;xsl:value-of select="/BMRBx:datablock/BMRBx:entryCategory/BMRBx:entry/@id"/&gt;&lt;/xsl:variable&gt;
  &lt;xsl:variable name="orcid"&gt;http://orcid.org/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="orcid-ident"&gt;http://identifiers.org/orcid/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="doi"&gt;http://dx.doi.org/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="doi-ident"&gt;http://identifiers.org/doi/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pubmed"&gt;http://rdf.ncbi.nlm.nih.gov/pubmed/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pubmed-ident"&gt;http://identifiers.org/pubmed/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="issn"&gt;http://www.worldcat.org/issn/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="issn-ident"&gt;http://identifiers.org/issn/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="isbn"&gt;http://www.isbnsearch.org/isbn/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="isbn-ident"&gt;http://identifiers.org/isbn/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="taxonomy"&gt;http://purl.uniprot.org/taxonomy/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="taxonomy-ident"&gt;http://identifiers.org/taxonomy/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="ec-code"&gt;http://enzyme.expasy.org/EC/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="ec-code-ident"&gt;http://identifiers.org/ec-code/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="uniprot"&gt;http://purl.uniprot.org/uniprot/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="uniprot-ident"&gt;http://identifiers.org/uniprot/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="ddbj"&gt;http://www.ncbi.nlm.nih.gov/protein/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="embl"&gt;http://www.ncbi.nlm.nih.gov/protein/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="genbank"&gt;http://www.ncbi.nlm.nih.gov/protein/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="ncbiprotein-ident"&gt;http://identifiers.org/ncbiprotein/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pir"&gt;http://www.ncbi.nlm.nih.gov/protein/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="prf"&gt;http://www.ncbi.nlm.nih.gov/protein/?term=prf+&lt;/xsl:variable&gt;
  &lt;xsl:variable name="refseq"&gt;http://www.ncbi.nlm.nih.gov/protein/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="refseq-ident"&gt;http://identifiers.org/refseq/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="scop"&gt;http://scop.berkeley.edu/sunid=&lt;/xsl:variable&gt;
  &lt;xsl:variable name="scop-ident"&gt;http://identifiers.org/scop/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pdb"&gt;https://rdf.wwpdb.org/pdb/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pdb-ident"&gt;http://identifiers.org/pdb/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pdb-ccd"&gt;https://rdf.wwpdb.org/cc/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pdb-ccd-ident"&gt;http://identifiers.org/pdb-ccd/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pdb.ligand"&gt;http://ligand-expo.rcsb.org/pyapps/ldHandler.py?formid=cc-index-search&amp;amp;operation=ccid&amp;amp;target=&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pdb.ligand-ident"&gt;http://identifiers.org/pdb.ligand/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pubchem.substance"&gt;http://rdf.ncbi.nlm.nih.gov/pubchem/substance/SID&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pubchem.substance-ident"&gt;http://identifiers.org/pubchem.substance/&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pubchem.compound"&gt;http://rdf.ncbi.nlm.nih.gov/pubchem/compound/CID&lt;/xsl:variable&gt;
  &lt;xsl:variable name="pubchem.compound-ident"&gt;http://identifiers.org/pubchem.compound/&lt;/xsl:variable&gt;

  &lt;xsl:variable name="base"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bms')"&gt;http://bmrbpub.protein.osaka-u.ac.jp/rdf/&lt;xsl:value-of select="$entry_id"/&gt;&lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;http://bmrbpub.protein.osaka-u.ac.jp/rdf/bmr&lt;xsl:value-of select="$entry_id"/&gt;&lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:variable&gt;

  &lt;xsl:variable name="bmrb"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bmse')"&gt;http://www.bmrb.wisc.edu/ftp/pub/bmrb/metabolomics/NMR_STAR_experimental_entries/&lt;/xsl:when&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bmst')"&gt;http://www.bmrb.wisc.edu/ftp/pub/bmrb/metabolomics/NMR_STAR_theoretical_entries/&lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;http://www.bmrb.wisc.edu/ftp/pub/bmrb/entry_lists/nmr-star3.1/bmr&lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:variable&gt;

  &lt;xsl:variable name="pdbj-bmrb"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bmse')"&gt;http://bmrb.pdbj.org/ftp/pub/bmrb/metabolomics/NMR_STAR_experimental_entries/&lt;/xsl:when&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bmst')"&gt;http://bmrb.pdbj.org/ftp/pub/bmrb/metabolomics/NMR_STAR_theoretical_entries/&lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;http://bmrb.pdbj.org/ftp/pub/bmrb/entry_lists/nmr-star3.1/bmr&lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:variable&gt;

  &lt;xsl:variable name="bmrb-cerm"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bmse')"&gt;http://bmrb.cerm.unifi.it/ftp/pub/bmrb/metabolomics/NMR_STAR_experimental_entries/&lt;/xsl:when&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bmst')"&gt;http://bmrb.cerm.unifi.it/ftp/pub/bmrb/metabolomics/NMR_STAR_theoretical_entries/&lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;http://bmrb.cerm.unifi.it/ftp/pub/bmrb/entry_lists/nmr-star3.1/bmr&lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:variable&gt;

  &lt;xsl:variable name="bmrbx"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bms')"&gt;http://bmrbpub.protein.osaka-u.ac.jp/xml/bms/&lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;http://bmrbpub.protein.osaka-u.ac.jp/xml/bmr/bmr&lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:variable&gt;

  &lt;xsl:variable name="bmrb_urn"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bms')"&gt;info:bmrb.metabolomics/&lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;info:bmrb/&lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:variable&gt;

  &lt;xsl:variable name="bmrb_url"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bms')"&gt;http://bmrbpub.protein.osaka-u.ac.jp/rdf/&lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;http://bmrbpub.protein.osaka-u.ac.jp/rdf/bmr&lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:variable&gt;

  &lt;xsl:variable name="pdbj-bmrbdep"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($entry_id, 'bms')"&gt;http://bmrbdep.pdbj.org/bms/&lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;http://bmrbdep.pdbj.org/bmr/bmr&lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:variable&gt;

  &lt;xsl:template match="/"&gt;
    &lt;rdf:RDF&gt;
      &lt;xsl:apply-templates/&gt;
    &lt;/rdf:RDF&gt;
  &lt;/xsl:template&gt;

  &lt;!-- level 1 --&gt;
  &lt;xsl:template match="/BMRBx:datablock"&gt;
    &lt;BMRBo:datablock rdf:about="{$base}" rdfs:label="{$bmrb_urn}{$entry_id}"&gt;
      &lt;rdfs:seeAlso rdf:resource="{$bmrbx}{$entry_id}-noatom.xml"/&gt;
      &lt;rdfs:seeAlso rdf:resource="{$bmrb}{$entry_id}.str"/&gt;
      &lt;rdfs:seeAlso rdf:resource="{$pdbj-bmrb}{$entry_id}.str"/&gt;
      &lt;rdfs:seeAlso rdf:resource="{$bmrb-cerm}{$entry_id}.str"/&gt;
      &lt;rdfs:seeAlso rdf:resource="{$pdbj-bmrbdep}{$entry_id}"/&gt;

      &lt;BMRBo:datablockName&gt;&lt;xsl:value-of select="@datablockName"/&gt;&lt;/BMRBo:datablockName&gt;
      &lt;xsl:apply-templates select="./*"/&gt;
    &lt;/BMRBo:datablock&gt;
  &lt;/xsl:template&gt;

  &lt;!-- level 2 --&gt;
  &lt;xsl:template match="/BMRBx:datablock/*"&gt;
    &lt;xsl:element name="BMRBo:has_{local-name(.)}"&gt;
      &lt;xsl:element name="BMRBo:{local-name(.)}"&gt;
	&lt;xsl:attribute name="rdf:about"&gt;
	  &lt;xsl:value-of select="concat($base,'/',local-name(.))"/&gt;
	&lt;/xsl:attribute&gt;
    &lt;xsl:apply-templates&gt;
      &lt;xsl:with-param name="base" select="$base"/&gt;
    &lt;/xsl:apply-templates&gt;
      &lt;/xsl:element&gt;
    &lt;/xsl:element&gt;
  &lt;/xsl:template&gt;

  &lt;!-- level 4 (element) --&gt;
  &lt;xsl:template match="/BMRBx:datablock/*/*/*[not(xsi:nil) and text() != '']"&gt;
    &lt;xsl:element name="BMRBo:{concat(local-name(parent::node()),'.',local-name())}"&gt;
      &lt;xsl:value-of select="."/&gt;
    &lt;/xsl:element&gt;
  &lt;/xsl:template&gt;

  &lt;!-- level 4 (attribute) --&gt;
  &lt;xsl:template match="/BMRBx:datablock/*/*/@*"&gt;
    &lt;xsl:element name="BMRBo:{concat(local-name(parent::node()),'.',translate(name(),'@',''))}"&gt;
      &lt;xsl:value-of select="."/&gt;
    &lt;/xsl:element&gt;
  &lt;/xsl:template&gt;

  &lt;!-- level 4 (linked data) --&gt;
  &lt;xsl:template match="BMRBx:entry_author/BMRBx:orcid[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$orcid}{text()}" rdfs:label="info:orcid/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$orcid-ident}{text()}" rdfs:label="urn:miriam:orcid:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:citation_author/BMRBx:orcid[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$orcid}{text()}" rdfs:label="info:orcid/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$orcid-ident}{text()}" rdfs:label="urn:miriam:orcid:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entry/BMRBx:doi[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$doi}{text()}" rdfs:label="info:doi/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$doi-ident}{text()}" rdfs:label="urn:miriam:doi:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:auxiliary_files/BMRBx:doi[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$doi}{text()}" rdfs:label="info:doi/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$doi-ident}{text()}" rdfs:label="urn:miriam:doi:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:citation/BMRBx:doi[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$doi}{text()}" rdfs:label="info:doi/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$doi-ident}{text()}" rdfs:label="urn:miriam:doi:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:citation/BMRBx:pubmed_id[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pubmed}{text()}" rdfs:label="info:pmid/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pubmed-ident}{text()}" rdfs:label="urn:miriam:pubmed:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:citation/BMRBx:journal_issn[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$issn}{text()}" rdfs:label="urn:ISSN:{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$issn-ident}{text()}" rdfs:label="urn:miriam:issn:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:citation/BMRBx:book_isbn[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$isbn}{text()}" rdfs:label="urn:ISBN:{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$isbn-ident}{text()}" rdfs:label="urn:miriam:isbn:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:citation/BMRBx:www_url[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_natural_src/BMRBx:ncbi_taxonomy_id[text() != '' and text() != 'na' and text() != 'n/a']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$taxonomy}{text()}" rdfs:label="info:taxonomy/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$taxonomy-ident}{text()}" rdfs:label="urn:miriam:taxonomy:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_experimental_src/BMRBx:host_org_ncbi_taxonomy_id[text() != '' and text() != 'na' and text() != 'n/a']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$taxonomy}{text()}" rdfs:label="info:taxonomy/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$taxonomy-ident}{text()}" rdfs:label="urn:miriam:taxonomy:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly/BMRBx:enzyme_commission_number[text() != '' and text() != 'na' and text() != 'n/a']" mode="linked"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="contains(text(), ',')"&gt;
        &lt;xsl:for-each select="tokenize(text(), ', ')"&gt;
          &lt;xsl:variable name="ec_number" select="."/&gt;
          &lt;rdfs:seeAlso rdf:resource="{$ec-code}{$ec_number}" rdfs:label="info:ec-code/{$ec_number}"/&gt;
          &lt;rdfs:seeAlso rdf:resource="{$ec-code-ident}{$ec_number}" rdfs:label="urn:miriam:ec-code:{$ec_number}"/&gt;
        &lt;/xsl:for-each&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$ec-code}{text()}" rdfs:label="info:ec-code/{text()}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$ec-code-ident}{text()}" rdfs:label="urn:miriam:ec-code:{text()}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_subsystem/BMRBx:enzyme_commission_number[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="contains(text(), ',')"&gt;
        &lt;xsl:for-each select="tokenize(text(), ', ')"&gt;
          &lt;xsl:variable name="ec_number" select="."/&gt;
          &lt;rdfs:seeAlso rdf:resource="{$ec-code}{$ec_number}" rdfs:label="info:ec-code/{$ec_number}"/&gt;
          &lt;rdfs:seeAlso rdf:resource="{$ec-code-ident}{$ec_number}" rdfs:label="urn:miriam:ec-code:{$ec_number}"/&gt;
        &lt;/xsl:for-each&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$ec-code}{text()}" rdfs:label="info:ec-code/{text()}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$ec-code-ident}{text()}" rdfs:label="urn:miriam:ec-code:{text()}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity/BMRBx:ec_number[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="contains(text(), ',')"&gt;
        &lt;xsl:for-each select="tokenize(text(), ', ')"&gt;
          &lt;xsl:variable name="ec_number" select="."/&gt;
          &lt;rdfs:seeAlso rdf:resource="{$ec-code}{$ec_number}" rdfs:label="info:ec-code/{$ec_number}"/&gt;
          &lt;rdfs:seeAlso rdf:resource="{$ec-code-ident}{$ec_number}" rdfs:label="urn:miriam:ec-code:{$ec_number}"/&gt;
        &lt;/xsl:for-each&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$ec-code}{text()}" rdfs:label="info:ec-code/{text()}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$ec-code-ident}{text()}" rdfs:label="urn:miriam:ec-code:{text()}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='SP']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$uniprot}{.}" rdfs:label="info:uniprot/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$uniprot-ident}{.}" rdfs:label="urn:miriam:uniprot:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='SP']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$uniprot}{.}" rdfs:label="info:uniprot/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$uniprot-ident}{.}" rdfs:label="urn:miriam:uniprot:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='SP']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$uniprot}{.}" rdfs:label="info:uniprot/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$uniprot-ident}{.}" rdfs:label="urn:miriam:uniprot:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='SP']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$uniprot}{.}" rdfs:label="info:uniprot/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$uniprot-ident}{.}" rdfs:label="urn:miriam:uniprot:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='DBJ']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ddbj}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='DBJ']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ddbj}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='DBJ']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ddbj}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='DBJ']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ddbj}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='EMBL']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$embl}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='EMBL']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$embl}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='EMBL']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$embl}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='EMBL']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$embl}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='GB']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$genbank}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='GB']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$genbank}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='GB']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$genbank}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='GB']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$genbank}{.}" rdfs:label="info:ddbj-embl-genbank/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$ncbiprotein-ident}{.}" rdfs:label="urn:miriam:ncbiprotein:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='PIR']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pir}{.}" rdfs:label="info:pir/{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='PIR']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pir}{.}" rdfs:label="info:pir/{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='PIR']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pir}{.}" rdfs:label="info:pir/{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='PIR']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pir}{.}" rdfs:label="info:pir/{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='PRF']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$prf}{.}" rdfs:label="info:prf/{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='PRF']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$prf}{.}" rdfs:label="info:prf/{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='PRF']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$prf}{.}" rdfs:label="info:prf/{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='PRF']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$prf}{.}" rdfs:label="info:prf/{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='REF']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$refseq}{.}" rdfs:label="info:refseq/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$refseq-ident}{.}" rdfs:label="urn:miriam:refseq:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='REF']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$refseq}{.}" rdfs:label="info:refseq/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$refseq-ident}{.}" rdfs:label="urn:miriam:refseq:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='REF']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$refseq}{.}" rdfs:label="info:refseq/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$refseq-ident}{.}" rdfs:label="urn:miriam:refseq:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='REF']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$refseq}{.}" rdfs:label="info:refseq/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$refseq-ident}{.}" rdfs:label="urn:miriam:refseq:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:struct_classification/BMRBx:sunid[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$scop}{text()}" rdfs:label="info:scop/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$scop-ident}{text()}" rdfs:label="urn:miriam:scop:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entry/BMRBx:assigned_pdb_id[text() != '']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:conformer_family_coord_set/BMRBx:pdb_accession_code[text() != '']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:representative_conformer/BMRBx:pdb_accession_code[text() != '']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:structure_annotation/BMRBx:pdb_id[text() != '']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:pb_list/BMRBx:pdb_id[text() != '']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{text()}" rdfs:label="info:pdb/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{text()}" rdfs:label="urn:miriam:pdb:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='PDB']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{.}" rdfs:label="info:pdb/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{.}" rdfs:label="urn:miriam:pdb:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='PDB']/@accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{.}" rdfs:label="info:pdb/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{.}" rdfs:label="urn:miriam:pdb:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='PDB']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{.}" rdfs:label="info:pdb/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{.}" rdfs:label="urn:miriam:pdb:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='PDB']/@database_accession_code" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb}{.}" rdfs:label="info:pdb/{.}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{.}" rdfs:label="urn:miriam:pdb:{.}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='BMRB']/@accession_code" mode="linked"&gt;
    &lt;xsl:variable name="bmrb_id" select="."/&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($bmrb_id, 'bms')"&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='BMRB']/@accession_code" mode="linked"&gt;
    &lt;xsl:variable name="bmrb_id" select="."/&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($bmrb_id, 'bms')"&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='BMRB']/@database_accession_code" mode="linked"&gt;
    &lt;xsl:variable name="bmrb_id" select="."/&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($bmrb_id, 'bms')"&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='BMRB']/@database_accession_code" mode="linked"&gt;
    &lt;xsl:variable name="bmrb_id" select="."/&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($bmrb_id, 'bms')"&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:assembly_db_link[@database_code='BMRB(withdrawn)']/@accession_code" mode="linked"&gt;
    &lt;xsl:variable name="bmrb_id" select="."/&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($bmrb_id, 'bms')"&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:entity_db_link[@database_code='BMRB(withdrawn)']/@accession_code" mode="linked"&gt;
    &lt;xsl:variable name="bmrb_id" select="."/&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($bmrb_id, 'bms')"&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:related_entries[@database_name='BMRB(withdrawn)']/@database_accession_code" mode="linked"&gt;
    &lt;xsl:variable name="bmrb_id" select="."/&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($bmrb_id, 'bms')"&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:matched_entries[@database_name='BMRB(withdrawn)']/@database_accession_code" mode="linked"&gt;
    &lt;xsl:variable name="bmrb_id" select="."/&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with($bmrb_id, 'bms')"&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb.metabolomics/{$bmrb_id}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$bmrb_url}{$bmrb_id}" rdfs:label="info:bmrb/{$bmrb_id}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:chem_comp/BMRBx:pdb_code[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;xsl:choose&gt;
      &lt;xsl:when test="starts-with(text(), 'pdb/')"&gt;
        &lt;xsl:variable name="pdb_code" select="substring-after(text(),'pdb/')"/&gt;
        &lt;xsl:variable name="cc_code" select="substring-after(text(),'chem_comp/')"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$pdb}{translate($pdb_code,' []@#%+&amp;amp;','_()a....')}" rdfs:label="info:pdb/{$pdb_code}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$pdb-ident}{translate($pdb_code,' []@#%+&amp;amp;','_()a....')}" rdfs:label="urn:miriam:pdb:{$pdb_code}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$pdb.ligand}{translate($cc_code,' []@#%+&amp;amp;','_()a....')}" rdfs:label="info:pdb.ligand/{$cc_code}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$pdb.ligand-ident}{translate($cc_code,' []@#%+&amp;amp;','_()a....')}" rdfs:label="urn:miriam:pdb.ligand:{$cc_code}"/&gt;
      &lt;/xsl:when&gt;
      &lt;xsl:when test="starts-with(text(), 'bmrb_ligand_expo/')"/&gt;
      &lt;xsl:when test="starts-with(text(), 'no_records/')"/&gt;
      &lt;xsl:otherwise&gt;
        &lt;rdfs:seeAlso rdf:resource="{$pdb-ccd}{translate(text(),' []@#%+&amp;amp;','_()a....')}" rdfs:label="info:pdb-ccd/{text()}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$pdb-ccd-ident}{translate(text(),' []@#%+&amp;amp;','_()a....')}" rdfs:label="urn:miriam:pdb-ccd:{text()}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$pdb.ligand}{translate(text(),' []@#%+&amp;amp;','_()a....')}" rdfs:label="info:pdb.ligand/{text()}"/&gt;
        &lt;rdfs:seeAlso rdf:resource="{$pdb.ligand-ident}{translate(text(),' []@#%+&amp;amp;','_()a....')}" rdfs:label="urn:miriam:pdb.ligand:{text()}"/&gt;
      &lt;/xsl:otherwise&gt;
    &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:chem_comp/BMRBx:pubchem_code[text() != '' and text() != 'na']" mode="linked"&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pubchem.substance}{text()}" rdfs:label="info:pubchem.substance/{text()}"/&gt;
    &lt;rdfs:seeAlso rdf:resource="{$pubchem.substance-ident}{text()}" rdfs:label="urn:miriam:pubchem.substance:{text()}"/&gt;
  &lt;/xsl:template&gt;

  &lt;xsl:template match="BMRBx:chem_comp_db_link[@database_code='PubChem' and @accession_code != '' and @accession_code != 'na']/BMRBx:accession_code_type" mode="linked"&gt;
    &lt;xsl:variable name="pubchem_id" select="../@accession_code"/&gt;
    &lt;xsl:if test="text()='sid'"&gt;
       &lt;rdfs:seeAlso rdf:resource="{$pubchem.substance}{$pubchem_id}" rdfs:label="info:pubchem.substance/{$pubchem_id}"/&gt;
       &lt;rdfs:seeAlso rdf:resource="{$pubchem.substance-ident}{$pubchem_id}" rdfs:label="urn:miriam:pubchem.substance:{$pubchem_id}"/&gt;
    &lt;/xsl:if&gt;
    &lt;xsl:if test="text()='cid'"&gt;
       &lt;rdfs:seeAlso rdf:resource="{$pubchem.compound}{$pubchem_id}" rdfs:label="info:pubchem.compound/{$pubchem_id}"/&gt;
       &lt;rdfs:seeAlso rdf:resource="{$pubchem.compound-ident}{$pubchem_id}" rdfs:label="urn:miriam:pubchem.compound:{$pubchem_id}"/&gt;
    &lt;/xsl:if&gt;
  &lt;/xsl:template&gt;

  &lt;!-- level 3 (templates follow) --&gt;
    </xsl2:text>
    <xsl2:call-template name="key_category"/>
    <xsl2:text disable-output-escaping="yes">
  &lt;xsl:template match="*[@xsi:nil='true']"/&gt;
  &lt;xsl:template match="*|text()|@*"/&gt;
  &lt;xsl:template match="*|text()|@*" mode="linked"/&gt;
 </xsl2:text>

  </xsl2:template>

  <xsl2:template name="check_fields">
    <xsl2:param name="field"/><xsl2:value-of select="$field/@xpath"/>!=''<xsl2:if test="$field/following-sibling::node()[1]/@xpath != ''"><xsl2:text> and </xsl2:text><xsl2:call-template name="check_fields"><xsl2:with-param name="field" select="$field/following-sibling::node()[1]"/></xsl2:call-template></xsl2:if>
  </xsl2:template>

  <xsl2:template name="concat_fields">
    <xsl2:param name="selector"/><xsl2:param name="field"/>{translate(<xsl2:value-of select="$field/@xpath"/>,' []@#%+&amp;','_()a....')}<xsl2:if test="$field/following-sibling::node()[1]/@xpath != ''"><xsl2:text>,</xsl2:text><xsl2:call-template name="concat_fields"><xsl2:with-param name="selector" select="$selector"/><xsl2:with-param name="field" select="$field/following-sibling::node()[1]"/></xsl2:call-template></xsl2:if>
  </xsl2:template>

  <xsl2:template name="concat_fields2">
    <xsl2:param name="field1"/><xsl2:param name="selector2"/><xsl2:param name="field2"/>{translate(<xsl2:value-of select="$field1/@xpath"/>,' []@#%+&amp;','_()a....')}<xsl2:if test="$field1/following-sibling::node()[1]/@xpath != ''"><xsl2:text>,</xsl2:text><xsl2:call-template name="concat_fields2"><xsl2:with-param name="field1" select="$field1/following-sibling::node()[1]"/><xsl2:with-param name="selector2" select="$selector2"/><xsl2:with-param name="field2" select="$field2/following-sibling::node()[1]"/></xsl2:call-template></xsl2:if>
  </xsl2:template>

  <xsl2:template name="key_category">
    <xsl2:for-each select="/xsd:schema/xsd:element[@name='datablock']/xsd:key">
      <!--<xsl2:call-template name="key_items"/>-->
      <!-- removing bulky categories -->
      <xsl2:choose>
	<xsl2:when test="./xsd:selector/@xpath = 'BMRBx:entityCategory/BMRBx:polymer_seq_one_letter_code_can'"/>
	<xsl2:when test="./xsd:selector/@xpath = 'BMRBx:entityCategory/BMRBx:polymer_seq_one_letter_code'"/>
	<xsl2:otherwise>
	  <xsl2:call-template name="key_items"/>
	</xsl2:otherwise>
      </xsl2:choose>
    </xsl2:for-each>
  </xsl2:template>

  <xsl2:template name="key_items">
    <xsl2:variable name="key" select="@name"/>
    <xsl2:variable name="name" select="substring-after(xsd:selector/@xpath,'/BMRBx:')"/>
    <xsl2:variable name="docpath">BMRBx:datablock/BMRBx:<xsl2:value-of select="$name"/>Category/BMRBx:<xsl2:value-of select="$name"/></xsl2:variable>
    <xsl2:variable name="resource"><xsl2:value-of select="$name"/>/<xsl2:call-template name="concat_fields">
	<xsl2:with-param name="selector" select="$name"/>
	<xsl2:with-param name="field" select="xsd:field[1]"/></xsl2:call-template></xsl2:variable>
    <xsl2:text disable-output-escaping="yes">
  &lt;xsl:template match=&quot;</xsl2:text><xsl2:value-of select="$docpath"/><xsl2:text disable-output-escaping="yes">&quot;&gt;</xsl2:text>
    <xsl2:text disable-output-escaping="yes">
      &lt;</xsl2:text>BMRBo:has_<xsl2:value-of select='$name'/><xsl2:text disable-output-escaping="yes">&gt;</xsl2:text>
    <xsl2:text disable-output-escaping="yes">
      &lt;</xsl2:text>BMRBo:<xsl2:value-of select='$name'/> rdf:about="{$base}/<xsl2:value-of select='$resource'/>"<xsl2:text disable-output-escaping="yes">&gt;
	&lt;BMRBo:of_datablock rdf:resource="{$base}"/&gt;</xsl2:text>
    <xsl2:call-template name="category_unique">
      <xsl2:with-param name="name" select="$name"/>
      <xsl2:with-param name="original" select="$resource"/>
    </xsl2:call-template>
    <xsl2:call-template name="category_keyref">
      <xsl2:with-param name="name" select="$name"/>
      <xsl2:with-param name="pathname" select="$resource"/>
    </xsl2:call-template>
    <xsl2:text disable-output-escaping="yes">
      &lt;xsl:apply-templates select="@*"/&gt;
      &lt;xsl:apply-templates select="@*" mode="linked"/&gt;
      &lt;xsl:apply-templates/&gt;
      &lt;xsl:apply-templates mode="linked"/&gt;</xsl2:text>
    <xsl2:text disable-output-escaping="yes">
      &lt;</xsl2:text>/BMRBo:<xsl2:value-of select='$name'/><xsl2:text disable-output-escaping="yes">&gt;</xsl2:text>
    <xsl2:text disable-output-escaping="yes">
      &lt;</xsl2:text>/BMRBo:has_<xsl2:value-of select='$name'/><xsl2:text disable-output-escaping="yes">&gt;</xsl2:text>
    <xsl2:text disable-output-escaping="yes">
  &lt;/xsl:template&gt;

</xsl2:text>
  </xsl2:template>

  <xsl2:template name="category_unique">
    <xsl2:param name="name"/>
    <xsl2:param name="original"/>
    <xsl2:variable name="xpath">BMRBx:<xsl2:value-of select="$name"/>Category/BMRBx:<xsl2:value-of select="$name"/></xsl2:variable>
    <xsl2:for-each select="/xsd:schema/xsd:element[@name='datablock']/xsd:unique[xsd:selector/@xpath=$xpath]|/xsd:schema/xsd:element[@name='datablock']/xsd:key[xsd:selector/@xpath=$xpath]">
      <xsl2:variable name="resource"><xsl2:value-of select="$name"/>/<xsl2:call-template name="concat_fields">
	  <xsl2:with-param name="selector" select="substring-after(xsd:selector/@xpath,'/BMRBx:')"/>
	  <xsl2:with-param name="field" select="xsd:field[1]"/></xsl2:call-template></xsl2:variable>
      <!-- don't want duplicate key -->
      <xsl2:if test="$original != $resource">
	<xsl2:variable name="check"><xsl2:call-template name="check_fields"><xsl2:with-param name="field" select="xsd:field[1]"/></xsl2:call-template></xsl2:variable>
	<xsl2:text disable-output-escaping="yes">
      &lt;xsl:if test=</xsl2:text>"<xsl2:value-of select='$check'/>"<xsl2:text disable-output-escaping='yes'>&gt;
	&lt;owl:sameAs&gt;</xsl2:text>
	<xsl2:text disable-output-escaping="yes">
	  &lt;</xsl2:text>BMRBo:<xsl2:value-of select="$name"/> rdf:about="{$base}/<xsl2:value-of select='$resource'/>"<xsl2:text disable-output-escaping="yes">&gt;</xsl2:text>
	<xsl2:text disable-output-escaping="yes">
	    &lt;rdfs:label&gt;</xsl2:text>
	<xsl2:value-of select="@name"/>
	<xsl2:text disable-output-escaping="yes">&lt;/rdfs:label&gt;</xsl2:text>
	<xsl2:text disable-output-escaping="yes">
	  &lt;</xsl2:text>/BMRBo:<xsl2:value-of select="$name"/><xsl2:text disable-output-escaping="yes">&gt;</xsl2:text>
	<xsl2:text disable-output-escaping="yes">
	&lt;/owl:sameAs&gt;</xsl2:text>
	<xsl2:text disable-output-escaping="yes">
      &lt;/xsl:if&gt;</xsl2:text>
      </xsl2:if>
    </xsl2:for-each>
  </xsl2:template>

  <xsl2:template name="category_keyref">
    <xsl2:param name="name"/>
    <xsl2:param name="pathname"/>
    <xsl2:variable name="xpath">BMRBx:<xsl2:value-of select="$name"/>Category/BMRBx:<xsl2:value-of select="$name"/></xsl2:variable>
    <xsl2:for-each select="/xsd:schema/xsd:element[@name='datablock']/xsd:keyref[xsd:selector/@xpath=$xpath]">
      <xsl2:variable name="refering" select="."/>
      <xsl2:variable name="keyname" select="substring-after($refering/@refer,':')"/>
      <xsl2:variable name="refer" select="../xsd:key[@name=$keyname] | ../xsd:unique[@name=$keyname]"/>
      <xsl2:variable name="refname" select="replace($refer/xsd:selector/@xpath,'.*/BMRBx:','')"/>
	<xsl2:variable name="resource"><xsl2:value-of select="$refname"/>/<xsl2:call-template name="concat_fields2">
	    <xsl2:with-param name="field1" select="$refering/xsd:field[1]"/>
	    <xsl2:with-param name="selector2" select="substring-after($refer/xsd:selector/@xpath,'/')"/>
	    <xsl2:with-param name="field2" select="$refer/xsd:field[1]"/></xsl2:call-template></xsl2:variable>
      <xsl2:variable name="check"><xsl2:call-template name="check_fields"><xsl2:with-param name="field" select="$refering/xsd:field[1]"/></xsl2:call-template></xsl2:variable>

	<xsl2:text disable-output-escaping="yes">
      &lt;xsl:if test=</xsl2:text>"<xsl2:value-of select='$check'/>"<xsl2:text disable-output-escaping='yes'>&gt;
	&lt;</xsl2:text>BMRBo:reference_to_<xsl2:value-of select="$refname"/><xsl2:text disable-output-escaping="yes">&gt;
	  &lt;</xsl2:text>rdf:Description  rdf:about="{$base}/<xsl2:value-of select='$resource'/>"<xsl2:text disable-output-escaping="yes">&gt;
	    &lt;</xsl2:text>BMRBo:referenced_by_<xsl2:value-of select="$name"/> rdf:resource="{$base}/<xsl2:value-of select='$pathname'/>"<xsl2:text disable-output-escaping="yes">/&gt;
	  &lt;</xsl2:text>/rdf:Description<xsl2:text disable-output-escaping="yes">&gt;
	&lt;</xsl2:text>/BMRBo:reference_to_<xsl2:value-of select="$refname"/><xsl2:text disable-output-escaping="yes">&gt;</xsl2:text>
	<xsl2:text disable-output-escaping="yes">
	    &lt;!-- </xsl2:text>
	<xsl2:value-of select="@name"/>
	<xsl2:text disable-output-escaping="yes"> --&gt;
	</xsl2:text>
	<xsl2:text disable-output-escaping="yes">
      &lt;/xsl:if&gt;</xsl2:text>
    </xsl2:for-each>
  </xsl2:template>

  <xsl2:template match="*|text()|@*"/>

</xsl2:stylesheet>
