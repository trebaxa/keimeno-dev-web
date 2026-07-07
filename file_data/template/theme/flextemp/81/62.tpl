<section class="section-space section-panel">
  <div class="container">
    <div class="row">
      <div class="col-xl-8">
        <% if ($flxt.var.fv_titel_6) %>
        <h2 class="section-title"><% $flxt.var.fv_titel_6 %></h2>
        <% /if %>
        <hr class="section-rule">
        <% if ($flxt.var.fv_text_1) %>
        <div class="lead mb-4"><% $flxt.var.fv_text_1 %></div>
        <% /if %>
        <% if ($flxt.var.fv_link) %>
        <a
          class="btn btn-primary btn-lg"
          href="<% $flxt.var.fv_link %>"
          target="<% $flxt.var.fv_link_target %>"
          title="<% $flxt.var.fv_link_title %>"
          <% if ($flxt.var.fv_link_target == '_blank') %>rel="noopener noreferrer"<% /if %>
        >
          <% $flxt.var.fv_link_title %>
        </a>
        <% /if %>
      </div>
    </div>
  </div>
</section>