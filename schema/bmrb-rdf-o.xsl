<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
   version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:BMRBo="http://bmrbpub.pdbj.org/schema/mmcif_nmr-star.owl#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
   xmlns:owl="http://www.w3.org/2002/07/owl#"
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:skos="http://www.w3.org/2004/02/skos/core#"
>
  <xsl:output method="html" indent="yes"/>

  <xsl:strip-space elements="*"/>
  <xsl:variable name="BMRBo">http://bmrbpub.pdbj.org/schema/mmcif_nmr-star.owl#</xsl:variable>
  <xsl:variable name="BMRBr" select="'http://bmrbpub.pdbj.org/rdf/'" />
  <xsl:variable name="rdf">http://www.w3.org/1999/02/22-rdf-syntax-ns#</xsl:variable>
  <xsl:variable name="rdfs">http://www.w3.org/2000/01/rdf-schema#</xsl:variable>
  <xsl:variable name="owl">http://www.w3.org/2002/07/owl#</xsl:variable>
  <xsl:variable name="dc">http://purl.org/dc/elements/1.1/</xsl:variable>
  <xsl:variable name="dcterms">http://purl.org/dc/terms/</xsl:variable>
  <xsl:variable name="skos">http://www.w3.org/2004/02/skos/core#</xsl:variable>

  <xsl:template name="string-replace">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:value-of select="substring-after($text,$replace)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/rdf:RDF">
    <xsl:variable name="object" select="./rdf:Description/*[1]/text()" />
<!--
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <title>BMRBj - BMRB/RDF Search: Result - <xsl:value-of select="rdf:Description/@rdf:about" /></title>
    <base href="https://bmrbpub.pdbj.org/" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />

    <meta name="keywords" content="BioMagResBank,BMRB,BMRBj,PDBj-BMRB,CERM-BMRB,wwPDB,RCSB-PDB,PDBj,NBDC,NMR-STAR,BMRB/XML,BMRB/RDF,BMRB/JSON" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Search results for the object of BMRB/RDF" />
    <meta name="author" content="BMRBj" />

    <link rel="icon" type="image/x-icon" href="favicon.ico" />

    <!-- Le styles -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/custom-theme/jquery-ui-1.10.0.custom.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lt IE 9]>
    <link rel="stylesheet" href="css/custom-theme/jquery.ui.1.10.0.ie.css" />
    <![endif]-->
    <link rel="stylesheet" href="assets/css/docs.css" />
    <link rel="stylesheet" href="assets/js/google-code-prettify/prettify.css" />

    <link rel="stylesheet" href="assets/css/codemirror.css" />

    <script src="assets/js/codemirror.js"></script>
    <script src="assets/js/mode/xml.js"></script>

    <script src="assets/js/resize_frame.js"></script>
    <script src="assets/js/post_form.js"></script>
    <link rel="stylesheet" href="assets/css/example.css" />

</head>
<body>
<!-- Header
================================================== -->
<header class="jumbotron subhead" id="overview">
    <div class="container">
        <h2>BMRBj/ Data Server:</h2>
        <p class="lead">common open representations of BMRB NMR-STAR data in XML, RDF and JSON formats</p>
    </div>
</header>

<!-- Navbar
================================================== -->
<div class="navbar navbar-default" role="navigation">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li>
                        <a href="https://bmrbpub.pdbj.org/">Home</a>
                    </li>
                    <li class="active">
                        <a href="search.html">Search</a>
                    </li>
                    <li>
                        <a href="examples.html">Examples</a>
                    </li>
                    <li>
                        <a href="download.html">Download</a>
                    </li>
                    <li>
                        <a href="resources.html">Resources</a>
                    </li>
                    <li>
                        <a href="news.html">NEWS</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="container">

