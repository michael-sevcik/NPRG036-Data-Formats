<!-- applicable for data-2.xml -->
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="universities">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text> 
        <head>
            <title>The people of academy</title>
            <h1>The people of academy</h1>
            <p>Here, despite the efforts of GDPR, you are free to browse information about persons teaching at or attending selected universities.</p>
        </head>
        <body>
            <xsl:apply-templates/>        
        </body>
    </xsl:template>
    
    <xsl:template match="University">
        <h2><xsl:value-of select="name"/></h2>
        <p>Holding precious data of these fine individuals since <xsl:value-of select="date"/>.</p>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="faculties/Faculty/students">
        <h3>The students of <xsl:value-of select="../name"/>.</h3>
        <xsl:apply-templates/>    
    </xsl:template>

    <xsl:template match="faculties/Faculty/teachers">
        <h3>The teachers of <xsl:value-of select="../name"/>.</h3>
        <xsl:apply-templates/>    
    </xsl:template>

    <xsl:template match="Student">
        <h4><xsl:value-of select="givenName"/><xsl:text disable-output-escaping="yes">&#32;</xsl:text><xsl:value-of select="familyName"/></h4>
        <p>
            A very fine student indeed. They have been at it for almost <xsl:value-of select="studyYear"/> years now.
            <xsl:apply-templates/> 
        </p>    
    </xsl:template>

    <xsl:template match="nicknames">
        Could also be found going by other names such as:
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="nickname">
        <xsl:choose>
            <xsl:when test='position()+1=last()'>
                <xsl:value-of select="."/>. 
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>, 
            </xsl:otherwise>
        </xsl:choose>
    
    </xsl:template>


    <xsl:template match="Teacher">
        <h4><xsl:value-of select="givenName"/><xsl:text disable-output-escaping="yes">&#32;</xsl:text><xsl:value-of select="familyName"/></h4>
        <p>
            A certainly wise one to be teaching at <xsl:value-of select="../../name"/>.
            No wonder they earned a title of <xsl:value-of select="title"/>.
        </p>
    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>