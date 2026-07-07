<section class="my-5 py-5">
  <div class="container">
    <%if ($flxt.var.fv_titel_5)%>
    <div class="row">
      <div class="col-12">
        <h2><%$flxt.var.fv_titel_5%></h2> <!-- Changed to H2 for better hierarchy -->
      </div>
    </div>
    <%/if%>
    <div class="row">
    <% foreach from=$flxt.dataset.galerie item=row %>
      <%$id = '<%$flxt.dataset.galerie%>'|md5%>
      <div class="col-6 col-md-4 col-lg-3 mb-4">
        <a title="<%$row.bild_img.alt|sthsc%>" href="<%$row.bild_img.img_org%>" data-fancybox="gal-<%$id%>">
          <div class="card bg-dark text-white">
            <img src="<%$row.bild_img.img_md%>" class="card-img" alt="<%$row.bild_img.alt|sthsc%>" loading="lazy">
            <%if ($row.bildtitel_edt.value)%>
            <div class="card-img-overlay">
              <h3 class="card-title"><%$row.bildtitel_edt.value%></h3> <!-- Improved heading hierarchy -->
            </div>
            <%/if%>
          </div>
        </a>
      </div>
    <%/foreach%>
    </div>
  </div>
</section>
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ImageGallery",
  "name": "<%$flxt.var.fv_titel_5%>",
  "image": [
    <% foreach from=$flxt.dataset.galerie item=row %>
    {
      "@type": "ImageObject",
      "url": "<%$row.bild_img.img_org%>",
      "caption": "<%$row.bildtitel_edt.value%>"
    }<%if !$smarty.foreach.row.last%>,<%/if%>
    <%/foreach%>
  ]
}
</script>