<br />
<!-- Prefixes of BMRB/RDF
================================================== -->
<div class="span7">
    <div class="alert alert-info">
        <span class="icon-info-sign"></span>  Prefixes of BMRB/RDF
        <span class="small">
    <ul>
        <li>rdf:  &lt;<a href="http://www.w3.org/1999/02/22-rdf-syntax-ns#">http://www.w3.org/1999/02/22-rdf-syntax-ns#</a>&gt;</li>
        <li>rdfs:  &lt;<a href="http://www.w3.org/2000/01/rdf-schema#">http://www.w3.org/2000/01/rdf-schema#</a>&gt;</li>
        <li>owl:  &lt;<a href="http://www.w3.org/2002/07/owl#">http://www.w3.org/2002/07/owl#</a>&gt;</li>
        <li>dc: &lt;<a href="http://purl.org/dc/elements/1.1/">http://purl.org/dc/elements/1.1/</a>&gt;</li>
        <li>dcterms: &lt;<a href="http://purl.org/dc/terms/">http://purl.org/dc/terms/</a>&gt;</li>
        <li>skos: &lt;<a href="http://www.w3.org/2004/02/skos/core#">http://www.w3.org/2004/02/skos/core#</a>&gt;</li>
        <li>BMRBo:  &lt;<a href="http://bmrbpub.pdbj.org/schema/mmcif_nmr-star.owl#">http://bmrbpub.pdbj.org/schema/mmcif_nmr-star.owl#</a>&gt;</li>
        <li>BMRBr:  &lt;<a href="http://bmrbpub.pdbj.org/rdf/">http://bmrbpub.pdbj.org/rdf/</a>&gt;</li>
    </ul>
        </span>
    </div>
</div>

<div class="span12">
<!-- Search: Found
================================================== -->
<section id="search_result_found">
    <h4><xsl:value-of select="concat('Result of the Query: ', $object, ' (Object)')" /></h4>
    <table class="table table-bordered table-striped table-hover">
        <thead>
            <tr>
                <th>Subject</th>
                <th>Predicate</th>
                <th>Object</th>
            </tr>
        </thead>
        <tbody>
            <xsl:apply-templates/>
        </tbody>
    </table>
</section>

<!-- Entry ID Search
================================================== -->
<section id="search_bmrb">
    <div class="page-header">
        <h4>Search BMRB Entries</h4>
    </div>
    <div class="row-fluid">
        <form method="get" action="entry_id_search.php" name="entry_id">
        <div class="ui-widget">
            <label for="entry_id">Entry ID:</label>
            <input name="entry_id" id="entry_id" value="" class="ui-widget-content ui-corner-all" />&#160;<input type="submit" class="button" value="Submit" />
            <label><span class="xsmall">bmr+entry_id (e.g. bmr15400), bmse+entry_id (e.g. bmse000400), bmst+entry_id (e.g. bmst000200)</span></label>
        </div>
        </form>
    </div>
</section>

<!-- Search BMRB/RDF
================================================== -->
<section id="search_bmrb-rdf">
    <div class="page-header">
        <h4>Search BMRB/RDF</h4>
    </div>
    <div class="row-fluid">
        <table border="0" cellpadding="8">
        <tr align="left">
        <td>
        <form method="get" action="rdf/subject_search.php" name="subject">
        <div class="ui-widget">
            <label for="subject">Subject: <b>http://bmrbpub.pdbj.org/rdf/</b></label>
            <input name="subject" id="subject" value="" class="ui-widget-content ui-corner-all" />&#160;<input type="submit" class="button" value="Submit" />
            <label><span class="xsmall">bmr+entry_id/description (e.g. bmr15400/chem_compCategory, bmse000400/atom_chem_shiftCategory).</span></label>
        </div>
        </form>
        </td>
        <td><span class="xsmall">
        XSLT code for converting BMRB/XML to BMRB/RDF:<br />
        <a href="https://bmrbpub.pdbj.org/schema/bmrbx2rdf.xsl.gz">bmrbx2rdf.xsl.gz</a>
        </span>
        </td>
        </tr>
        </table>
        <table border="0" cellpadding="8">
        <tr align="left">
        <td>
        <form method="get" action="predicate_search.php" name="property">
        <div class="ui-widget">
            <label for="predicate">Predicate: <b>BMRBo:</b></label>
            <input name="predicate" id="predicate" value="" class="ui-widget-content ui-corner-all" />&#160;<input type="submit" class="button" value="Submit" />
            <label><span class="xsmall">Refer to <a href="http://bmrbpub.pdbj.org/schema/mmcif_nmr-star.owl">BMRB/OWL</a> (e.g. datablockName, has_chem_compCategory).</span></label>
        </div>
        </form>
        </td>
        <td>
        <form method="get" action="object_search.php" name="object">
        <div class="ui-widget">
            <label for="object">Object:</label>
            <input name="object" id="object" value="" class="ui-widget-content ui-corner-all" />&#160;<input type="submit" class="button" value="Submit" />
            <label><span class="xsmall">Please enter URI or keyword (e.g. water).</span></label>
        </div>
        </form>
        </td>
        </tr>
        </table>
    </div>
</section>

</div>
</div>

<hr />

