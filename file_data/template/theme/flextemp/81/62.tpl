<section class="jumbotron py-5">
  <div class="container">
    <%if ($flxt.var.fv_titel_6)%>
      <h2 class="headline"><%$flxt.var.fv_titel_6%></h2>
    <%/if%>
    <%if ($flxt.var.fv_titel_6) && ($flxt.var.fv_text_1)%>
      <hr class="my-4">
    <%/if%>
    <%if ($flxt.var.fv_text_1)%>
      <p class="lead"><%$flxt.var.fv_text_1%></p>
    <%/if%>
    <%if ($flxt.var.fv_link)%>
      <a class="btn btn-primary btn-lg" href="<%$flxt.var.fv_link%>" title="<%$flxt.var.fv_link_title%>" target="<%$flxt.var.fv_link_target%>" role="button"><%$flxt.var.fv_link_title%> &raquo;</a>
    <%/if%>
  </div>
</section>