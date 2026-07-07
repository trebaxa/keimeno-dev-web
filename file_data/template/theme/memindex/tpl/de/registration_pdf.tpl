<%assign var="print_width" value="500pt"%>
<style>
html,
body {
  margin: 0;
  padding: 0;
  font-family: Tahoma, Verdana, Arial, sans-serif;
  font-size: 8pt;
  line-height: 1.3;
  color: #000000;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
}
td,
th {
  vertical-align: top;
}
.full-table {
  width: <%$print_width%>;
}
.max-width {
  width: <%$print_width%>;
}
.text-left {
  text-align: left;
}
.text-right {
  text-align: right;
}
.text-center {
  text-align: center;
}
<% section name=val start=5 step=5 loop=105 %>
.w<%$smarty.section.val.index%> {
  width: <%$smarty.section.val.index%>%;
}
<%/section%>
.w33 {
  width: 33.333%;
}
.wauto {
  width: auto;
}
.page-content {
  padding: 0;
}
.table-bordered {
  border: 0.5pt solid #444444;
}
.table-bordered td,
.table-bordered th {
  border: 0.5pt solid #444444;
  padding: 4pt 5pt;
}
.content-table td,
.content-table th {
  padding: 3pt 4pt;
}
.no-break {
  page-break-inside: avoid;
}
.small-text {
  font-size: 6.5pt;
  line-height: 1.2;
}
.header-text {
  font-size: 7pt;
  line-height: 1.25;
}
h1 {
  font-size: 14pt;
  font-weight: bold;
  margin: 0 0 10pt 0;
  padding: 0;
}
.label {
  font-weight: bold;
  white-space: nowrap;
}
.value {
  word-wrap: break-word;
  overflow-wrap: break-word;
}
</style>
<page backtop="32mm" backbottom="18mm" backleft="15mm" backright="15mm">
  <page_header>
    <table class="full-table">
      <tr>
        <td class="text-left header-text" style="width:70%;">
          <%$gbl_config.adr_firma%><br>
          <%$gbl_config.adr_forename%> <%$gbl_config.adr_surename%><br>
          <%$gbl_config.adr_street%><br>
          <%$gbl_config.adr_plz%> <%$gbl_config.adr_town%>
        </td>
        <td class="text-right header-text" style="width:30%;">
          <%*
          <img loading="lazy" src="http://dev.keimeno.de/file_server/logo.jpg" style="max-height:40px;" alt="Firmenlogo">
          *%>
        </td>
      </tr>
    </table>
  </page_header>
  <page_footer>
    <table class="full-table">
      <tr>
        <td class="text-left small-text" style="width:75%;">
          <%$gbl_config.adr_firma%> - <%$gbl_config.adr_street%>, <%$gbl_config.adr_plz%> <%$gbl_config.adr_town%>
        </td>
        <td class="text-right small-text" style="width:25%;">
          Seite [[page_cu]] / [[page_nb]]
        </td>
      </tr>
    </table>
  </page_footer>
  <div class="page-content">
    <h1>Antrag auf Mitgliedschaft</h1>
    <table class="full-table table-bordered no-break" style="margin-top:10pt;">
      <tr>
        <td class="w25 label">Name:</td>
        <td class="w25 value"><%$custpdf.customer.nachname%></td>
        <td class="w25 label">Vorname:</td>
        <td class="w25 value"><%$custpdf.customer.vorname%></td>
      </tr>
    </table>
  </div>
</page>