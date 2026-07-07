<section class="resource-section" id="resources">
  <%if ($flxt.var.fv_titel_7)%>
  <div class="container">
    <div class="row py-5">
      <div class="col-12">
        <h2 class="section-title"><%$flxt.var.fv_titel_7%></h2>
      </div>
    </div>
  </div>
  <%/if%>
  <div class="resource-section__dark py-5">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <ul class="nav nav-pills resource-pills mb-4 gap-2" id="resourceTabs" role="tablist">
            <% foreach from=$flxt.var.fv_lnder item=row %>
            <%$country_tab_id = "country-<%$row.fv_name|md5%>"%>
            <li class="nav-item" role="presentation">
              <button class="nav-link <%if ($row@first)%>active<%/if%>" id="<%$country_tab_id%>-tab" data-resource-slide="<%$row@index%>" type="button" role="tab" aria-controls="<%$country_tab_id%>" aria-selected="<%if ($row@first)%>true<%else%>false<%/if%>"><%$row.fv_name%></button>
            </li>
            <%/foreach%>
          </ul>
        </div>
      </div>
    </div>
    <div class="resource-groups-slider js-resource-groups-slider">
      <% foreach from=$flxt.var.fv_lnder item=row %>
        <%$country_tab_id = "country-<%$row.fv_name|md5%>"%>
        <div class="resource-group-slide" id="<%$country_tab_id%>" role="tabpanel" aria-labelledby="<%$country_tab_id%>-tab">
          <div class="container">
            <div class="resource-slider js-resource-slider">
              <% foreach from=$row.dataset.resrc_ds_defaultdb item=ds %>
                <article class="resource-slide">
                  <div class="row g-4 align-items-start">
                    <div class="col-12 col-lg-4">
                      <h3 class="h3 text-white mb-3"><%$ds.dv_stadt.resrc.var.fv_name%></h3>
                      <figure class="mb-0">
                        <img alt="<%$ds.dv_stadt.resrc.var.fv_bild|sthsc%>" class="img-fluid rounded-4 bg-white" src="<%$ds.dv_stadt.resrc.var.fv_bild%>" loading="lazy">
                        <figcaption class="small text-white-50 mt-2"><%$ds.dv_stadt.resrc.var.fv_beschreibung%></figcaption>
                      </figure>
                    </div>
                    <div class="col-12 col-lg-8">
                      <%foreach from=$ds.dv_stadt.resrc.dataset.resrc_ds_defaultdb_1 item=ort %>
                        <div class="card resource-card mb-3">
                          <div class="card-body">
                            <h4 class="h5 card-title"><%$ort.dv_name.value%></h4>
                            <div class="card-text text-secondary"><%$ort.dv_beschreibung.value%></div>
                          </div>
                        </div>
                      <%/foreach%>
                    </div>
                  </div>
                </article>
              <%/foreach%>
            </div>
          </div>
        </div>
      <%/foreach%>
    </div>
  </div>
</section>
