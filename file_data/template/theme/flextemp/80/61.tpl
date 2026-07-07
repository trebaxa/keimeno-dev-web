<section class="section-panel section-space">
  <div class="container">
    <%if ($flxt.var.fv_titel_6)%>
      <h2 class="section-title"><%$flxt.var.fv_titel_6%></h2>
    <%/if%>
    <%if ($flxt.var.fv_text_1)%>
      <div class="lead mt-4 text-secondary"><%$flxt.var.fv_text_1%></div>
    <%/if%>
    <%if ($flxt.var.fv_link)%>
      <a class="btn btn-primary btn-lg mt-4" href="<%$flxt.var.fv_link%>" title="<%$flxt.var.fv_link_title%>" target="<%$flxt.var.fv_link_target%>" role="button"><%$flxt.var.fv_link_title%></a>
    <%/if%>
  </div>
</section>
