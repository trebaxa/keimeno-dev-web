<%assign var="css_pageheight" value="885" %>
<%assign var="css_pagewidth" value="632" %>
<%assign var="css_primary_color" value="#E94C4D" %>
<%assign var="css_font_color" value="#2d3f41" %>
<%assign var="css_trbkg" value="#f0f0f0" %>
<%assign var="css_padding" value="3px" %>
<%assign var="css_fontsize_footer" value="8px" %>
<%assign var="css_fontsize" value="12px" %>
<%assign var="css_fontsize_footer_table" value="8px" %>
<%assign var="logo_width_px" value="300px" %>
<%assign var="logo_height_px" value="200px" %>
<style type="text/css">
  * {
    margin: 0;
    padding: 0;
    font-family: "helvetica";
    font-size: <%$css_fontsize%>;
  }
  body,
  html {
    font-size: <%$css_fontsize%>;
  }
  page {
    color: <%$css_font_color%>;
  }
  a {
    color: <% $css_primary_color %>;
  }
  .logo {
    max-width: <% $gbl_config.logo_width_px %>px;
    max-height: <% $gbl_config.logo_height_px %>px;
  }
  .trbkg {
    background-color: <%$css_trbkg%>;
  }
  td {
    padding: 1px;
    vertical-align: top;
  }
  span.small,
  small,
  .small {
    font-size: 11px;
  }
  span.big,
  .big {
    font-size: 13px;
    font-weight: bold;
  }
  .text-right {
    text-align: right;
  }
  .text-left {
    text-align: left;
  }
  .text-center {
    text-align: center;
  }
  .red {
    color: <%$css_primary_color%>;
  }
  .bold {
    font-weight: bold;
  }
  hr.red {
    color: <%$css_primary_color%>;
    margin: 0;
    padding: 0;
  }
  thead tr {
    background-color: #d8d8d8;
  }
  thead tr td,
  thead tr th {
    font-weight: bold;
    font-size: 1.2rem;
    padding-bottom: <%$css_padding%>;
    padding-left: <%$css_padding%>;
    padding-top: <%$css_padding%>;
    border-bottom: 1px solid <%$css_font_color%>;
    vertical-align: top;
  }
  #products-table thead tr th {
    font-weight: bold;
    border-top: 1px solid <%$css_font_color%>;
    border-bottom: 1px solid <%$css_font_color%>;
  }
  #products-table tbody tr td {
    border-bottom: 1px dotted #bfbfbf;
  }
  .line-top {
    border-top: 1px solid <%$css_font_color%>;
  }
  #footer-table {
    color: <%$css_font_color%>;
  }
  #footer-table td,
  #footer-table td b {
    font-size: <%$css_fontsize_footer_table%>;
  }
  #footer {
    /*background-color:<%$css_font_color%>;*/
    border-top: 3px solid <%$css_primary_color%>;
    color: <%$css_font_color%>;
    width: 100%;
    position: absolute;
    bottom: 0px;
  }
  #footer-text,
  #footer-text a {
    font-size: <%$css_fontsize_footer%>;
    text-align: justify;
  }
  .valign-bottom {
    vertical-align: text-bottom
  }
  .underline {
    border-bottom: 1px solid <%$css_primary_color%>;
    width: 80%;
    padding-bottom: 3px;
  }
  .td-red {
    border-bottom: 1px solid <%$css_primary_color%>;
    padding-top: 17px;
    padding-bottom: <%$css_padding%>;
  }
  <% section name=val start=5 step=5 loop=105 %>.w<%$smarty.section.val.index%> {
    width: <%$smarty.section.val.index%>%;
    max-width: <%$smarty.section.val.index%>%;
  }
  <%/section%>
  <% section name=mt start=1 step=1 loop=5 %>.mt-<%$smarty.section.mt.index%> {
    margin-top: <%$smarty.section.mt.index%>rem;
  }
  <%/section%>
  .wauto {
    width: auto;
  }
  table {
    vertical-align: middle;
    padding: 0;
    border: 0px solid #ff0000;
    border-spacing: 0;
    border-collapse: collapse;
    border-style: none;
  }
  td,
  th {
    padding: <%$css_padding%>;
    word-wrap: break-word;
  }
  .text-content {
    padding: <%$css_padding%>;
    width: 100%;
    margin: 0;
    max-width: 100%;
    display: block;
  }
  .text-right-block {
    text-align: right;
    display: block;
  }
  .table-bordered {
    border-style: none;
  }
</style>
<page backtop="0mm" backbottom="0mm">
  <page_header>
    <div class="text-right">
      <img 
        src="<%$cms_url%>/file_server/logo.jpg" 
        alt="Company logo" 
        loading="lazy" 
      />
    </div>
  </page_header>
  <page_footer></page_footer>
  <div>
    <h3>Contact</h3>
    <table class="w100">
      <colgroup>
        <col class="table-bordered w50">
        <col class="table-bordered w50">
      </colgroup>
      <tbody>
        <tr>
          <td>send:</td>
          <td>
            <%$CMAIL.send_date%>
          </td>
        </tr>
        <tr>
          <td>Website:</td>
          <td>
            <%$CMAIL.website%>
          </td>
        </tr>
      </tbody>
    </table>
    <h3 class="mt-3">Submitted fields</h3>
    <table class="w100">
      <colgroup>
        <col class="table-bordered w50">
        <col class="table-bordered w50">
      </colgroup>
      <thead>
        <tr>
          <th>Field</th>
          <th>Value</th>
        </tr>
      </thead>
      <tbody>
        <% foreach from=$CMAIL.rows key=rkey item=val %>
        <tr>
          <td>
            <%$rkey%>
          </td>
          <td>
            <%$val%>
          </td>
        </tr>
        <% /foreach%>
      </tbody>
    </table>
  </div>
</page>