<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
     xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:decimal-format name="european" decimal-separator="," grouping-separator="."/>
<xsl:template match ="django-objects">
  <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <!-- defines page layout -->
    <fo:layout-master-set>
      <fo:simple-page-master master-name="simple"
                    page-height="29.7cm"
                    page-width="21cm"
                    margin-top="1.5cm"
                    margin-bottom="1.0cm"
                    margin-left="1.5cm"
                    margin-right="1.5cm">
        <fo:region-body margin-top="10.5cm" margin-bottom="1.5cm"/>
        <fo:region-before extent="10.5cm"/>
        <fo:region-after extent="1.5cm"/>
      </fo:simple-page-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="simple">
      <fo:static-content flow-name="xsl-region-before" >
        <fo:block font-size="13pt"
              font-family="BitstreamVeraSans"
              color="black"
              text-align="left"
              font-weight="bold">
        Balanancesheet of "To be set in the Template file"
       </fo:block>
      </fo:static-content>
        <fo:static-content flow-name="xsl-region-after" >
       <fo:block font-size="8pt"
              font-family="BitstreamVeraSans"
              text-align="left">&#8201; </fo:block>
       <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="15.0cm"/>
          <fo:table-column column-width="3.0cm"/>
        <fo:table-body>
          <fo:table-row border-top-color="black" border-top-style="solid" border-top-width="0.5pt">
            <fo:table-cell number-columns-spanned="2">
            <fo:block font-size="5pt"
              font-family="BitstreamVeraSans"
              text-align="left"
              font-weight="bold"
              >&#8201; </fo:block>
            </fo:table-cell>
          </fo:table-row>
         <fo:table-row>
           <fo:table-cell>
            <fo:block font-size="8pt"
              font-family="BitstreamVeraSans"
              font-weight="bold"
              text-align="end">Page <fo:page-number/>/<fo:page-number-citation ref-id="last-page"/></fo:block>
           </fo:table-cell>
         </fo:table-row>
        </fo:table-body>
       </fo:table> 
    </fo:static-content>
      <fo:flow flow-name="xsl-region-body">

       <fo:block font-size="9pt"
              font-family="BitstreamVeraSans"
              text-align="left"
              line-height="13pt" >Assets</fo:block>
       <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="3cm"/>
          <fo:table-column column-width="11cm"/>
          <fo:table-column column-width="3cm"/>
     <fo:table-header font-size="9pt" line-height="9pt" font-weight="bold" font-family="BitstreamVeraSans">
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      Account Number
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      Account
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="end" >
                      Value
                   </fo:block>
                </fo:table-cell>
             </fo:table-header>
              <fo:table-body font-size="9pt"
                         font-family="BitstreamVeraSans">
         <xsl:for-each select="object[@model='accounting.account']">
          <xsl:sort select="field[@name='account_number']" data-type="number"/>
             <xsl:choose><xsl:when test="field[@name='account_type'] = 'A'">
             <fo:table-row keep-together="always">
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      <xsl:value-of select="field[@name='account_number']"/>
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      <xsl:value-of select="field[@name='title']"/>
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="end" >
                      <xsl:value-of select="format-number(sum_of_all_bookings_through_now,'#.##0,00', 'european')"/> CHF
                   </fo:block>
                </fo:table-cell>
             </fo:table-row></xsl:when><xsl:otherwise></xsl:otherwise></xsl:choose>
           </xsl:for-each>
             <fo:table-row keep-together="always">
               <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                  <fo:block  text-align="start" >Total assets
                  </fo:block>
               </fo:table-cell>
               <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                  <fo:block  text-align="start" > </fo:block>
               </fo:table-cell>
               <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                  <fo:block  text-align="end" >
                     <xsl:value-of select="format-number(object[@model='accounting.accountingperiod']/Overall_Assets,'#.##0,00', 'european')"/> CHF
                  </fo:block>
               </fo:table-cell>
             </fo:table-row>
          </fo:table-body>
       </fo:table>
       <fo:block font-size="9pt"
              font-family="BitstreamVeraSans"
              text-align="left"
              line-height="13pt"
              padding-top="0.7cm">Liabilities</fo:block>
       <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="3cm"/>
          <fo:table-column column-width="11cm"/>
          <fo:table-column column-width="3cm"/>
          <fo:table-header font-size="9pt" line-height="9pt" font-weight="bold" font-family="BitstreamVeraSans">
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      Account Number
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      Account
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="end" >
                      Value
                   </fo:block>
                </fo:table-cell>
             </fo:table-header>
          <fo:table-body font-size="9pt"
                         font-family="BitstreamVeraSans">
         <xsl:for-each select="object[@model='accounting.account']">
          <xsl:sort select="field[@name='account_number']" data-type="number"/>
             <xsl:choose>
             <xsl:when test="field[@name='account_type'] = 'L'">
             <fo:table-row keep-together="always">
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      <xsl:value-of select="field[@name='account_number']"/>
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      <xsl:value-of select="field[@name='title']"/>
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="end" >
                      <xsl:value-of select="format-number(sum_of_all_bookings_through_now,'#.##0,00', 'european')"/> CHF
                   </fo:block>
                </fo:table-cell>
             </fo:table-row></xsl:when><xsl:otherwise></xsl:otherwise></xsl:choose>
            </xsl:for-each>
              <fo:table-row keep-together="always">
               <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                  <fo:block  text-align="start" >Total liabilities
                  </fo:block>
               </fo:table-cell>
               <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                  <fo:block  text-align="start" > </fo:block>
               </fo:table-cell>
               <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                  <fo:block  text-align="end" >
                     <xsl:value-of select="format-number(object[@model='accounting.accountingperiod']/Overall_Liabilities,'#.##0,00', 'european')"/> CHF
                  </fo:block>
               </fo:table-cell>
             </fo:table-row>
          </fo:table-body>
       </fo:table>
       <fo:block font-size="9pt"
              font-family="BitstreamVeraSans"
              text-align="left"
              line-height="13pt"
              padding-top="0.7cm">Profit/Loss</fo:block>
       <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="3cm"/>
          <fo:table-column column-width="11cm"/>
          <fo:table-column column-width="3cm"/>
          <fo:table-body font-size="9pt"
                         font-family="BitstreamVeraSans">
             <fo:table-row keep-together="always">
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                      <xsl:choose>
                        <xsl:when test="TotalProfitLoss &gt; 0">
                          Profit
                        </xsl:when>
                        <xsl:otherwise>
                          Loss
                        </xsl:otherwise>
                      </xsl:choose>
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="start" >
                   </fo:block>
                </fo:table-cell>
                <fo:table-cell border-color="black" border-style="solid" border-width="0.5pt" padding="2.5pt">
                   <fo:block  text-align="end" >
                      <xsl:value-of select="format-number(object[@model='accounting.accountingperiod']/Overall_Assets-object[@model='accounting.accountingperiod']/Overall_Liabilities,'#.##0,00', 'european')"/> CHF
                   </fo:block>
                </fo:table-cell>
             </fo:table-row>
          </fo:table-body>
       </fo:table>
          <fo:block id="last-page"> </fo:block>
    </fo:flow>
     <xsl:apply-templates/>
  </fo:page-sequence>
  </fo:root>
</xsl:template>
</xsl:stylesheet>
