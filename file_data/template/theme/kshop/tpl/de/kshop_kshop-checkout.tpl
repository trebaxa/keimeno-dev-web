<section class="light mt-6 pb-10">
  <div class="container">
    <div class="row">
      <h2>Checkout</h2>
    </div>
    <form method="POST" action="<%$eurl%>" class="">
      <input type="hidden" name="cmd" value="ksorder">
      <input type="hidden" name="page" value="<%$page%>">
      <input type="hidden" name="hash" value="<%$KSHOP.hash%>">
      <input type="hidden" name="FORM[o_kid]" value="<%$GET.kid%>">

      <% foreach from=$KSHOP.basket.baskets item=basket %>
      <!-- SELLER -->
      <div class="row mt-4">
        <div class="col-md-6 col-lg-6 col-sm-12">
          <h3><%$basket.customer.firma%></h3>
        </div>
        <div class="col-md-6 col-lg-6 col-sm-12 text-right">
          <img src="<%$basket.customer.img_boxed%>" alt="basket" style="height:100px">
        </div>
        <div class="col">
          <label for="js-agb">
            <input type="checkbox" required="" name="agb" id="js-agb" value="1">
            Akzeptiere die <a title="AGB" href="#" onclick="$('#agb-text').slideToggle()">AGBs</a>
          </label>
          <div id="agb-text" style="display:none;height:100px; overflow-y: scroll;"><%$KSHOP.kconfig.agb%></div>
          <label for="js-wdr">
            <input type="checkbox" required="" name="wdr" id="js-wdr" value="1">
            Akzeptiere Widerruf <a title="Widerruf" href="#" onclick="$('#wdr-text').slideToggle()">nach lesen</a>
          </label>
          <div id="wdr-text" style="display:none;height:100px; overflow-y: scroll;"><%$KSHOP.kconfig.widerruf%></div>
        </div>
      </div>

      <!-- PAYMENT -->
      <div class="row mt-4">
        <div class="col-12">
          <label for="zahlungsweise">Zahlungsmethode
            <select name="FORM[o_payment]" id="zahlungsweise" class="form-control">
              <% if ($KSHOP.customer.ml_paypal_mail!="") %>
              <option value="paypal">PayPal</option>
              <%/if%>
              <% if ($KSHOP.customer.ml_su_apikey!="") %>
              <option value="sofort">SOFORT Überweisung</option>
              <%/if%>
              <% if ($KSHOP.customer.ml_payd_apikey!="" && $KSHOP.customer.ml_payd_apisecret!="") %>
              <option value="paydirekt">giroPay</option>
              <%/if%>
            </select>
          </label>
        </div>
      </div>

      <!-- CUSTOMER -->
      <div class="row mt-4">
        <div class="col-md-6 col-lg-6 col-sm-12">
          <div class="row mt-4">
            <div class="col-12">
              <h4>Ihre Rechnungsadresse</h4>
            </div>
            <div class="col-md-6 col-lg-6 col-sm-12">
              <label for="">Vorname
                <input required="" type="text" name="FORM[o_firstname]" value="<%$KSHOP.invaddress.o_firstname|sthsc%>" class="form-control">
              </label>
            </div>
            <div class="col-md-6 col-lg-6 col-sm-12">
              <label for="">Nachname
                <input required="" type="text" name="FORM[o_lastname]" value="<%$KSHOP.invaddress.o_lastname|sthsc%>" class="form-control">
              </label>
            </div>
            <div class="col-10">
              <label for="">Strasse
                <input type="text" name="FORM[o_street]" value="<%$KSHOP.invaddress.o_street|sthsc%>" class="form-control">
              </label>
            </div>
            <div class="col-2">
              <label for="">HausNr
                <input type="text" name="FORM[o_hnr]" value="<%$KSHOP.invaddress.o_hnr|sthsc%>" class="form-control">
              </label>
            </div>
            <div class="col-4">
              <label for="">PLZ
                <input type="text" name="FORM[o_zip]" value="<%$KSHOP.invaddress.o_zip|sthsc%>" class="form-control">
              </label>
            </div>
            <div class="col-8">
              <label for="">Ort
                <input type="text" name="FORM[o_city]" value="<%$KSHOP.invaddress.o_city|sthsc%>" class="form-control">
              </label>
            </div>
            <div class="col">
              <label for="">Ihre E-Mail
                <input type="email" name="FORM[o_email]" required="" value="<%$KSHOP.invaddress.o_email|sthsc%>" class="form-control">
              </label>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-6 col-sm-12">
          <div class="row mt-4">
            <!-- LIEFERADRESSE -->
          </div>
        </div>
      </div>
      <table class="table">
        <thead>
          <tr>
            <th>Produkt</th>
            <th>Untertitel</th>
            <th>Menge</th>
            <th class="text-right">Preis (br)</th>
            <th class="text-right">Gesamt</th>
          </tr>
        </thead>
        <tbody>
          <% foreach from=$basket.items item=row %>
          <tr>
            <td><%$row.p_name%></td>
            <td><%$row.p_subtitle%></td>
            <td><%$row.b_qty%></td>
            <td class="text-right"><%$row.p_vkbr|number_format:2:",":"."%> €</td>
            <td class="text-right"><%$row.p_total_vkbr|number_format:2:",":"."%> €</td>
          </tr>
          <%/foreach%>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="4">Zwischensumme:</td>
            <td class="text-right"><%$basket.total_br|number_format:2:",":"."%> €</td>
          </tr>
          <tr>
            <td colspan="4">Versand:</td>
            <td class="text-right"><%$basket.delivery.d_pricebr|number_format:2:",":"."%> €</td>
          </tr>
          <tr>
            <td colspan="4">Summe:</td>
            <td class="text-right"><strong><%$basket.total_sum_br|number_format:2:",":"."%> €</strong></td>
          </tr>
        </tfoot>
      </table>
      <div class="row mt-4">
        <div class="col-sm-12 col-md-4 offset-md-4 mt-3">
          <button type="submit" class="btn btn-primary btn-block">kostenpflichtig bestellen</button>
        </div>
      </div>
      <%/foreach%>
    </form>
  </div>
</section>