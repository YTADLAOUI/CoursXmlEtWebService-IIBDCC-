<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
        <xsl:template match="/">
            <html>
                <head>
                    <title>Relevé Bancaire</title>
                </head>
                <body>
                    <h2>Relevé Bancaire</h2>
                    <p><b>RIB :</b> <xsl:value-of select="releve/@RIB"/></p>
                    <p><b>Date :</b> <xsl:value-of select="releve/dateReleve"/></p>
                    <p><b>Solde :</b> <xsl:value-of select="releve/solde"/></p>
                    
                    <table border="1">
                        <tr>
                            <th>Type</th>
                            <th>Date</th>
                            <th>Montant</th>
                            <th>Description</th>
                        </tr>
                        
                        <xsl:for-each select="releve/operations/operation">
                            <tr>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                                <td><xsl:value-of select="@description"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    
                    <h3>Total Crédit :
                        <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/>
                    </h3>
                    
                    <h3>Total Débit :
                        <xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/>
                    </h3>
                    
                </body>
            </html>
        </xsl:template>
        
</xsl:stylesheet>