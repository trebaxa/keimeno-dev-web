<link rel="stylesheet" href="/includes/modules/kshop/fonts/icofont/icofont.min.css">
<script src="/includes/modules/kshop/js/dropzone/dropzone.js"></script>
<link rel="stylesheet" href="/includes/modules/kshop/js/dropzone/dropzone.css" />


<section class="bg-light mt-6 pb-10">
  <div class="container">
    <div class="row">
      <div class="col-12">
      <h2>Shop Manager</h2>
      </div>
    </div>

    <div class="btn-group mb-3">
      <a title="Produkte" href="<%$eurl%>cmd=load_products&section=manager" class="btn btn-primary"><i class="icofont-box"></i> Produkte</a>
      <a title="Produkt hinzufügen" href="<%$eurl%>cmd=add_product&section=manager" class="btn btn-primary"><i class="icofont-plus"></i> Produkt hinzufügen</a>
      <a title="Versandkosten" href="<%$eurl%>cmd=show_delivery&section=manager" class="btn btn-primary"><i class="icofont-fast-delivery"></i> Versandkosten</a>
      <a title="Bestellungen" href="<%$eurl%>cmd=show_orders&section=manager" class="btn btn-primary"><i class="icofont-listine-dots"></i> Bestellungen</a>
      <a title="Konfiguration" href="<%$eurl%>cmd=show_config&section=manager" class="btn btn-primary"><i class="icofont-gear"></i> Konfiguration</a>
    </div>

    <% if ($cmd=='show_config') %>
    <form action="<%$eurl%>" method="POST" class="jsonform">
      <input type="hidden" name="cmd" value="save_config">
            <div class="mb-3">
        <label for="shopname" class="form-label">Shopname</label>
        <input name="FORM[shopname]" id="shopname" type="text" class="form-control" value="<%$KSHOP.myconfig.shopname|sthsc%>">
      </div>
      <div class="mb-3">
        <label for="agb" class="form-label">AGB</label>
        <textarea name="FORM[agb]" id="agb" cols="30" rows="10" class="form-control"><%$KSHOP.myconfig.agb|hsc%></textarea>
      </div>
      <div class="mb-3">
        <label for="widerruf" class="form-label">Widerruf</label>
        <textarea name="FORM[widerruf]" id="widerruf" cols="30" rows="10" class="form-control"><%$KSHOP.myconfig.widerruf|hsc%></textarea>
      </div>
      <div class="mb-3">
        <label for="shopinfo" class="form-label">Shop Info</label>
        <textarea name="FORM[shopinfo]" id="shopinfo" cols="30" rows="10" class="form-control"><%$KSHOP.myconfig.shopinfo|hsc%></textarea>
      </div>
      <button type="submit" class="btn btn-primary">speichern</button>
    </form>
    <%/if%>

    <% if ($cmd=='show_order') %>
    <div class="row mt-3">
      <div class="col-12 mb-3">
        <h3>Auftrag: <%$KSHOP.order.oid%></h3>
      </div>

      <div class="col-md-6 col-sm-12">
        <address class="lead">
          <strong>
            <%$KSHOP.order.o_firstname%> <%$KSHOP.order.o_lastname%><br>
            <%$KSHOP.order.o_street%> <%$KSHOP.order.o_hnr%><br>
            <%$KSHOP.order.o_plz%> <%$KSHOP.order.o_city%>
          </strong>
        </address>
      </div>

      <div class="col-md-6 col-sm-12 text-md-end text-right">
        <strong class="lead">
          Datum: <%$KSHOP.order.o_date_ger%><br>
          Auftrag ID: <%$KSHOP.order.oid%><br>
          Wert: <%$KSHOP.order.o_brutto|number_format:2:",":"."%> €<br>
        </strong>
      </div>
    </div>

    <table class="table mt-3">
      <thead>
        <tr>
          <th>Menge</th>
          <th>Produkt</th>
          <th>St.</th>
          <th class="text-end">Einzel</th>
          <th class="text-end">Gesamt</th>
        </tr>
      </thead>
      <tbody>
        <% foreach from=$KSHOP.order.products item=row %>
        <tr>
          <td><%$row.oi_qty%></td>
          <td><%$row.oi_pname%><br><%$row.oi_subtitle%></td>
          <td><%$row.oi_tax%>%</td>
          <td class="text-end"><%$row.oi_vkbr|number_format:2:",":"."%> €</td>
          <td class="text-end"><%$row.oi_total_vkbr|number_format:2:",":"."%> €</td>
        </tr>
        <%/foreach%>
        <tr style="border-top:3px solid #000">
          <td colspan="4">Versandkosten:</td>
          <td class="text-end"><strong><%$KSHOP.order.o_delivery_br|number_format:2:",":"."%> €</strong></td>
        </tr>
        <% foreach from=$KSHOP.order.taxes key=t item=tax %>
        <tr>
          <td colspan="4">inkl. <%$t%>% MwSt.:</td>
          <td class="text-end"><strong><%$tax|number_format:2:",":"."%> €</strong></td>
        </tr>
        <%/foreach%>
        <tr>
          <td colspan="4">Summe:</td>
          <td class="text-end"><strong><%$KSHOP.order.o_brutto|number_format:2:",":"."%> €</strong></td>
        </tr>
      </tbody>
    </table>
    <%/if%>

    <% if ($cmd=='show_orders') %>
    <% if ( isset($KSHOP.orders) && is_array($KSHOP.orders) && count($KSHOP.orders)>0) %>
    <div class="btn-group-sm align-start mb-2">
      <a title="Download XLS" href="<%$eurl%>cmd=download_orders_xls&section=manager&a=<%$randid%>" class="btn btn-secondary"><i class="icofont-download"></i> Download XLS</a>
    </div>
    <table class="table">
      <thead>
        <tr>
          <th>AID</th>
          <th>Datum</th>
          <th>Kunde</th>
          <th>Zahlweise</th>
          <th>bezahlt</th>
          <th>Status</th>
          <th class="text-end">Wert (br)</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <% foreach from=$KSHOP.orders item=row %>
        <tr>
          <td><%$row.oid%></td>
          <td><%$row.o_date_ger%></td>
          <td><%$row.o_lastname%></td>
          <td><%$row.o_payment%></td>
          <td><% if ($row.o_payed==1)%>Ja<%else%>Nein<%/if%></td>
          <td><%$row.o_state%></td>
          <td class="text-end"><%$row.o_brutto|number_format:2:",":"."%> €</td>
          <td class="text-end">
            <div class="btn-group-sm mb-0 align-end">
              <% foreach from=$row.icons item=picon %><%$picon%><%/foreach%>
            </div>
          </td>
        </tr>
        <%/foreach%>
      </tbody>
    </table>
    <%/if%>
    <%/if%>

    <% if ($cmd=='show_delivery') %>
    <form action="<%$eurl%>" method="POST" class="jsonform">
      <input type="hidden" name="cmd" value="add_delivery">
      <div class="row">
        <label for="" class="col-md-4 col-lg-4 col-sm-12">
          von (KG):
          <input class="form-control" type="text" readonly="" disabled="" value="<%$KSHOP.maxdelivery.d_to|intval%>">
        </label>
        <label for="" class="col-md-4 col-lg-4 col-sm-12">
          bis (KG):
          <input class="form-control" type="number" value="" placeholder="Gewicht in KG" name="FORM[d_to]">
        </label>
        <label for="" class="col-md-4 col-lg-4 col-sm-12">
          Preis (br):
          <input type="text" class="form-control js-num-field" value="" placeholder="Preis" name="FORM[d_pricebr]">
        </label>
      </div>
      <button class="btn btn-primary mt-2"><i class="icofont-plus"></i> hinzufügen</button>
    </form>
    <div id="js-delivery-matrix"><% include file="kshop_kshop-versandkosten.tpl" %></div>
    <%/if%>

    <% if ($cmd=='load_products') %>

      <div class="table-responsive">
        <table class="table table-hover table-striped">
          <thead>
            <tr>
              <th>Produkt</th>
              <th>Untertitel</th>
              <th class="text-end">Preis (br)</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <% foreach from=$KSHOP.products item=row %>
            <tr>
              <td><%$row.p_name%></td>
              <td><%$row.p_subtitle%></td>
              <td class="text-end"><%$row.p_vkbr|number_format:2:",":"."%> €</td>
              <td class="text-end">
                <div class="btn-group-sm mb-0 align-end text-end">
                  <% foreach from=$row.icons item=picon %><%$picon%><%/foreach%>
                </div>
              </td>
            </tr>
            <%/foreach%>
          </tbody>
        </table>
      </div>

    <%/if%>

    <% if ($cmd=='edit_product') %>
    <form class="jsonform" method="POST" action="<%$eurl%>">
      <input type="hidden" name="cmd" value="save_product">
      <input type="hidden" name="pid" value="<%$KSHOP.product.pid%>">

      <div class="row">
        <label for="" class="col-md-6 col-lg-6 col-sm-12">
          Produkt Name:
          <input type="text" required="" name="FORM[p_name]" value="<%$KSHOP.product.p_name|sthsc%>" class="form-control">
        </label>

        <label for="" class="col-md-6 col-lg-6 col-sm-12">
          Produkt Untertitel:
          <input type="text" name="FORM[p_subtitle]" value="<%$KSHOP.product.p_subtitle|sthsc%>" class="form-control">
        </label>
      </div>

      <div class="row">
        <label for="" class="col-md-4 col-lg-4 col-sm-12">
          VK brutto:
          <input type="text" required="" name="FORM[p_vkbr]" value="<%$KSHOP.product.p_vkbr|number_format:2:",":"."%>" class="form-control">
        </label>

        <label for="" class="col-md-4 col-lg-4 col-sm-12">
          Steuersatz:
          <select name="FORM[p_tax]" id="" class="form-control">
            <option <% if ($KSHOP.product.p_tax==19) %>selected<%/if%> value="19">19%</option>
            <option <% if ($KSHOP.product.p_tax==7) %>selected<%/if%> value="7">7%</option>
          </select>
        </label>
        <label for="" class="col-md-4 col-lg-4 col-sm-12">
          Gewicht in KG:
          <input type="text" required="" name="FORM[p_weight]" value="<%$KSHOP.product.p_weight|number_format:3:",":"."%>" class="form-control" placeholder="0,5">
        </label>
      </div>
