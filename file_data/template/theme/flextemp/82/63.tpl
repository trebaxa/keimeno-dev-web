<section class="mb-5 py-5">
  <%if ($flxt.var.fv_titel_7)%>
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2><%$flxt.var.fv_titel_7%></h2>
      </div>
    </div>
  </div>
  <%/if%>
  <div class="bg-dark text-white py-5">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <ul class="nav nav-pills mb-4" id="myTab" role="tablist">
            <% foreach from=$flxt.var.fv_lnder item=row %>
            <%$country_tab_id = "country-<%$row.fv_name|md5%>"%> 
            <li class="nav-item" role="presentation">
              <button class="nav-link btn-info <%if ($row@first)%> active<%/if%>" id="<%$country_tab_id%>-tab" data-toggle="tab" data-target="#<%$country_tab_id%>" type="button" role="tab" aria-controls="<%$country_tab_id%>" aria-selected="<%if ($row@first)%>true<%else%>false<%/if%>"><%$row.fv_name%></button>
            </li>
            <%/foreach%>
          </ul>
        </div>
      </div>
    </div>
    <div class="tab-content" id="myTabContent">
      <% foreach from=$flxt.var.fv_lnder item=row %>
        <%$country_tab_id = "country-<%$row.fv_name|md5%>"%> 
        <div class="tab-pane fade<%if ($row@first)%> show active<%/if%>" id="<%$country_tab_id%>" role="tabpanel" aria-labelledby="<%$country_tab_id%>-tab">
          <div class="container-fluid">
            <div id="carouselNations-<%$row.fv_name|md5%>" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <% foreach from=$row.dataset.resrc_ds_defaultdb item=ds %>
                  <div class="carousel-item<%if ($ds@first)%> active<%/if%>">
                    <div class="container">
                      <div class="row align-items-center">
                        <div class="col-12 col-lg-4">
                          <h4>
                            <%$ds.dv_stadt.resrc.var.fv_name%>
                          </h4>
                         <figure class="figure">
                           <img alt="<%$ds.dv_stadt.resrc.var.fv_bild|sthsc%>" class="img-thumbnail" src="<%$ds.dv_stadt.resrc.var.fv_bild%>" loading="lazy">
                           <figcaption class="figure-caption"><%$ds.dv_stadt.resrc.var.fv_beschreibung%></figcaption>
                         </figure>
                        </div>
                        <div class="col-12 col-lg-8 border-left">
                          <%foreach from=$ds.dv_stadt.resrc.dataset.resrc_ds_defaultdb_1 item=ort %>
                            <div class="card text-dark<%if !($ort@last)%> mb-4<%/if%>">
                              <div class="row">
                                <div class="d-none d-md-block col-4">
                                  <div class="image h-100 overflow-hidden">
                                  <img alt="<%$ort.dv_bild.alt|sthsc%>" class="h-100 img-fluid" src="<%$ort.dv_bild.thumb%>" loading="lazy">
                                  </div>
                                </div>
                                <div class="col-12 col-md-8">
                                  <div class="card-body">
                                    <h5 class="card-title">
                                      <%$ort.dv_name.value%>
                                    </h5>
                                    <div class="card-text">
                                      <%$ort.dv_beschreibung.value%>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          <%/foreach%>
                        </div>
                      </div>
                    </div>
                  </div>
                <%/foreach%>
              </div>
              <a class="carousel-control-prev" href="#carouselNations-<%$row.fv_name|md5%>" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselNations-<%$row.fv_name|md5%>" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
        </div>
      <%/foreach%>
    </div>
  </div>
</section>