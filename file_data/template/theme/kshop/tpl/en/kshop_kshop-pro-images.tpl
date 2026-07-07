  <% if ($cmd=='reload_pro_imgs' || $cmd=='edit_product') %>
  <form class="jsonform" method="POST" action="<%$eurl%>">
    <input type="hidden" name="cmd" value="save_proimg_sort" />
    <input type="hidden" name="pid" value="<%$KSHOP.images.0.pic_pid%>" />
    <div class="container">
      <div class="row g-3">
        <div class="col-12 mb-3">
          <h5>Galerie des Produktes</h5>
        </div>
        <% if ( isset($KSHOP.images) && is_array($KSHOP.images) && count($KSHOP.images)>0) %>
        <% foreach from=$KSHOP.images item=row %>
        <div class="col-6 col-md-4">
          <a title="<%$row.pic_name%>" href="/file_data/kshop/<%$customer.kid%>/<%$row.pic_name%>" data-fancybox="gallery"><img src="<%$row.img_boxed%>" class="img-fluid" alt="<%$row.pic_name%>"></a>
          <div class="text-center">
            <a title="Löschen" href="<%$eurl%>cmd=del_pro_pic&id=<%$row.id%>" class="btn btn-danger btn-sm">Löschen</a>

            <label for="pic_sort">Sortierung</label>
            <input class="form-control" type="text" id="pic_sort" name="FORM[<%$row.id%>][pic_sort]" value="<%$row.pic_sort|intval%>" />
          </div>
        </div>
        <%/foreach%>
        <div class="col-12">
          <button type="submit" class="btn btn-primary btn-sm">Sortierung speichern</button>
        </div>
        <%else%>
        <div class="alert alert-danger">Es fehlen noch Bilder</div>
        <%/if%>
      </div>
    </div>
  </form>
  <%/if%>