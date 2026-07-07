<section class="light mt-6 pb-10">
  <div class="container">
    <%* $KSHOP.product|echoarr *%>
    <div class="row">
      <div class="col-lg-6 col-md-6">
        <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">sss
            <% foreach from=$KSHOP.product.images item=row name=pics %>
            <div class="carousel-item">
              <a data-fancybox="gal" data-src="<%$row.img_detail %>">
                <img src="<%$row.img_detail_boxed %>" alt="Bild" class="product-img mb-3">
              </a>
            </div>
            <%/foreach%>
          </div>
          <a class="carousel-control-prev" href="#productCarousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Vorheriges</span>
          </a>
          <a class="carousel-control-next" href="#productCarousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Nächstes</span>
          </a>
        </div>
        <div id="productThumbnails" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <% foreach from=$KSHOP.product.images item=row name=thumbs %>
            <div class="carousel-item">
              <img src="<% $row.img_boxed%>" alt="Bild">
            </div>
            <%/foreach%>
          </div>
        </div>
      </div>
      <div class="col-lg-6 col-md-6">
        <div class="row">
          <div class="col">
            <h3><%$KSHOP.product.p_name%></h3>
            <h4 class="mb-3"><%$KSHOP.product.p_subtitle%></h4>
            <hr>
            <h6>Beschreibung</h6>
            <%$KSHOP.product.p_content%>
          </div>
        </div>
        <form action="<%$eurl%>" method="POST">
          <input type="hidden" name="cmd" value="add_basket">
          <input type="hidden" name="FORM[b_pid]" value="<%$KSHOP.product.pid%>">
          <div class="row mt-4">
            <div class="col-6">
              <label for="">Menge:</label>
              <div class="input-group">
                <button class="btn" type="button" onclick="document.querySelector('#b_qty').stepDown()">-</button>
                <input type="number" min="1" value="1" max="10" name="FORM[b_qty]" id="b_qty" class="form-control">
                <button class="btn" type="button" onclick="document.querySelector('#b_qty').stepUp()">+</button>
              </div>
            </div>
            <div class="col-6">
              <button class="btn btn-primary btn-block mb-2" type="submit">In den Warenkorb</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>