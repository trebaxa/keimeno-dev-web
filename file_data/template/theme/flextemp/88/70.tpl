<section class="my-5 py-5" aria-label="<% $flxt.var.fv_titel_12 %>">
  <div class="container">
    <div class="row">
      <div class="col-12 col-lg-8 mb-2 <% if ($flxt.var.fv_bildposition == 0) %> order-lg-2 <% /if %>">
        <div class="text">
          <% if ($flxt.var.fv_titel_12) %>
            <h3><% $flxt.var.fv_titel_12 %></h3>
          <% /if %>
          <% $flxt.var.fv_text_2 %>
        </div>
        <% if ($flxt.var.fv_link_1) %>
          <div class="buttons <% if ($flxt.var.fv_bildposition == 0) %> justify-content-end <% /if %>">
            <a 
               href="<% $flxt.var.fv_link_1 %>"
               target="<% $flxt.var.fv_link_1_target %>"
               title="<% $flxt.var.fv_link_1_title %>"
               class="btn btn-primary"
               aria-label="<% $flxt.var.fv_link_1_title %>"
               <% if ($flxt.var.fv_link_1_target == '_blank') %>rel="noopener noreferrer"<% /if %>
            >
              <% $flxt.var.fv_link_1_title %>
            </a>
          </div>
        <% /if %>
      </div>
      <div class="col-12 col-lg-4 <% if ($flxt.var.fv_bildposition == 0) %> order-lg-1 <% /if %>">
        <div class="image">
          <img 
               src="<% $flxt.var.fv_bild_2 %>"
               class="img-fluid"
               loading="lazy"
               decoding="async"
               <%$flxt.var.fv_bild_2_sizes%>
               alt="<% if ($flxt.var.fv_bild_2_alt) %><% $flxt.var.fv_bild_2_alt %><% else %><% $flxt.var.fv_titel_12 %><% /if %>"
          />
        </div>
      </div>
    </div>
  </div>
</section>