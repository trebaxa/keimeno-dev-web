<section class="py-8" id="js-mav-thx" style="display:none" role="region" aria-hidden="true">
  <div class="container">
    <p>
      <%$plugopt.thanks|nl2br%>
    </p>
  </div>
</section>

<section class="py-8" id="mavreg" role="main">
  <div class="container">
    <div class="row">
      <div class="col-12 col-lg-10 mx-auto">  
        <h3 tabindex="0">Online Anmeldung</h3>
        <h4><%$plugopt.event.e_name%></h4>
        <p>
          <%$plugopt.text|nl2br%>
        </p>
        <p>Es sind noch <b><%$MAVREG.event.free%></b> Plätze frei.</p>
        <form action="<%$PHPSELF%>" method="POST" class="jsonform form js-mav-con" role="form">
          <input type="hidden" name="cmd" value="add_user">
          <input type="hidden" name="page" value="<%$page%>">
          <input type="hidden" name="csrftoken" value="<%$plugopt.csrftoken%>">
          <input type="hidden" name="cont_matrix_id" value="<%$plugopt.cont_matrix_id%>">
          <div class="row align-items-center">
            <div class="col-12 col-lg-10">
              <div class="form-group">
                <label for="name">Dein Name</label>
                <input type="text" class="form-control" id="name" name="FORM[u_nachname]" placeholder="Name eingeben" value="" aria-required="true" />
              </div>
              <div class="form-group">
                <label for="personen">Anzahl Personen</label>
                <select id="personen" class="custom-select" name="FORM[u_count]" aria-label="Anzahl Personen auswählen">
                  <option>1 Person</option>
                  <option>2 Personen</option>
                  <option>3 Personen</option>
                </select>
              </div>
              <div class="form-group">
                <label for="email">E-Mail</label>
                <input type="email" class="form-control" id="email" name="FORM[u_email]" placeholder="E-Mail Adresse eingeben" aria-required="true" />
              </div>
            </div>
            <div class="col-12 col-lg-2">
              <button type="submit" class="btn btn-primary text-uppercase" aria-label="Formular senden">Senden</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>