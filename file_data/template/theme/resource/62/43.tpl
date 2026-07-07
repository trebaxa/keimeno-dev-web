<section class="my-5">
  <div class="container">
    <div class="cover position-relative">
      <div class="image">
        <img alt="<%$resrc.var.fv_themenbild_alt|sthsc%>" class="img-fluid" src="<%$resrc.var.fv_themenbild%>" loading="lazy">
      </div>
      <div class="headline position-absolute fixed-bottom">
        <div class="row">
          <div class="col-10 offset-1">
            <h1 class="display-4 text-white mb-5">
              <%$resrc.var.fv_titel%>
            </h1>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="my-5 pb-5">
  <div class="container">
    <div class="row">
      <div class="col-12 col-lg-10 offset-lg-1">
        <%if ($resrc.var.fv_einleitung)%>
          <p class="lead">
            <%$resrc.var.fv_einleitung%>
          </p>
        <%/if%>
        <%$resrc.var.fv_beschreibung%>
      </div>
    </div>
  </div>
</section>