<div class="container">
<div class="row">
    <div class="span3">
        <h3><span class="icon-envelope"></span>&#160;<a><xsl:attribute name="href"><xsl:value-of select="concat('mailto:bmrbhelp@protein.osaka-u.ac.jp?subject=Feedback URL:https://bmrbpub.pdbj.org/object_search.php?object=', $object)" /></xsl:attribute>Contact Us</a></h3>
    </div>
    <div class="span9">
    <table id="footer" border="0" callpadding="16" cellspacing="16" align="center">
    <tr>
        <td><a href="https://bmrb.io"><img src="images/bmrb.svg" alt="BMRB" width="120" height="60" hspace="0" /></a></td>
        <td><a href="https://bmrbj.pdbj.org"><img src="images/bmrbj.png" alt="BMRBj" width="120" height="60" hspace="0" /></a></td>
        <td><a href="https://pdbj.org"><img src="images/pdbj.png" alt="PDBj" /></a></td>
        <td><a href="https://www.wwpdb.org"><img src="images/wwpdb.png" alt="wwPDB" /></a></td>
        <td><a href="https://biosciencedbc.jp/en/"><img src="images/nbdc.png" alt="NBDC" /></a></td>
    </tr>
    </table>
    </div>
</div>
</div>

<!-- Placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery-1.9.0.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-ui-1.10.0.custom.min.js"></script>
<script src="assets/js/google-code-prettify/prettify.js"></script>
<script src="assets/js/docs.js"></script>
<script src="assets/js/search.js"></script>
<script src="assets/js/example.js"></script>
</body>
</html>
  </xsl:template>

  <xsl:template match="rdf:Description">
    <tr>
      <td><a href="{@rdf:about}">
          <xsl:variable name="shortname">
            <xsl:call-template name="string-replace">
              <xsl:with-param name="text" select="@rdf:about" />
              <xsl:with-param name="replace" select="$BMRBr" />
              <xsl:with-param name="by" select="'BMRBr:'" />
            </xsl:call-template>
          </xsl:variable>
          <xsl:value-of select="$shortname"/>
          </a>
      </td>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="rdf:type">
    <td>
      <a href="{$rdf}type" target="predicate">rdf:type</a>
    </td>
    <td>
      <xsl:variable name="shortname">
        <xsl:call-template name="string-replace">
          <xsl:with-param name="text" select="@rdf:resource" />
          <xsl:with-param name="replace" select="$BMRBo" />
          <xsl:with-param name="by" select="'BMRBo:'" />
        </xsl:call-template>
      </xsl:variable>
      <a href="{@rdf:resource}"><xsl:value-of select="$shortname"/></a>
    </td>
  </xsl:template>

  <xsl:template match="rdfs:*">
    <td>
      <a href="{$rdfs}{local-name()}" target="predicate"><xsl:value-of select="name()"/></a>
    </td>
    <td>
      <xsl:choose>
        <xsl:when test="@rdf:resource!=''">
          <a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

  <xsl:template match="owl:*">
    <td>
      <a href="{$owl}{local-name()}" target="predicate"><xsl:value-of select="name()"/></a>
    </td>
    <td>
      <xsl:choose>
        <xsl:when test="@rdf:resource!=''"><a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

  <xsl:template match="dc:*">
    <td>
      <a href="{$dc}{local-name()}" target="predicate"><xsl:value-of select="name()"/></a>
    </td>
    <td>
      <xsl:choose>
        <xsl:when test="@rdf:resource!=''"><a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

  <xsl:template match="dcterms:*">
    <td>
      <a href="{$dcterms}{local-name()}" target="predicate"><xsl:value-of select="name()"/></a>
    </td>
    <td>
      <xsl:choose>
        <xsl:when test="@rdf:resource!=''"><a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

  <xsl:template match="skos:*">
    <td>
      <a href="{$skos}{local-name()}" target="predicate"><xsl:value-of select="name()"/></a>
    </td>
    <td>
      <xsl:choose>
        <xsl:when test="@rdf:resource!=''"><a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

  <xsl:template match="BMRBo:*">
    <td>
      <a href="{$BMRBo}{local-name()}" target="predicate"><xsl:value-of select="name()"/></a>
    </td>
    <td>
      <xsl:choose>
        <xsl:when test="@rdf:resource!=''">
          <xsl:variable name="shortname">
          <xsl:call-template name="string-replace">
            <xsl:with-param name="text" select="@rdf:resource" />
            <xsl:with-param name="replace" select="$BMRBr" />
            <xsl:with-param name="by" select="'BMRBr:'" />
          </xsl:call-template>
          </xsl:variable>
          <a href="{@rdf:resource}"><xsl:value-of select="$shortname"/></a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

</xsl:stylesheet>
