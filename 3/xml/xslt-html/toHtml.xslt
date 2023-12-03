<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Towns Information</title>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
        </style>
      </head>
      <body>
        <xsl:apply-templates select="towns/Town"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Town">
    <h2>
      <xsl:value-of select="townName"/>
    </h2>
    <p>Mayor: <xsl:value-of select="concat(Mayor/firstName, ' ', Mayor/surname)"/></p>
    <p>Term Start: <xsl:value-of select="Mayor/termStart"/></p>
    <p>Term End: <xsl:value-of select="Mayor/termEnd"/></p>

    <h3>Streets</h3>
    <table>
      <tr>
        <th>Street Name</th>
        <th>Sidewalk</th>
      </tr>
      <xsl:apply-templates select="streets/Street"/>
    </table>

    <h3>Town Hall</h3>
    <p>Number: <xsl:value-of select="townhall/House/number"/></p>
    <p>Colour: <xsl:value-of select="townhall/House/colour"/></p>
    <p>Area: <xsl:value-of select="townhall/House/area"/> square meters</p>

    <hr/>
  </xsl:template>

  <xsl:template match="Street">
    <tr>
      <td><xsl:value-of select="streetName"/></td>
      <td><xsl:value-of select="sidewalk"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>