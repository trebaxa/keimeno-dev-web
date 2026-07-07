<section class="bg-light py-5">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="page-header mb-3">
                    <h2>Produkte</h2>
                </div>
            </div>
        </div>

        <div class="row align-items-stretch">
            <% foreach from=$KSHOP.products item=row %>
            <div class="col-md-4 col-sm-12">
                <div class="product">
                    <a title="Zum Produkt" href="<%$row.link%>"
                        class="product__header">
                        <img src="<%$row.image.img_boxed%>" alt="Boxed">
                    </a>
                    <div class="product__body">
                        <h5><%$row.p_name%></h5>
                        <div class="description"><%$row.p_content|st|truncate:100%></div>
                    </div>
                    <div class="product__footer">
                        <a title="Zum Produkt"
                            href="<%$row.link%>"
                            class="btn btn-primary btn-block mb-0">Detail</a>
                    </div>
                </div>
            </div>
            <%/foreach%>
        </div>

    </div>
</section>