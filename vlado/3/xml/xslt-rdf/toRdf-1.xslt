<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />

    <xsl:template match="dormitories">
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix teach: &lt;http://linkedscience.org/teach/ns#&gt; .
@prefix dbo: &lt;http://dbpedia.org/ontology/&gt; .
@prefix cwrc: &lt;https://sparql.cwrc.ca/ontologies/cwrc#&gt; .
<xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="Dormitory">
ex:<xsl:value-of select="@id"/>
    a ex:Dormitory ;
    ex:name "<xsl:value-of select="./name"/>"@<xsl:value-of select="name/@xml:lang"/> ;
    ex:address "<xsl:value-of select="./address"/>"@<xsl:value-of select="address/@xml:lang"/> .
<xsl:apply-templates/>     
    </xsl:template>


    <xsl:template match="cafeterias/Cafeteria">
ex:<xsl:value-of select="@id"/>
    a ex:Cafeteria ;
    ex:mealProvider ex:<xsl:value-of select="../../@id"/> ;
    ex:name "<xsl:value-of select="./name"/>"@<xsl:value-of select="name/@xml:lang"/> ;
    ex:address "<xsl:value-of select="./address"/>"@<xsl:value-of select="address/@xml:lang"/> .
<xsl:apply-templates/>     
    </xsl:template>

    <xsl:template match="tenants/Student">
ex:<xsl:value-of select="@id"/>
    a teach:Student ;
    dbo:tenant ex:<xsl:value-of select="../../@id"/> ;
    foaf:givenName "<xsl:value-of select="./givenName"/>"@<xsl:value-of select="givenName/@xml:lang"/> ;
    foaf:familyName "<xsl:value-of select="./familyName"/>"@<xsl:value-of select="familyName/@xml:lang"/> ;
    ex:studyYear +<xsl:value-of select="./studyYear"/> ;
    ex:nickname<xsl:apply-templates/>     
    </xsl:template>

    <xsl:template match="nicknames/nickname">
        <xsl:choose>
                <xsl:when test='position()+1=last()'>
        "<xsl:value-of select="."/>"@<xsl:value-of select="./@xml:lang"/> .
</xsl:when>
                <xsl:otherwise>
        "<xsl:value-of select="."/>"@<xsl:value-of select="./@xml:lang"/> ,</xsl:otherwise>
            </xsl:choose>
    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>