<section class="py-5" id="contact" role="region" aria-labelledby="contact-heading">
  <div class="container">
    <h2 id="contact-heading"><%$contact.cf_title%></h2>
    <p class="lead"><%$contact.cf_lead%></p>
    <div class="fmrcontactthx" style="display:none" aria-hidden="true">
      <h2><%$contact.cf_thanks_title%></h2>
      <p><%$contact.cf_thanks%></p>
    </div>
    <noscript>
      <div class="row">
        <div class="col-12">
          <div class="alert alert-danger" role="alert">
            Aktivieren Sie JavaScript, um das Kontaktformular zu nutzen!
          </div>
        </div>
      </div>
    </noscript>
    <div class="row">
      <div class="col-12 col-lg-8">
        <form action="<%$THISURL%>" method="post" enctype="multipart/form-data" id="js-contact-<%$cont_matrix_id%>" data-event="contactform" class="fmrcontactform jsonform" role="form">
          <input type="hidden" name="page" value="<% $page %>">
          <input name="cmd" type="hidden" value="sendmsg">
          <input type="hidden" name="csrftoken" value="<%$contact.token%>">
          <input type="hidden" name="ajaxsubmit" value="1">
          <input type="hidden" name="cont_matrix_id" value="<%$cont_matrix_id%>">
          <input type="hidden" value="" name="email" class="hidden" aria-hidden="true" tabindex="-1">
          <div class="row">
            <div class="col-12 col-md-6">
              <% if ( isset($contact.elist) && is_array($contact.elist) && count($contact.elist)>0 ) %>
              <div class="form-group">
                <label for="elist">Empf&auml;nger*</label>
                <select class="form-control" name="FORM[elist]" id="elist" aria-required="true">
                  <%foreach from=$contact.elist key=key item=row %>
                  <option value="<%$key%>"><%$row.label%></option>
                  <%/foreach%>
                </select>
              </div>
              <%/if%>
              <div class="form-group">
                <label for="vorname">{LBL_VORNAME}*</label>
                <input type="text" required <% if ($CU_LOGGEDIN==true) %>disabled<%/if%> class="form-control<% if ($kregform_err.vorname!='') %> has-error<% /if %>" id="vorname" placeholder="{LBL_VORNAME}" name="FORM_NOTEMPTY[vorname]" value="<% if ($CU_LOGGEDIN==true) %><%$customer.vorname%><%else%><% $CONTACTF.values.vorname|sthsc %><%/if%>" aria-required="true">
                <input type="hidden" name="FORM_LABEL[vorname]" value="Vorname">
              </div>
              <div class="form-group">
                <label for="nachname">{LBL_NACHNAME}*</label>
                <input type="text" <% if ($CU_LOGGEDIN==true) %>disabled<%/if%> class="form-control<% if ($kregform_err.nachname!='') %> has-error<% /if %>" id="nachname" placeholder="{LBL_NACHNAME}" required name="FORM_NOTEMPTY[nachname]" value="<% if ($CU_LOGGEDIN==true) %><%$customer.nachname%><%else%><% $CONTACTF.values.nachname|sthsc %><%/if%>" aria-required="true">
                <input type="hidden" name="FORM_LABEL[vorname]" value="Vorname">
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="form-group">
                <label for="tschapura">Email*</label>
                <input data-event="check-email" type="email" class="required form-control<% if ($kregform_err.tschapura!='') %> has-error<% /if %>" id="tschapura" placeholder="Email" required name="FORM[tschapura]" value="<% if ($CU_LOGGEDIN==true) %><%$customer.email%><%else%><% $CONTACTF.values.tschapura|sthsc %><%/if%>" aria-required="true">
                <input type="hidden" name="FORM_LABEL[email]" value="Email">
              </div>
              <div class="form-group">
                <label for="tel">R&uuml;ckrufnummer*</label>
                <input type="text" class="form-control<% if ($kregform_err.tel!='') %> has-error<% /if %>" id="tel" placeholder="Ihre R&uuml;ckrufnummer" required name="FORM[tel]" value="<% $CONTACTF.values.tel|sthsc %>" aria-required="true">
                <input type="hidden" name="FORM_LABEL[tel]" value="R&uuml;ckrufnummer">
              </div>
            </div>
          </div><!-- row -->
          <%for $i = 1 to $contact.cf_fileuploads%>
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile-<%$i%>" name="datei[]" multiple>
                    <label class="custom-file-label" for="customFile-<%$i%>"><span class="label">Datei hinzuf&uuml;gen</span><span class="custom-file-output"></span></label>
                  </div>
                </div>
              </div>
            </div>
          <%/for%>
          <div class="row">
            <div class="col-12">
              <% if ($contact.cf_captcha>=1) %>
                <% if ($contact.cf_captcha==1) %>
                <fieldset class="form-group" aria-describedby="secode-help-<%$cont_matrix_id%>">
                  <legend class="h6 mb-2">{LBL_SECODE} <span aria-hidden="true">*</span></legend>
                    <% if ($contact.captcha_type=='math' && $contact.captcha_question!='') %>
                    <p class="mb-2" id="secode-question-<%$cont_matrix_id%>">
                      Task: <strong><%$contact.captcha_question|hsc%></strong>
                    </p>
                    <p class="text-muted small mb-2" id="secode-help-<%$cont_matrix_id%>">
                      Solve the task and enter only the result.
                    </p>
                    <%else%>
                    <div class="mb-2">
                      <img
                        title="{LBL_SECODE}"
                        alt="Security code image"
                        src="<%$contact.captcha%>"
                        style="height: 2.3rem;" loading="lazy">
                    </div>
                    <p class="text-muted small mb-2" id="secode-help-<%$cont_matrix_id%>">
                      Enter the security code shown in the image.
                    </p>
                    <%/if%>
                    <label for="secode-<%$cont_matrix_id%>" class="form-label">{LBL_CODEENTER}</label>
                    <input
                      placeholder="{LBL_CODEENTER}"
                      id="secode-<%$cont_matrix_id%>"
                      autocomplete="off"
                      required
                      name="securecode"
                      class="form-control"
                      type="text"
                      <% if ($contact.captcha_type=='math' && $contact.captcha_question!='') %>inputmode="numeric" pattern="[0-9]*" aria-describedby="secode-help-<%$cont_matrix_id%> secode-question-<%$cont_matrix_id%>"<%else%>aria-describedby="secode-help-<%$cont_matrix_id%>"<%/if%>
                      aria-required="true">
                </fieldset>
                    <%else%>
                <div class="form-group">
                  <p class="text-muted small" id="recaptcha-help-<%$cont_matrix_id%>">
                    Complete the security check.
                  </p>
                  <div id="js-recaptcha-<%$cont_matrix_id%>" aria-required="true" role="group" aria-label="{LBL_SECODE}" aria-describedby="recaptcha-help-<%$cont_matrix_id%>"></div>
                </div>
                <%/if%>
              <%/if %>
            </div>
            <div class="col-12">
              <div class="form-group">
                <label for="fmr-fed-nachricht">Nachricht*</label>
                <textarea class="form-control<% if ($kregform_err.tel!='') %> has-error<% /if %>" id="fmr-fed-nachricht" placeholder="Ihre Nachricht" required rows="6" name="FORM_NOTEMPTY[nachricht]" aria-required="true"><% $CONTACTF.values.nachricht|sthsc %></textarea>
                <input type="hidden" name="FORM_LABEL[nachricht]" value="Nachricht">
              </div>
              <div class="checkbox">
                <label for="bt-disclaimer-1">
                  <input type="checkbox" name="disclaimer_check-1" class="js-disclaimer-check" value="1" required="" id="bt-disclaimer-1" onclick="if ($('.js-disclaimer-check:checked').length==3){$('#js-btn-send').prop('disabled',false)}else{$('#js-btn-send').prop('disabled',true)}" aria-required="true">
                  Ich bin mit der Verarbeitung meiner angegebenen Daten zum Zwecke der Bearbeitung meiner Anfrage einverstanden.
                </label>
              </div>
              <div class="checkbox">
                <label for="bt-disclaimer-2">
                  <input type="checkbox" name="disclaimer_check-2" value="1" class="js-disclaimer-check" required="" id="bt-disclaimer-2" onclick="if ($('.js-disclaimer-check:checked').length==3){$('#js-btn-send').prop('disabled',false)}else{$('#js-btn-send').prop('disabled',true)}" aria-required="true">
                  Ich habe die 
                  <a 
                    href="#" 
                    title="Datenschutzerkl&auml;rung">
                    Datenschutzerkl&auml;rung
                  </a> 
                  von <% $gbl_config.adr_general_firmname %> zur Kenntnis genommen.
                </label>
              </div>
              <div class="checkbox">
                <label for="bt-disclaimer-3">
                  <input type="checkbox" name="disclaimer_check-3" value="1" class="js-disclaimer-check" required="" id="bt-disclaimer-3" onclick="if ($('.js-disclaimer-check:checked').length==3){$('#js-btn-send').prop('disabled',false)}else{$('#js-btn-send').prop('disabled',true)}" aria-required="true">
                  Ich bin dar&uuml;ber belehrt worden, dass ich meine vorstehende Einwilligung in die Verarbeitung meiner Daten jederzeit unter dem unten angegebenen Link auf der
                  Kontaktseite dieser Homepage, durch Klick auf den entsprechenden Link in der Best&auml;tigungsmail zu meiner Anfrage, durch gesonderte E-Mail (<% $gbl_config.adr_service_email %>), Telefax (<% $gbl_config.adr_fax %>)
                  oder Brief an die <% $gbl_config.adr_firma %>, <% $gbl_config.adr_street %>, <% $gbl_config.adr_plz %> <% $gbl_config.adr_town %> widerrufen kann.
                </label>
              </div>
              <% if ($contact.cf_captcha==3) %>
              <button class="g-recaptcha btn btn-primary mt-lg" id="js-btn-send" disabled="" data-action='sendmsg' aria-disabled="true">senden</button>
              <%else%>
              <input type="submit" class="btn btn-primary mt-lg" value="senden" id="js-btn-send" disabled="" aria-disabled="true">
              <%/if%>
            </div>
          </div>
        </form>
      </div>
      <!--col-->
      <div class="col-12 col-lg-4 border-left">
        <h3>B&uuml;rozeiten</h3>
        <p>
        Montags bis Freitags 09:00 - 18:00 Uhr.
        </p>
        <h3>Anschrift</h3>
        <p>
        <% $gbl_config.adr_firma %><br>
        <% $gbl_config.adr_street %><br>
        <% $gbl_config.adr_plz %> <% $gbl_config.adr_town %><br>
        </p>
        <h3>Kontakt</h3>
        <p>
        Telefon: 
        <a 
          href="tel:<% $gbl_config.adr_telefon  %>"
          title="Telefonnummer <% $gbl_config.adr_telefon  %>">
          <% $gbl_config.adr_telefon  %>
        </a><br>
        Fax: <% $gbl_config.adr_fax  %><br>
        Email: 
        <a 
          title="Kontakt" 
          href="mailto:<% $gbl_config.adr_service_email %>">
          <% $gbl_config.adr_service_email %>
        </a><br>
        </p>
      </div>
    </div>
    <!--row-->
  </div>
</section>
