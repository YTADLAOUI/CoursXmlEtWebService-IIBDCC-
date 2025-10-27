<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg"
            width="1200" height="800">
            
           
            <!-- Horizontal axis -->
            <line x1="100" y1="600" x2="1100" y2="600"
                stroke="blue" stroke-width="2"/>
            
          
            <line x1="100" y1="100" x2="100" y2="600"
                stroke="blue" stroke-width="2"/>
            
            
            <xsl:variable name="cities"
                select="meteo/mesure[@date='2025-11-22']/ville"/>
            <xsl:variable name="count" select="count($cities)"/>
            
            
            <xsl:variable name="spacing"
                select="900 div $count"/>
            
           
            <xsl:for-each select="$cities">
                
                <!-- x position -->
                <xsl:variable name="pos"
                    select="position() * $spacing"/>
                
                
                <xsl:variable name="temp"
                    select="number(@temperature) * 10"/>
                
                
                <text x="{100 + $pos}" y="620"
                    font-size="18" fill="blue">
                    <xsl:value-of select="@nom"/>
                </text>
                
             
                <rect width="40"
                    height="{$temp}"
                    x="{100 + $pos - 20}"
                    y="{600 - $temp}"
                    fill="orange"
                    stroke="blue"
                    stroke-width="2"/>
                
              
                <text x="{100 + $pos - 10}"
                    y="{600 - $temp - 10}"
                    font-size="18" fill="black">
                    <xsl:value-of select="@temperature"/>
                </text>
                
            </xsl:for-each>
            
        </svg>
    </xsl:template>
    
</xsl:stylesheet>
