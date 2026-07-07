<section class="breaker position-relative">
  <%if ($flxt.var.fv_titel_1)%>
  <div class="container h-100 position-absolute fixed-top">
    <div class="row h-100">
      <div class="col-12 my-auto">
        <div class="headline text-white"><%$flxt.var.fv_titel_1%></div>
      </div>
    </div>
  </div>
  <%/if%>
  <div class="image overflow-hidden">
    <img src="<%$flxt.var.fv_bild_1%>" class="w-100" alt="<%$flxt.var.fv_image_alt|sthsc%>" loading="lazy" />
  </div>
</section>