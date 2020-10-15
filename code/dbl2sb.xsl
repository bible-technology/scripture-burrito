<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d2s="d2s">

    <!-- This stylesheet is currently intended to speed up generation of Scripture Burrito example documents. -->
    <!-- It does NOT even try to guarantee data integrity. DO NOT USE IN PRODUCTION! -->
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy" />
    
    <xsl:function name="d2s:addDblPrefix">
        <xsl:param name="string"/>
        <xsl:value-of select="concat('dbl::', $string)"/>
    </xsl:function>
    
    <xsl:function name="d2s:flavorName">
        <xsl:param name="dblMediumName"/>
        <xsl:choose>
            <xsl:when test="$dblMediumName = 'text'">
                <xsl:value-of select="'scriptureText'"/>
            </xsl:when>
            <xsl:when test="$dblMediumName = 'audio'">
                <xsl:value-of select="'scriptureAudio'"/>
            </xsl:when>
            <xsl:when test="$dblMediumName = 'video'">
                <xsl:value-of select="'scriptureSignLanguageVideo'"/>
            </xsl:when>
            <xsl:when test="$dblMediumName = 'print'">
                <xsl:value-of select="'scripturePrint'"/>
            </xsl:when>
            <xsl:when test="$dblMediumName = 'braille'">
                <xsl:value-of select="'scriptureBraille'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'????'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="d2s:format">
        <xsl:param name="oldFormat"/>
        <xsl:choose>
            <xsl:when test="$oldFormat = 'xhtml'">
                <xsl:text>html</xsl:text>
            </xsl:when>
            <xsl:otherwise><xsl:text>plain</xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:template name="licenses">
        <xsl:element name="licenses">
            <xsl:element name="allRightsReserved"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match = "/DBLMetadata">
        <xsl:element name="burritoMetadata">
            <xsl:attribute name="schemaVersion"><xsl:text>0.1</xsl:text></xsl:attribute>
            <xsl:element name="idAuthority">
                <xsl:attribute name="prefix"><xsl:text>dbl</xsl:text></xsl:attribute>
                <xsl:text>http://thedigitalbiblelibrary.org</xsl:text>
            </xsl:element>
            <xsl:apply-templates select="*[local-name() != 'format'][local-name() != 'source']"/>
            <xsl:call-template name="licenses"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match = "identification">
        <xsl:copy>
            <xsl:element name="systemId">
                <xsl:attribute name="revision"><xsl:value-of select="/DBLMetadata/@revision"/></xsl:attribute>
                <xsl:value-of select="d2s:addDblPrefix(/DBLMetadata/@id)"/>
            </xsl:element>
            <xsl:apply-templates select="systemId"/>
            <xsl:apply-templates select="name|nameLocal"/>
            <xsl:apply-templates select="description|descriptionLocal"/>
            <xsl:apply-templates select="abbreviation|abbreviationLocal"/>
            <xsl:apply-templates select="dateStarted|dateCompleted"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="relationships">
        <xsl:if test="relation">
            <xsl:apply-templates select="*"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="relationships/relation">
        <xsl:copy>
            <xsl:attribute name="id"><xsl:value-of select="d2s:addDblPrefix(@id)"/></xsl:attribute>
            <xsl:copy-of select="@revision"/>
            <xsl:attribute name="flavor"><xsl:value-of select="d2s:flavorName(@type)"/></xsl:attribute>
            <xsl:copy-of select="@relationType"/>
            <xsl:copy-of select="@publicationId"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match = "type">
        <xsl:copy>
            <xsl:element name="flavor"><xsl:value-of select="d2s:flavorName(medium/text())"/></xsl:element>
            <xsl:element name="flavorType"><xsl:text>scripture</xsl:text></xsl:element>
            <xsl:element name="confidentiality">
                <xsl:choose>
                    <xsl:when test="isConfidential/text() = 'true'">
                        <xsl:element name="metadata">
                            <xsl:text>restricted</xsl:text>
                        </xsl:element>
                        <xsl:element name="source">
                            <xsl:text>restricted</xsl:text>
                        </xsl:element>
                        <xsl:element name="publications">
                            <xsl:text>restricted</xsl:text>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="metadata">
                            <xsl:text>unrestricted</xsl:text>
                        </xsl:element>
                        <xsl:element name="source">
                            <xsl:text>private</xsl:text>
                        </xsl:element>
                        <xsl:element name="publications">
                            <xsl:text>restricted</xsl:text>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
            <xsl:element name="canonSpec"> <!-- TODO - calculate actual canonSpec -->
                <xsl:attribute name="type"><xsl:text>OT, NT</xsl:text></xsl:attribute>
                <xsl:element name="component">
                    <xsl:attribute name="name"><xsl:text>westernOT</xsl:text></xsl:attribute>
                </xsl:element>
                <xsl:element name="component">
                    <xsl:attribute name="name"><xsl:text>westernNT</xsl:text></xsl:attribute>
                </xsl:element>
            </xsl:element>
            <xsl:element name="scope">
                <xsl:for-each select="/DBLMetadata/publications/publication[1]/canonicalContent/book/@code">
                    <xsl:element name="bookScope">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
            <xsl:element name="flavorDetails">
                <xsl:copy-of select="/DBLMetadata/format"/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="agencies">
        <!-- TODO: make this work properly for multiple orgs -->
        <xsl:copy>
            <xsl:element name="contributor">
                <xsl:element name="id">
                    <xsl:value-of select="d2s:addDblPrefix(rightsHolder[1]/uid/text())"/>
                </xsl:element>
                <xsl:element name="name">
                    <xsl:attribute name="lang">
                        <xsl:text>eng</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="rightsHolder[1]/name/text()"/>
                </xsl:element>
                <xsl:if test="rightsHolder[1]/nameLocal">
                    <xsl:element name="name">
                        <xsl:attribute name="lang">
                            <xsl:text>zzz</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="rightsHolder[1]/name/text()"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="rightsHolder[1]/url">
                    <xsl:element name="url">
                        <xsl:value-of select="rightsHolder[1]/url/text()"/>
                    </xsl:element>
                </xsl:if>
                <xsl:element name="isRightsHolder">
                    <xsl:text>true</xsl:text>
                </xsl:element>
                <xsl:element name="contributes">
                    <xsl:copy-of select="contributor[1]/content"/>
                    <xsl:copy-of select="contributor[1]/publication"/>
                    <xsl:copy-of select="contributor[1]/management"/>
                    <xsl:copy-of select="contributor[1]/finance"/>
                    <xsl:copy-of select="contributor[1]/qa"/>
                </xsl:element>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="publication">
        <xsl:copy>
            <xsl:copy-of select="@id"/>
            <xsl:apply-templates
                select="name | nameLocal | description | descriptionLocal | abbreviation | abbreviationLocal | canonicalContent | structure"/>
            <!-- TODO canonSpec -->
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="publication/canonicalContent">
        <xsl:element name="scope">
            <xsl:for-each select="book">
                <xsl:element name="bookScope">
                    <xsl:value-of select="@code"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="publication//division|content">
        <xsl:copy>
            <xsl:copy-of select="@*[local-name() != 'role'][local-name() != 'name']"/>
            <xsl:if test="@name">
                <xsl:attribute name="nameId"><xsl:value-of select="@name"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="copyright">
        <xsl:if test="*">
            <xsl:copy>
                <xsl:for-each select="fullStatement | shortStatement">
                    <xsl:element name="statement">
                        <xsl:attribute name="lang">
                            <xsl:text>zzz</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="format">
                            <xsl:value-of select="d2s:format(statementContent/@type)"/>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:choose>
                                <xsl:when test="local-name() = 'fullStatement'">
                                    <xsl:text>full</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>short</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:copy-of select="statementContent/node()"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="promotion">
        <xsl:if test="*">
            <xsl:copy>
                <xsl:element name="statement">
                    <xsl:attribute name="lang">
                        <xsl:text>zzz</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="format">
                        <xsl:value-of select="d2s:format(promoVersionInfo/@contentType)"/>
                    </xsl:attribute>
                    <xsl:copy-of select="promoVersionInfo/node()"/>
                </xsl:element>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="language">
        <xsl:element name="languages">
            <xsl:element name="language">
                <xsl:element name="bcp47"><xsl:value-of select="iso/text()"/></xsl:element> <!-- TODO - build proper BCP47 -->
                <xsl:element name="name">
                    <xsl:attribute name="lang"><xsl:text>eng</xsl:text></xsl:attribute>
                    <xsl:value-of select="name/text()"/>
                </xsl:element>
                <xsl:element name="scriptDirection">
                    <xsl:choose>
                        <xsl:when test="scriptDirection">
                    <xsl:value-of select="scriptDirection/text()"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>LTR</xsl:text>
                        </xsl:otherwise>
                        </xsl:choose>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="manifest"> <!-- TODO: add isSource and scope -->
        <xsl:element name="ingredients">
            <xsl:for-each select="resource">
                <xsl:element name="ingredient">
                    <xsl:element name="path">
                        <xsl:value-of select="@uri"/>
                    </xsl:element>
                    <xsl:element name="size">
                        <xsl:value-of select="@size"/>
                    </xsl:element>
                    <xsl:element name="checksum">
                        <xsl:value-of select="@checksum"/>
                    </xsl:element>
                    <xsl:element name="mimeType">
                        <xsl:value-of select="@mimeType"/>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template match="archiveStatus">
        <xsl:element name="snapshot">
            <xsl:element name="creation">
                <xsl:element name="user">
                    <xsl:value-of select="/DBLMetadata/identification/bundleProducer/text()"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="uploading">
                <xsl:element name="user">
                    <xsl:value-of select="archivistName/text()"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="comments">
                <xsl:value-of select="comments"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match = "systemId">
        <xsl:element name="systemId">
            <xsl:value-of select = "id/text()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="name[count(*) &gt; 0]">
        <!-- names/name -->
        <xsl:copy>
            <xsl:copy-of select="@id"/>
            <xsl:for-each select="*">
                <xsl:copy>
                    <xsl:attribute name="lang">
                        <xsl:text>zzz</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="text()"/>
                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="name[count(*) = 0]">
        <xsl:copy>
            <xsl:attribute name="lang"><xsl:text>eng</xsl:text></xsl:attribute>
            <xsl:value-of select="text()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="nameLocal">
        <xsl:element name="name">
            <xsl:attribute name="lang"><xsl:text>zzz</xsl:text></xsl:attribute> <!-- TODO - find right BCP47 code -->
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="description">
        <xsl:copy>
            <xsl:attribute name="lang"><xsl:text>eng</xsl:text></xsl:attribute>
            <xsl:value-of select="text()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="descriptionLocal">
        <xsl:element name="description">
            <xsl:attribute name="lang"><xsl:text>zzz</xsl:text></xsl:attribute>
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="abbreviation">
        <xsl:copy>
            <xsl:attribute name="lang"><xsl:text>eng</xsl:text></xsl:attribute>
            <xsl:value-of select="text()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="abbreviationLocal">
        <xsl:element name="abbreviation">
            <xsl:attribute name="lang"><xsl:text>zzz</xsl:text></xsl:attribute>
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
