<section class="section-space" id="gallery">
  <div class="container">
    <%if ($flxt.var.fv_titel_5)%>
    <div class="row mb-4">
      <div class="col-12">
        <h2 class="section-title"><%$flxt.var.fv_titel_5%></h2>
      </div>
    </div>
    <%/if%>
    <%$gallery_id = $flxt.var.fv_titel_5|default:"gallery"|md5%>
    <div class="masonry-gallery">
    <% foreach from=$flxt.dataset.galerie item=row %>
      <a title="<%$row.bild_img.alt|sthsc%>" href="<%$row.bild_img.img_org%>" class="gallery-card card border-0 overflow-hidden masonry-gallery__item gallery-card--<%$row@iteration%>" data-fancybox="gal-<%$gallery_id%>" data-caption="<%$row.bildtitel_edt.value|default:$row.bild_img.alt|sthsc%>">
        <img src="<%$row.bild_img.img_md%>" class="card-img" alt="<%$row.bild_img.alt|sthsc%>" loading="lazy">
        <%if ($row.bildtitel_edt.value)%>
        <div class="card-img-overlay d-flex align-items-end">
          <h3 class="card-title h6 mb-0"><%$row.bildtitel_edt.value%></h3>
        </div>
        <%/if%>
      </a>
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
