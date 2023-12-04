<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefixHouse">http://example.org/houses/</xsl:variable>
    <xsl:variable name="prefixPerson">http://example.org/people/</xsl:variable>
    <xsl:variable name="prefixStreet">http://example.org/streets/</xsl:variable>
    <xsl:variable name="prefixTown">http://example.org/towns/</xsl:variable>
    
    <xsl:template match="towns">
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; . 
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt;.
@prefix dbo: &lt;http://dbpedia.org/resource/classes#&gt;.
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
    ex:hasSidewalk &quot;<xsl:value-of select="./hasSidewalk"/>&quot;^^xsd:boolean .

exS:<xsl:value-of select="@id"/> ex:locatedIn exT:<xsl:value-of select="../../@id"/> .
    <xsl:apply-templates select="houses/House"/>
    </xsl:template>

    <xsl:template match="House">
exH:<xsl:value-of select="@id"/> a dbo:Building ;
    ex:houseNumber "<xsl:value-of select="./number"/>"^^xsd:integer ;
    ex:colour_hex_code "<xsl:value-of select="./colour"/>" ;
    dbo:area "<xsl:value-of select="./area"/>"^^xsd:float .

exH:<xsl:value-of select="@id"/> ex:situatedOn exS:<xsl:value-of select="../../@id"/> .
    <xsl:apply-templates select="occupants/Occupant"/>
    </xsl:template>

    <xsl:template match="Occupant">
exP:<xsl:value-of select="@id"/> a ex:Occupant ;
    foaf:firstName &quot;<xsl:value-of select="./firstName"/>&quot;@<xsl:value-of select="./firstName/@xml:lang"/> ;
    foaf:surname &quot;<xsl:value-of select="./surname"/>&quot;@<xsl:value-of select="./surname/@xml:lang"/> ;
    <xsl:apply-templates select="./middlenames/middlename"/>
    </xsl:template>
    
    <!-- TODO -->
    <xsl:template match="middlename">
        <xsl:if test="normalize-space(.) != ''">
            ex:middleNames (
            &quot;<xsl:value-of select="./middlename"/>&quot;@<xsl:value-of select="middlename/@xml:lang"/>
            ) .
        </xsl:if>
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>

