<% if ($cmd=="edit") %>
    <% include file="calendareditor.tpl" %>
  <% elseif $cmd=="showevent" %>
    <% include file="cal_detail.tpl" %>
  <% else %>

  <% if ($GET.waitapp==1) %>
  <div class="alert alert-info">Ihr Eintrag wurde gespeichert und wartet nun auf die Genehmigung zur Veröffentlichung</div>
  <%/if%>

  <select class="form-control" onChange="location.href=this.options[this.selectedIndex].value">
    <%section name=chk start=2008 max=$cal_year_today+1 loop=$cal_year_today+1 step=1%>
    <option <% if ($cal_year==$smarty.section.chk.index) %>selected<%/if%> value="<%$PHPSELF%>?cmd=showday&page=<%$page%>&seldate=<%$smarty.section.chk.index%>-<%$cal_month%>-<%$cal_day%>"><%$smarty.section.chk.index%></option>
    <%/section%>
  </select>
  <% if ($themes) %>
  <div class="shadetabs">
    <ul>
      <% foreach from=$themes item=theme name=mt %>
      <li <% $theme.class %>><a href="<% $theme.link %>"><% $theme.theme %></a></li>
      <% /foreach %>
    </ul>
  </div>
  <% /if %>
  <% include file="cal_month_boxes.tpl" %>
  <% if ($customer.PERMOD.calendar.add==true) %>
  <button onclick="location.href='<%$PHPSELF%>?page=<%$page%>&seldate=<%$selected_date%>&cmd=edit&id=0'" type="button" class="btn btn-primary">Hinzufügen</button>
  <%/if%>
  <% if $cmd=='showday' %>
  <h1>Tagesüberblick | <% $seldate %></h1>
  <table class="table table-striped table-hover">
    <% foreach from=$mdates_day item=mdate name=mt %>
    <% include file="cal_table.tpl" %>
    <% /foreach %>
  </table>
  <% if $counter==0 %>Keine Einträge<% /if %>
  <% /if %>
  <% if $cmd=='showmonth' %>
  <h1>Monatsüberblick | <% $cal_month_str %> <% $cal_year %></h1>
  <table class="table table-striped table-hover">
    <% foreach from=$mdates_month item=mdate name=mt %>
    <% include file="cal_table.tpl" %>
    <% /foreach %>
  </table>
  <% if $counter==0 %>Keine Einträge<% /if %>
  <% /if %>
  <% include file="cal_sorted_view.tpl" %>
  <h1>Jahresüberlick</h1>
  <table class="table table-striped table-hover">
    <% foreach from=$mdates item=mdate name=mt %>
    <% include file="cal_table.tpl" %>
    <% /foreach %>
  </table>
  <% if $counter==0 %>Keine Einträge<% /if %>
  <% /if %>