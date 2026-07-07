<section class="py-6">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <%*$GOLDANKAUF.price_result.prices|echoarr*%>
          <%foreach from=$GOLDANKAUF.price_result.prices item=row %>
          <%*$row|echoarr*%>
          <% $mkey = $row.metal %>
          <h3><%$GOLDANKAUF.metals.$mkey.label%></h3>
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th></th>
                <th class="text-right">Price /g</th>
              </tr>
            </thead>
            <tbody>
              <%foreach from=$GOLDANKAUF.metals.$mkey.values key=makey item=metalvalue %>
              <tr>
                <td><%$metalvalue.label%></td>
                <%assign var="procent_key" value=$makey|cat:'_calc'%>
                <td class="text-right"><%$row.$procent_key|number_format:2:",":""%> <%$GOLDANKAUF.currency%></td>
              </tr>
              <%/foreach%>
            </tbody>
          </table>
          <%/foreach%>
        </div>
        <div class="col-md-6">
          <div id="gold-calculator">
            <div class="row">
              <div class="col-md-12">
                <h3>Gold Rechner</h3>
              </div>
            </div>
            <form class="form-inlidne">
              <input type="hidden" name="page" value="<%$page%>">
              <input type="hidden" name="cmd" value="get_price">
              <div class="row">

                <div class="form-group col-12 col-md-4">
                  <label for="gram">Gramm</label>
                  <input type="number" id="gram" required="" class="form-control" value="1" min="1" name="FORM[gram]">
                </div>


                <div class="form-group col-12 col-md-8">
                  <label for="gtype">Metal</label>
                  <div class="input-group">
                    <select name="FORM[type]" class="form-control" id="gtype">
                      <option value="">Bitte auswählen</option>
                      <%foreach from=$GOLDANKAUF.metals key=makey item=metal %>
                      <%foreach from=$metal.values item=val %>
                      <option value="<%$makey%>_<%$val.num%>"><%$val.label%></option>
                      <%/foreach%>
                      <%/foreach%>
                    </select>
                    <button type="button" class="btn btn-primary">berechnen</button>
                  </div>
                </div>

              </div>
            </form>
            <div class="text-center alert alert-info">
              <div id="js-gak-result"></div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </section>