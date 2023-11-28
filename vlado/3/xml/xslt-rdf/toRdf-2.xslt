<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />

    <xsl:template match="universities">
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix schema: &lt;http://schema.org/&gt; .
@prefix teach: &lt;http://linkedscience.org/teach/ns#&gt; .
@prefix cwrc: &lt;https://sparql.cwrc.ca/ontologies/cwrc#&gt; .

    <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="University">
ex:<xsl:value-of select="@id"/>
    a ex:Universty ;
    ex:name "<xsl:value-of select="./name"/>"@<xsl:value-of select="name/@xml:lang"/> ;
    dcterms:date "<xsl:value-of select="./date"/>"^^xsd:date ;
    ex:address "<xsl:value-of select="./address"/>"@<xsl:value-of select="address/@xml:lang"/> .
<xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="faculties/Faculty">
ex:<xsl:value-of select="../../@id"/> ex:organizedIn ex:<xsl:value-of select="@id"/> .


ex:<xsl:value-of select="@id"/>
    a ex:Faculty ;
    ex:name "<xsl:value-of select="./name"/>"@<xsl:value-of select="name/@xml:lang"/> ;
    dcterms:date "<xsl:value-of select="./date"/>"^^xsd:date .
<xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="teachers/Teacher">
ex:<xsl:value-of select="@id"/>
    schema:employee ex:<xsl:value-of select="../../@id"/> ;
    a teach:Teacher ;
    foaf:givenName "<xsl:value-of select="./givenName"/>"@<xsl:value-of select="givenName/@xml:lang"/> ;
    foaf:familyName "<xsl:value-of select="./familyName"/>"@<xsl:value-of select="familyName/@xml:lang"/> ;
    foaf:title "<xsl:value-of select="./title"/>"@<xsl:value-of select="title/@xml:lang"/> .
    </xsl:template>


    <xsl:template match="students/Student">
ex:<xsl:value-of select="@id"/>
    cwrc:attends ex:<xsl:value-of select="../../@id"/> ;
    a teach:Student ;
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


    <xsl:template match="dormitories/Dormitory">
ex:<xsl:value-of select="@id"/>
    a ex:Dormitory ;
    ex:accommodationProvider ex:<xsl:value-of select="../@id"/> ;
    ex:name "<xsl:value-of select="./name"/>"@<xsl:value-of select="name/@xml:lang"/> ;
    ex:address "<xsl:value-of select="./address"/>"@<xsl:value-of select="address/@xml:lang"/> .
    </xsl:template>

<xsl:template match="cafeterias/Cafeteria">
ex:<xsl:value-of select="@id"/>
    a ex:Cafeteria ;
    ex:mealProvider ex:<xsl:value-of select="../@id"/> ;
    ex:name "<xsl:value-of select="./name"/>"@<xsl:value-of select="name/@xml:lang"/> ;
    ex:address "<xsl:value-of select="./address"/>"@<xsl:value-of select="address/@xml:lang"/> .
    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>