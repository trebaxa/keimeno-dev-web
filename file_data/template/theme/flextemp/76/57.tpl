<section class="hero-carousel-section">
  <div id="homepageCarousel" class="carousel slide hero-carousel" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <% foreach from=$flxt.dataset.heroslider item=row %>
      <button type="button" data-bs-target="#homepageCarousel" data-bs-slide-to="<%$row@index%>" class="<%if ($row@first)%>active<%/if%>" <%if ($row@first)%>aria-current="true"<%/if%> aria-label="Slide <%$row@iteration%>"></button>
      <%/foreach%>
    </div>
    <div class="carousel-inner">
      <% foreach from=$flxt.dataset.heroslider item=row %>
      <div class="carousel-item <%if ($row@first)%>active<%/if%>">
        <img src="<%$row.bild_img.thumb%>" class="d-block w-100 hero-carousel__image" alt="<%$row.bild_img.alt|sthsc%>" loading="lazy">
        <div class="carousel-caption d-flex flex-column justify-content-center text-start h-100">
          <span class="hero-carousel__eyebrow">Keimeno CMS Demo</span>
          <h1 class="display-4 fw-bold mt-auto mt-lg-0"><%$row.slidetite_edt.value%></h1>
          <p class="lead mb-0"><%$row.slidesubt_edt.value%></p>
        </div>
      </div>
      <%/foreach%>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#homepageCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#homepageCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</section>
