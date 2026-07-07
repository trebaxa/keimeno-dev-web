  <% if ( isset($KSHOP.delivery) && is_array($KSHOP.delivery) && count($KSHOP.delivery)>0) %>
  <table class="table">
    <thead>
      <tr>
        <th>von</th>
        <th>bis</th>
        <th class="text-right">Preis (br)</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <% foreach from=$KSHOP.delivery item=row name="loop" %>
      <tr>
        <td><%$row.d_from%> KG</td>
        <td><%$row.d_to%> KG</td>
        <td class="text-right"><%$row.d_pricebr|number_format:2:",":"."%> €</td>
        <td class="text-right">
          <% if ($smarty.foreach.loop.last) %>
          <% foreach from=$row.icons item=picon %><%$picon%><%/foreach%>
          <%/if%>
        </td>
      </tr>
      <%/foreach%>
    </tbody>
  </table>
  <%/if%>