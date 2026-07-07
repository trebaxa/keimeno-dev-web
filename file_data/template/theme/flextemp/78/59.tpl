<section class="section-space" role="region" aria-labelledby="section-title">
  <div class="container">
    <%if ($flxt.var.fv_titel_3)%>
    <div class="row mb-4">
      <div class="col-12">
        <h2 class="section-title" id="section-title">
          <%$flxt.var.fv_titel_3%>
        </h2>
      </div>
    </div>
    <%/if%>
    <div class="row">
      <% foreach from=$flxt.dataset.contentcards item=row %>
      <div class="col-12 col-md-6 col-lg-4 mb-4">
        <div class="card content-card h-100" role="article" aria-labelledby="card-title-<%$row@iteration%>" aria-describedby="card-text-<%$row@iteration%>">
          <img src="<%$row.bild_img.thumb%>" class="card-img-top" alt="<%$row.bild_img.alt|sthsc%>" loading="lazy">
          <div class="card-body">
            <h3 class="card-title" id="card-title-<%$row@iteration%>"><%$row.titel_edt.value%></h3>
            <p class="card-text text-secondary" id="card-text-<%$row@iteration%>"><%$row.text_edt.value|nl2br%></p>
            <a href="<%$row.link_link.value%>" target="<%$row.link_link.target%>" class="btn btn-primary mt-3" title="<%$row.link_link.title%>" aria-label="<%$row.link_link.title%> - <%$row.titel_edt.value%>">
              <%$row.link_link.title%>
            </a>
          </div>
        </div>
      </div>
      <%/foreach%>
    </div>
  </div>
</section>
