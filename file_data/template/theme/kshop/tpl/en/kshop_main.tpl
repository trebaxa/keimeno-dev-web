<% if ($section=='product') %>
<link rel="stylesheet" href="/includes/modules/kshop/fonts/icofont/icofont.min.css">
    <% if ($cmd=='show_product') %>
      <% include file="kshop_kshop-produkt-detail.tpl" %>
    <%/if%>
    <% if ($cmd=='checkout') %>
      <% include file="kshop_kshop-checkout.tpl" %>
    <%/if%>
    <% if ($cmd=='show_order_fin') %>
      <% include file="kshop_kshop-bestellung-abgeschlossen.tpl" %>
    <%/if%>
    <% if ($cmd=='show_basket') %>
      <div id="js-basket">
        <% include file="kshop_kshop-warenkorb.tpl" %>
      </div>
    <%/if%>
<%/if%>

<% if ($customer.kid>0) %>
  <% if ($section=='manager') %>
    <% include file="kshop_kshop-manager.tpl" %>
  <%/if%>
<%else%>  
  <div class="alert alert-danger">Bitte einloggen</div>
<%/if%>