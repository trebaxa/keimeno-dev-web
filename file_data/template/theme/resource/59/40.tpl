<section>
  <div class="container">
    <h2><%$resrc.var.fv_name%></h2>
    <p><%$resrc.var.fv_beschreibung%></p>
    <img loading="lazy" alt="<%$resrc.var.fv_bild_alt%>" src="<%$resrc.var.fv_bild%>" <%$resrc.var.fv_bild_sizes%>>
  </div>
</section>
<section>
  <div class="container">
    <h6>Datasets</h6>
    <h3><%$resrc.c_db_settings.table_names.resrc_ds_defaultdb_1.db_title%></h3>
    <% foreach from=$resrc.dataset.resrc_ds_defaultdb_1 item=row %>
      <div>
        <h4><%$row.dv_name.value%></h4>
        <p><%$row.dv_beschreibung.value%></p>
        <img loading="lazy" alt="<%$row.dv_bild.alt%>" src="<%$row.dv_bild.thumb%>" <%$row.dv_bild.img_sizes%>>
      </div>
    <%/foreach%>
  </div>
</section>