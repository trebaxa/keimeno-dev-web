<section style="background-color:green;">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <% foreach from=$flxt.dataset.heroslider item=row %>
      <li data-target="#carouselExampleCaptions" data-slide-to="<%$row@index%>" class="active"></li>
      <%/foreach%>
    </ol>
    <div class="carousel-inner">
      <% foreach from=$flxt.dataset.heroslider item=row %>
      <div class="carousel-item <%if ($row@first)%>active<%/if%>">
        <img src="<%$row.bild_img.thumb%>" class="d-block w-100" alt="<%$row.bild_img.alt|sthsc%>" loading="lazy">
        <div class="carousel-caption d-none d-md-flex flex-column h-100">
          <h3 class="h1 mt-auto"><%$row.slidetite_edt.value%></h3>
          <p class="h3 mb-auto"><%$row.slidesubt_edt.value%></p>
        </div>
      </div>
     <%/foreach%>
    </div>
    <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </button>
  </div>
</section>