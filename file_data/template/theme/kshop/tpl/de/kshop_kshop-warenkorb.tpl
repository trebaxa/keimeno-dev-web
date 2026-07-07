<section class="light mt-6 pb-10">
  <div class="container">
    <div class="row">
      <h2>Warenkorb</h2>
    </div>
<% if (count($KSHOP.basket.baskets)>0) %>
    <% foreach from=$KSHOP.basket.baskets item=basket %>
    <div class="row my-3">
      <div class="col-md-6 col-lg-6 col-sm-12">
        <h3><%$basket.customer.firma%></h3>
      </div>
      <div class="col-md-6 col-lg-6 col-sm-12 text-right">
        <img src="<%$basket.customer.img_boxed%>" alt="Warenkorb" style="height:100px">
      </div>
    </div>
    <table class="table">
      <thead>
        <tr>
          <th>Produkt</th>
          <th>Untertitel</th>
          <th>Menge</th>
          <th class="text-right">Preis (br)</th>
          <th></th>
        </tr>
      </thead>

      <tbody>
        <% foreach from=$basket.items item=row %>
        <tr>
          <td><%$row.p_name%></td>
          <td><%$row.p_subtitle%></td>
          <td><%$row.b_qty%></td>
          <td class="text-right"><%$row.p_vkbr|number_format:2:",":"."%> €</td>
          <td class="text-right">
            <% foreach from=$row.icons item=picon %><%$picon%><%/foreach%>
          </td>
        </tr>
        <%/foreach%>

      </tbody>
      <tfoot>
        <tr>
          <td colspan="3">Zwischensumme:</td>
          <td class="text-right"><%$basket.total_br|number_format:2:",":"."%> €</td>
          <td></td>
        </tr>
        <tr>
          <td colspan="3">Versand:</td>
          <td class="text-right"><%$basket.delivery.d_pricebr|number_format:2:",":"."%> €
            <!--<br><small><%$basket.weight|number_format:2:",":"."%> KG</small>-->
          </td>
          <td></td>
        </tr>
        <tr>
          <td colspan="3">Summe:</td>
          <td class="text-right"><%$basket.total_sum_br|number_format:2:",":"."%> €</td>
          <td></td>
        </tr>
      </tfoot>
    </table>
    <div class="text-right">
      <a title="Zur Kasse" href="<%$eurl%>cmd=checkout&section=product&kid=<%$basket.customer.kid%>" class="btn btn-primary">zur Kasse</a>
    </div>
    <hr>
    <%/foreach%>
  </div>
</section>
<%else%>
  <div class="alert alert-info">Ihr Warenkorb ist leer.</div>
<%/if%>

<script>
  fwstart();
</script>