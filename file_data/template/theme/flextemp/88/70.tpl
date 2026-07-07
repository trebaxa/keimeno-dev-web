<section class="section-space" id="story" aria-label="<% $flxt.var.fv_titel_12 %>">
  <div class="container">
    <div class="row align-items-center g-5">
      <div class="col-lg-7 order-2 order-lg-1">
        <% if ($flxt.var.fv_titel_12) %>
        <h2 class="h2 mb-3"><% $flxt.var.fv_titel_12 %></h2>
        <% /if %>
        <% if ($flxt.var.fv_text_2) %>
        <div class="text-secondary fs-5"><% $flxt.var.fv_text_2 %></div>
        <% /if %>
        <% if ($flxt.var.fv_link_1) %>
        <a
          href="<% $flxt.var.fv_link_1 %>"
          target="<% $flxt.var.fv_link_1_target %>"
          title="<% $flxt.var.fv_link_1_title %>"
          class="btn btn-primary mt-2"
          aria-label="<% $flxt.var.fv_link_1_title %>"
          <% if ($flxt.var.fv_link_1_target == '_blank') %>rel="noopener noreferrer"<% /if %>
        >
          <% $flxt.var.fv_link_1_title %>
        </a>
        <% /if %>
      </div>
      <div class="col-lg-5 order-1 order-lg-2">
        <img
          src="<% $flxt.var.fv_bild_2 %>"
          class="img-fluid rounded-4 shadow-sm"
          loading="lazy"
          decoding="async"
          <%$flxt.var.fv_bild_2_sizes%>
          alt="<% if ($flxt.var.fv_bild_2_alt) %><% $flxt.var.fv_bild_2_alt %><% else %><% $flxt.var.fv_titel_12 %><% /if %>"
        >
      </div>
    </div>
  </div>
</section>
