<%counter assign="services_counter"%>
<%$section_uid = "services-"|cat:$services_counter%>
<section class="section-soft section-space" id="<%$section_uid%>">
  <div class="container">
    <%if ($flxt.var.fv_titel_8)%>
    <div class="row mb-4">
      <div class="col-12">
        <h2 class="section-title"><%$flxt.var.fv_titel_8%></h2>
      </div>
    </div>
    <%/if%>
    <div class="row">
      <div class="col-12 mb-4">
        <ul class="nav nav-pills service-tabs gap-2" id="nav-<%$section_uid%>" role="tablist">
          <% foreach from=$flxt.var.fv_leistungen item=row %>
          <%$tab_id = $section_uid|cat:"-"|cat:($row.fv_titel|md5)%>
          <li class="nav-item" role="presentation">
            <button
              class="nav-link<% if ($row@first) %> active<%/if%>"
              id="tab-<%$tab_id%>"
              type="button"
              role="tab"
              data-bs-toggle="tab"
              data-bs-target="#content-<%$tab_id%>"
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
        <div class="tab-content" id="nav-<%$section_uid%>-Content">
          <% foreach from=$flxt.var.fv_leistungen item=row %>
          <%$tab_id = $section_uid|cat:"-"|cat:($row.fv_titel|md5)%>
          <div id="content-<%$tab_id%>"
            class="tab-pane fade<% if ($row@first) %> show active<%/if%>"
            role="tabpanel"
            aria-labelledby="tab-<%$tab_id%>"
          >
            <div class="row g-4 align-items-center">
              <div class="col-12 col-md-6 col-lg-4">
                <div class="service-illustration rounded-4 p-3">
                  <img
                    class="img-fluid rounded-4"
                    src="<%$row.fv_themenbild_img_md%>"
                    alt="<%$row.fv_themenbild_alt|sthsc%>"
                    loading="lazy"
                  >
                </div>
              </div>
              <div class="col-12 col-md-6 col-lg-8">
                <%if ($row.fv_einleitung)%>
                <p class="lead text-secondary">
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