<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>

            <head>

                <title>Team BOJI</title>
                <style>
                    
                    body {
                        background-color: #f0f0f0;
                        
                        backdrop-filter: blur( 5px );
                        background-image: url('boji.png');
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <!-- font-family: Arial, sans-serif, "Bebas Neue", cursive; -->
                        color: #333;
                        
                        
                    }
                    table {
                        width: 50%;
                        margin: 10px auto;
                        border-collapse: collapse;
                        background: rgba( 255, 255, 255, 0.60 );
                        backdrop-filter: blur( 10px );
                        
                    }
                    td {
                        padding: 10px;
                        border: 1px solid #ddd;
                        text-align: center;
                        font-family: "Shadows Into Light", cursive;
                        font-weight: bold;
                        text-shadow: 1px 1px 1px white;
                        color: black;
                    }
                    th {
                        background-color: #3C3633;
                        padding: 10px;
                        border: 1px solid #ddd;
                        font-family: Segoe UI;
                        font-size: 20px;
                        color: white;
                    }
                    a {
                        text-decoration: none;
                        color: #007bff;
                    }
                    h1 {
                        text-align: center;
                        font-family: "Mochiy Pop One", sans-serif;
                        color: #0B60B0;
                        text-shadow: 2px 2px 2px black;
                        font-size: 50px;

                        
                    }
                    .boji-image {
                        max-width: 100px; /* Adjust the size as needed */
                        max-height: 100px; /* Adjust the size as needed */
                        border-radius: 50%; /* Makes the image circular */
                        display: block;
                        margin: 0 auto; /* Centers the image horizontally */
                        padding: 10px;
                    }
                </style>

            </head>
            <body>
                <h1>Team BOJI</h1>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Hobbies</th>
                    </tr>
                    <xsl:for-each select="team/boji">
                        <tr>
                            <td>
                                <a href="{link}" target="_blank">
                                    <img class="boji-image" src="{image}" alt="Boji Image"/>
                                </a>
                                <xsl:value-of select="name"/>
                            </td>
                            <td>
                                <xsl:call-template name="splitAndDisplay">
                                    <xsl:with-param name="text" select="hobbies"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <br/>

            </body>
        </html>
    </xsl:template>

    <xsl:template name="splitAndDisplay">
        <xsl:param name="text"/>
        <xsl:choose>
            <xsl:when test="contains($text, '&#10;')">
                <xsl:value-of select="substring-before($text, '&#10;')"/>
                <br/>
                <xsl:call-template name="splitAndDisplay">
                    <xsl:with-param name="text" select="substring-after($text, '&#10;')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
