<section class="bg-light mt-6 pb-10">
  <div class="container">
    <div class="row">
      <h2>Auftrag erhalten</h2>
    </div>

    <h4>Ihre Bestellnummer lautet: <%$KSHOP.order.oid%></h4>
    
    <% if ($KSHOP.order.o_state!="approved") %>
    <div class="alert alert-danger">Die Bezahlung wurde nicht ordnungsgemäß durchgeführt. Status: "<%$KSHOP.order.o_state%>"</div>
    <% else %>
    <div class="alert alert-success">Ihre Bestellung wurde erfolgreich bezahlt.</div>
    <%/if%>
  </div>
</section>