<div class="row">
      <div class="col-sm-12 col-md-12 col-lg-8">
        <label for="about" class="form-label">
          Produkt Beschreibung
          <textarea name="FORM[p_content]" class="form-control" required="" id="js-cke-about" cols="30" rows="10"><%$KSHOP.product.p_content|hsc%></textarea>
        </label>
      </div>
      </div>
      <button type="submit" class="btn btn-primary mt-2"><i class="icofont-save"></i> speichern</button>
    </form>

    <div class="col-sm-12">
      <hr>
    </div>
    <div class="row">
      <div class="col-md-6 col-lg-6 col-sm-12">
        <h5>Galerie</h5>
        <div class="alert alert-info">Erlaubt ist JPG und PNG Format. Pro Upload max. 10 Dateien. Bitte Querformat! Vielen Dank!</div>
        <% include file="kshop_kshop-dropzone.tpl" page=$page ident="dropzone" maxFiles="10" acceptedFiles=".jpg,.jpeg,.png" cmd="add_product_img&pid=<%$KSHOP.product.pid%>" reloadFunction="kshop.reload_pro_imgs(<%$KSHOP.product.pid%>)"%>
      </div>

      <div class="col-md-6 col-lg-6" id="js-pro-imgs"><% include file="kshop_kshop-pro-images.tpl" %></div>
    </div>
    <%/if%>
  </div>
</section>