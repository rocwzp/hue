<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:workflow="uri:oozie:workflow:0.5" exclude-result-prefixes="workflow">

<xsl:import href="nodes/decision.xslt"/>
<xsl:import href="nodes/end.xslt"/>
<xsl:import href="nodes/fork.xslt"/>
<xsl:import href="nodes/join.xslt"/>
<xsl:import href="nodes/kill.xslt"/>
<xsl:import href="nodes/start.xslt"/>

<xsl:template match="workflow:start | workflow:end | workflow:decision | workflow:fork | workflow:join | workflow:kill">

  <object model="oozie.node">

    <xsl:if test="@name">
      <field name="name" type="CharField">
        <xsl:value-of select="@name"/>
      </field>
    </xsl:if>
    <field name="node_type" type="CharField">
      <xsl:value-of select="name(.)"/>
    </field>
    <xsl:if test="@to">
      <field name="to" type="Control">
        <xsl:value-of select="@to"/>
      </field>
    </xsl:if>

  </object>

  <xsl:apply-imports/>

</xsl:template>

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
</xsl:stylesheet>