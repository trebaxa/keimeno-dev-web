<section class="section-space section-panel" id="security" role="region" aria-labelledby="sectionTitle">
  <div class="container">
    <%if ($flxt.var.fv_titel)%>
    <div class="row mb-4">
      <div class="col-12">
        <h2 class="section-title" id="sectionTitle"><%$flxt.var.fv_titel%></h2>
      </div>
    </div>
    <%/if%>
    <div class="row align-items-center g-5">
      <div class="col-12 col-lg-6 order-2 order-lg-1">
        <img src="<%$flxt.var.fv_bild%>" alt="<%$flxt.var.fv_bild_alt|sthsc%>" class="img-fluid rounded-4 shadow-sm" loading="lazy">
      </div>
      <div class="col-12 col-lg-6 order-1 order-lg-2">
        <div class="text-secondary fs-5 mb-4"><%$flxt.var.fv_text%></div>
        <div class="progress-stack">
          <% foreach from=$flxt.dataset.balkendiagramm item=row %>
            <div class="mb-3">
              <div class="d-flex justify-content-between small text-secondary mb-2">
                <span><%$row.label_edt.value%></span>
                <span><%$row.wert_edt.value%>%</span>
              </div>
              <div class="progress progress-modern" role="progressbar" aria-valuenow="<%$row.wert_edt.value%>" aria-valuemin="0" aria-valuemax="100" aria-label="<%$row.label_edt.value|sthsc%>">
                <div class="progress-bar bg-<%$row.farbe_seli.vident%>" role="presentation" style="width: <%$row.wert_edt.value%>%"></div>
              </div>
            </div>
          <%/foreach%>
        </div>
      </div>
    </div>
  </div>
</section>
