<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
 
    <xsl:template match="towns">
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; . 
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt;.
@prefix dbo: &lt;http://dbpedia.org/resource/classes#&gt;.

@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix exT: &lt;http://example.org/towns/&gt; .
@prefix exS: &lt;http://example.org/streets/&gt; .
@prefix exH: &lt;http://example.org/houses/&gt; .
@prefix exP: &lt;http://example.org/people/&gt; .
    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="Town">
exT:<xsl:value-of select="@id"/> a dbo:Town ;
    ex:townName &quot;<xsl:value-of select="./townName"/>&quot;@<xsl:value-of select="townName/@xml:lang"/> ;
    ex:hasFlag &quot;<xsl:value-of select="./hasFlag"/>&quot;^^xsd:boolean ;
    ex:hasBroadcast &quot;<xsl:value-of select="./hasBroadcast"/>&quot;^^xsd:boolean .
    <xsl:apply-templates select="streets/Street"/>     
    </xsl:template>

    <xsl:template match="Street">
exS:<xsl:value-of select="@id"/> a dbo:Street ;
    ex:streetName &quot;<xsl:value-of select="./streetName"/>&quot;@<xsl:value-of select="streetName/@xml:lang"/> ;
    ex:hasSidewalk &quot;<xsl:value-of select="./sidewalk"/>&quot;^^xsd:boolean ;
    ex:locatedIn exT:<xsl:value-of select="../../@id"/> .
    <xsl:apply-templates select="houses/House"/>
    </xsl:template>

    <xsl:template match="House">
exH:<xsl:value-of select="@id"/> a dbo:Building ;
    ex:houseNumber &quot;<xsl:value-of select="./number"/>&quot;^^xsd:integer ;
    ex:colour_hex_code &quot;<xsl:value-of select="./colour"/>&quot; ;
    dbo:area &quot;<xsl:value-of select="./area"/>&quot;^^xsd:float ;
    ex:situatedOn exS:<xsl:value-of select="../../@id"/> .
    <xsl:apply-templates select="occupants/Occupant"/>
    </xsl:template>

    <xsl:template match="Occupant">
exP:<xsl:value-of select="@id"/> a ex:Occupant ;
    foaf:firstName &quot;<xsl:value-of select="./firstName"/>&quot;@<xsl:value-of select="./firstName/@xml:lang"/> ;
    foaf:surname &quot;<xsl:value-of select="./surname"/>&quot;@<xsl:value-of select="./surname/@xml:lang"/> ;
    <xsl:if test="./middlenames">ex:middleNames (<xsl:for-each select="./middlenames/middlename">
        &quot;<xsl:value-of select="."/>&quot;@<xsl:value-of select="@xml:lang"/>
    </xsl:for-each>
    ) ;</xsl:if>
    ex:date_from &quot;<xsl:value-of select="./date_from"/>&quot;^^xsd:date ;
    ex:unpaid_fees &quot;<xsl:value-of select="./unpaid_fees"/>&quot;^^xsd:boolean ;
    ex:livesIn exH:<xsl:value-of select="../../@id"/> .
    <xsl:apply-templates select="../../../../../../Mayor"/>
    </xsl:template>

    <xsl:template match="Mayor">
exP:<xsl:value-of select="@id"/> a ex:Mayor ;
    ex:termStart &quot;<xsl:value-of select="./termStart"/>&quot;^^xsd:date ;
    ex:termEnd &quot;<xsl:value-of select="./termEnd"/>&quot;^^xsd:date ;
    ex:mayor exT:<xsl:value-of select="../@id"/> .
    <xsl:apply-templates select="../townhall"/>
    </xsl:template>

    <xsl:template match="townhall">
exT:<xsl:value-of select="../@id"/> ex:townHall exH:<xsl:value-of select="./House/@id"/> .
    &#10;&#10;
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>

