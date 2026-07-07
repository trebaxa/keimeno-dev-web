<section class="py-5 my-5" role="region" aria-label="Main Content">
  <div class="container">
    <%if ($flxt.var.fv_titel)%>
    <div class="row">
      <div class="col-12">
        <h2 id="sectionTitle"><%$flxt.var.fv_titel%></h2>
      </div>
    </div>
    <%/if%>
    <div class="row">
      <div class="col-12 col-lg-6 order-2 order-lg-1">
        <img 
          src="<%$flxt.var.fv_bild%>" 
          alt="<%$flxt.var.fv_bild_alt|sthsc%>" 
          class="img-fluid"
          loading="lazy"
          role="img"
          aria-labelledby="sectionTitle">
      </div>
      <div class="col-12 col-lg-6 order-1 order-lg-2">
        <%$flxt.var.fv_text%>
        <div class="bars">
          <% foreach from=$flxt.dataset.balkendiagramm item=row %>
            <div class="progress mb-3" role="progressbar" aria-valuenow="<%$row.wert_edt.value%>" aria-valuemin="0" aria-valuemax="100">
              <div class="progress-bar bg-<%$row.farbe_seli.vident%>"
                role="presentation" 
                style="width: <%$row.wert_edt.value%>%"
              >
                <span><%$row.label_edt.value%></span>
              </div>
            </div>
          <%/foreach%> 
        </div>
      </div>
    </div>
  </div>
</section>