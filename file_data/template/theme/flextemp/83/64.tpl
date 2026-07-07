<section class="my-5 py-5">
  <div class="container">
    <%if ($flxt.var.fv_titel_8)%>
    <div class="row mb-4">
      <div class="col-12">
        <h2><%$flxt.var.fv_titel_8%></h2>
      </div>
    </div>
    <%/if%>
    <div class="row">
      <div class="col-12 mb-4">
        <ul class="nav nav-tabs" id="nav-<%$flxt.var.fv_titel_8|md5%>" role="tablist">
          <% foreach from=$flxt.var.fv_leistungen item=row %>
          <%$tab_id = $row.fv_titel|md5%>
          <li class="nav-item" role="presentation">
            <button
              class="nav-link<% if ($row@first) %> active<%/if%>"
              id="tab-<%$tab_id%>tab"
              data-toggle="tab"
              data-target="#content-<%$tab_id%>"
              type="button"
              role="tab"
              aria-controls="content-<%$tab_id%>"
              aria-selected="<%if ($row@first)%>true<%else%>false<%/if%>"
            >
                <%$row.fv_titel%>
              </button>
          </li>
          <%/foreach%> 
        </ul>
      </div>
      <div class="col-12">
        <!-- Tab panes -->
        <div class="tab-content" id="nav-<%$flxt.var.fv_titel_4|md5%>-Content">
          <% foreach from=$flxt.var.fv_leistungen item=row %>
           <%$tab_id = $row.fv_titel|md5%>
            <div id="content-<%$tab_id%>" class="tab-pane fade<% if ($row@first) %> show active<%/if%>" role="tabpanel" aria-labelledby="tab-<%$tab_id%>tab">
              <div class="row">
                <div class="col-12 col-md-6 col-lg-4">
                  <div class="image">
                    <img class="img-fluid img-thumbnail" src="<%$row.fv_themenbild_img_md%>" alt="<%$row.fv_themenbild_alt|sthsc%>" loading="lazy">
                  </div>
                </div>
                <div class="col-12 col-md-6 col-lg-8">
                  <%if ($row.fv_einleitung)%>
                  <p class="lead">
                    <%$row.fv_einleitung%>
                       <%$row.fv_beschreibung|st|unescape:"htmlall":"UTF-8"|truncate:300%> 
                  </p>
                  <%/if%>
                  <a href="<%$row.resrc_link%>" title="<%$row.fv_titel|sthsc%>" class="btn btn-primary">
                    mehr lesen
                  </a>
                </div>
              </div>
            </div>
          <%/foreach%> 
        </div>
      </div>
    </div>
  </div>
</section>