<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/">

    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/rdf:RDF">
        <html>
            <head>
                <title>FOAF RDF to XHTML</title>
            </head>
            <body>
                <h1>FOAF RDF Information</h1>
                <xsl:apply-templates select="rdf:Description"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="rdf:Description">
        <div style="margin-bottom: 20px; border: 1px solid #ccc; padding: 10px;">
            <h2>
                <xsl:value-of select="foaf:name"/>
            </h2>
            <ul>
                <li><strong>Given Name:</strong> <xsl:value-of select="foaf:givenname"/></li>
                <li><strong>Family Name:</strong> <xsl:value-of select="foaf:family_name"/></li>
                <li><strong>Homepage:</strong> <a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage/@rdf:resource"/></a></li>
                <li><strong>Email SHA1:</strong> <xsl:value-of select="foaf:mbox_sha1sum"/></li>
                <li><strong>Workplace Homepage:</strong> <a href="{foaf:workplaceHomepage/@rdf:resource}"><xsl:value-of select="foaf:workplaceHomepage/@rdf:resource"/></a></li>
                <li><strong>School Homepage:</strong> <a href="{foaf:schoolHomepage/@rdf:resource}"><xsl:value-of select="foaf:schoolHomepage/@rdf:resource"/></a></li>
                <li><strong>See Also:</strong> <a href="{rdfs:seeAlso/@rdf:resource}"><xsl:value-of select="rdfs:seeAlso/@rdf:resource"/></a></li>
            </ul>
        </div>
        <xsl:apply-templates select="foaf:knows/foaf:Person"/>
    </xsl:template>

</xsl:stylesheet>
