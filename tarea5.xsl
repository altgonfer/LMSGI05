<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Metodo de salida -->
    <xsl:output method="html" />
    <!-- Template -->
    <xsl:template match="/">
        <!-- Html -->
        <html>
            <head>
                <!-- Codificación de caracteres -->
                <meta charset="UTF-8" />
                <title>Tabla de artistas</title>
            </head>
            <body>
                <!-- Tabla -->
                <table>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Año de nacimiento</th>
                        <th>Año de fallecimiento</th>
                        <th>País</th>
                        <th>Página web</th>
                    </tr>
                    <!-- Crea un bucle, junto con el atributo select realiza un recorrido por los artistas -->
                    <xsl:for-each select="artistas/artista">
                        <!-- Ordena los artistas según criterio ascendente de nacimiento -->
                        <xsl:sort select="nacimiento" order="ascending" />
                        <!-- Crea un condicionante. Muestra nacidos después de 1500 -->
                        <xsl:if test="nacimiento &gt; 1500">
                            <tr>
                                <!-- Muestra el valor del atributo cod -->
                                <td><xsl:value-of select="@cod"/></td>
                                <!-- Muestra el valor de nombreCompleto --> 
                                <td><xsl:value-of select="nombreCompleto" /></td>   
                                <!-- Muestra el valor de nacimiento -->
                                <td><xsl:value-of select="nacimiento" /></td>
                                <td>  <!-- Crea un condicionante. Muestra el valor de fallecimiento -->
                                    <xsl:choose>
                                        <xsl:when test="fallecimiento">
                                            <xsl:value-of select="fallecimiento" />
                                        </xsl:when>
                                        <!-- Si no se cumple la condición muestra Desconocido -->
                                        <xsl:otherwise>Desconocido</xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <!-- Muestra el valor país -->
                                <td><xsl:value-of select="pais" /></td>
                                <!-- Enlace mediante atributo href con el valor de fichaCompleta -->
                                <td><a target="_blank"><xsl:attribute name="href">
                                    <xsl:value-of select="fichaCompleta"/></xsl:attribute>Saber más</a></td>
                            </tr>
                       </xsl:if>
                    </xsl:for-each>    
                </table>
            </body>
        </html>
   </xsl:template>
</xsl:stylesheet>
