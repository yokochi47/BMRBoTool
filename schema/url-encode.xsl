<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- ISO-8859-1 based URL-encoding demo
       Written by Mike J. Brown, mike@skew.org.
       Updated 2015-10-24 (to update the license).

       License: CC0 <https://creativecommons.org/publicdomain/zero/1.0/deed.en>

       Also see http://skew.org/xml/misc/URI-i18n/ for a discussion of
       non-ASCII characters in URIs.
  -->

  <!-- Characters we'll support.
       We could add control chars 0-31 and 127-159, but we won't. -->
  <xsl:variable name="ascii"> !"#$%&amp;'()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~</xsl:variable>
  <xsl:variable name="latin1">&#160;&#161;&#162;&#163;&#164;&#165;&#166;&#167;&#168;&#169;&#170;&#171;&#172;&#173;&#174;&#175;&#176;&#177;&#178;&#179;&#180;&#181;&#182;&#183;&#184;&#185;&#186;&#187;&#188;&#189;&#190;&#191;&#192;&#193;&#194;&#195;&#196;&#197;&#198;&#199;&#200;&#201;&#202;&#203;&#204;&#205;&#206;&#207;&#208;&#209;&#210;&#211;&#212;&#213;&#214;&#215;&#216;&#217;&#218;&#219;&#220;&#221;&#222;&#223;&#224;&#225;&#226;&#227;&#228;&#229;&#230;&#231;&#232;&#233;&#234;&#235;&#236;&#237;&#238;&#239;&#240;&#241;&#242;&#243;&#244;&#245;&#246;&#247;&#248;&#249;&#250;&#251;&#252;&#253;&#254;&#255;</xsl:variable>

  <!-- Characters that usually don't need to be escaped -->
  <xsl:variable name="safe">!'()*-,.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~</xsl:variable>
  <xsl:variable name="hex">0123456789ABCDEF</xsl:variable>

  <xsl:template name="url-encode">
    <xsl:param name="str"/>
    <xsl:if test="$str">
      <xsl:variable name="first-char" select="substring($str,1,1)"/>
      <xsl:choose>
	<xsl:when test="contains($safe,$first-char)">
	  <xsl:value-of select="$first-char"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:variable name="codepoint">
	    <xsl:choose>
	      <xsl:when test="contains($ascii,$first-char)">
		<xsl:value-of select="string-length(substring-before($ascii,$first-char)) + 32"/>
	      </xsl:when>
	      <xsl:when test="contains($latin1,$first-char)">
		<xsl:value-of select="string-length(substring-before($latin1,$first-char)) + 160"/>
	      </xsl:when>
	      <xsl:otherwise>
		<xsl:message terminate="no">Warning: string contains a character that is out of range! Substituting "?".</xsl:message>
		<xsl:text>63</xsl:text>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:variable>
	  <xsl:variable name="hex-digit1" select="substring($hex,floor($codepoint div 16) + 1,1)"/>
	  <xsl:variable name="hex-digit2" select="substring($hex,$codepoint mod 16 + 1,1)"/>
	  <xsl:value-of select="concat('%',$hex-digit1,$hex-digit2)"/>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:if test="string-length($str)&gt;1">
	<xsl:call-template name="url-encode">
	  <xsl:with-param name="str" select="substring($str,2)"/>
	</xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- Extract the string which comes before the last occurence of substring -->

  <xsl:template name="substring-before-last">
    <xsl:param name="str"/>
    <xsl:param name="substr"/>
    <xsl:if test="$substr and contains($str,$substr)">
      <xsl:variable name="temp" select="substring-after($str,$substr)"/>
      <xsl:value-of select="substring-before($str,$substr)"/>
      <xsl:if test="contains($temp,$substr)">
	<xsl:value-of select="$substr"/>
	<xsl:call-template name="substring-before-last">
	  <xsl:with-param name="str" select="$temp"/>
	  <xsl:with-param name="substr" select="$substr"/>
	</xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- Replace string with given inputs -->

  <xsl:template name="replace-string">
    <xsl:param name="str"/>
    <xsl:param name="replace"/>
    <xsl:param name="with"/>
    <xsl:choose>
      <xsl:when test="contains($str,$replace)">
	<xsl:value-of select="substring-before($str,$replace)"/>
	<xsl:value-of select="$with"/>
	<xsl:call-template name="replace-string">
	  <xsl:with-param name="str" select="substring-after($str,$replace)"/>
	  <xsl:with-param name="replace" select="$replace"/>
	  <xsl:with-param name="with" select="$with"/>
	</xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="$str"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Tokenize the string by the substring -->

  <xsl:template name="tokenize">
    <xsl:param name="str"/>
    <xsl:param name="substr"/>
    <xsl:choose>
      <xsl:when test="$substr and contains($str,$substr)">
	<token>
	  <xsl:value-of select="substring-before($str,$substr)"/>
	</token>
	<xsl:call-template name="tokenize">
	  <xsl:with-param name="str" select="substring-after($str,$substr)"/>
	  <xsl:with-param name="substr" select="$substr"/>
	</xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<token>
	  <xsl:value-of select="$str"/>
	</token>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
