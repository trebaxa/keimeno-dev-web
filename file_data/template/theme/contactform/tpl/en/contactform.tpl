<section class="section-space contact-section" id="contact" role="region" aria-labelledby="contact-heading">
  <div class="container">
    <div class="row mb-4">
      <div class="col-lg-9">
        <h2 class="section-title" id="contact-heading"><%$contact.cf_title%></h2>
        <div class="lead mt-3 text-secondary mb-0"><%$contact.cf_lead%></div>
      </div>
    </div>

    <div class="fmrcontactthx contact-card p-4 mb-4" style="display:none" aria-hidden="true">
      <h2 class="h4"><%$contact.cf_thanks_title%></h2>
      <p class="mb-0"><%$contact.cf_thanks%></p>
    </div>

    <noscript>
      <div class="alert alert-danger" role="alert">
        Enable JavaScript to use the contact form.
      </div>
    </noscript>

    <div class="row g-4 align-items-start">
      <div class="col-12 col-lg-8">
        <form action="<%$THISURL%>" method="post" enctype="multipart/form-data" id="js-contact-<%$cont_matrix_id%>" data-event="contactform" class="fmrcontactform jsonform contact-card contact-form p-4 p-lg-5" role="form">
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
                <label for="contact-elist-<%$cont_matrix_id%>">Recipient*</label>
                <select class="form-control" name="FORM[elist]" id="contact-elist-<%$cont_matrix_id%>" aria-required="true">
                  <%foreach from=$contact.elist key=key item=row %>
                  <option value="<%$key%>"><%$row.label%></option>
                  <%/foreach%>
                </select>
              </div>
              <%/if%>
              <div class="form-group">
                <label for="contact-first-name-<%$cont_matrix_id%>">{LBL_VORNAME}*</label>
                <input type="text" required <% if ($CU_LOGGEDIN==true) %>disabled<%/if%> class="form-control<% if ($kregform_err.vorname!='') %> has-error<% /if %>" id="contact-first-name-<%$cont_matrix_id%>" placeholder="{LBL_VORNAME}" name="FORM_NOTEMPTY[vorname]" value="<% if ($CU_LOGGEDIN==true) %><%$customer.vorname%><%else%><% $CONTACTF.values.vorname|sthsc %><%/if%>" aria-required="true">
                <input type="hidden" name="FORM_LABEL[vorname]" value="Vorname">
              </div>
              <div class="form-group">
                <label for="contact-last-name-<%$cont_matrix_id%>">{LBL_NACHNAME}*</label>
                <input type="text" <% if ($CU_LOGGEDIN==true) %>disabled<%/if%> class="form-control<% if ($kregform_err.nachname!='') %> has-error<% /if %>" id="contact-last-name-<%$cont_matrix_id%>" placeholder="{LBL_NACHNAME}" required name="FORM_NOTEMPTY[nachname]" value="<% if ($CU_LOGGEDIN==true) %><%$customer.nachname%><%else%><% $CONTACTF.values.nachname|sthsc %><%/if%>" aria-required="true">
                <input type="hidden" name="FORM_LABEL[nachname]" value="Nachname">
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="form-group">
                <label for="contact-email-<%$cont_matrix_id%>">Email*</label>
                <input data-event="check-email" type="email" class="required form-control<% if ($kregform_err.tschapura!='') %> has-error<% /if %>" id="contact-email-<%$cont_matrix_id%>" placeholder="Email" required name="FORM[tschapura]" value="<% if ($CU_LOGGEDIN==true) %><%$customer.email%><%else%><% $CONTACTF.values.tschapura|sthsc %><%/if%>" aria-required="true">
                <input type="hidden" name="FORM_LABEL[email]" value="Email">
              </div>
              <div class="form-group">
                <label for="contact-phone-<%$cont_matrix_id%>">Callback number*</label>
                <input type="text" class="form-control<% if ($kregform_err.tel!='') %> has-error<% /if %>" id="contact-phone-<%$cont_matrix_id%>" placeholder="Your callback number" required name="FORM[tel]" value="<% $CONTACTF.values.tel|sthsc %>" aria-required="true">
                <input type="hidden" name="FORM_LABEL[tel]" value="R&uuml;ckrufnummer">
              </div>
            </div>
          </div>

          <%if ($contact.cf_fileuploads>0)%>
          <div class="contact-upload-group my-4" aria-labelledby="contact-upload-heading-<%$cont_matrix_id%>">
            <h3 class="h5 mb-2" id="contact-upload-heading-<%$cont_matrix_id%>">Attach files</h3>
            <p class="small text-secondary mb-3">Add relevant documents or images to your request.</p>
            <%for $i = 1 to $contact.cf_fileuploads%>
            <div class="upload-field mb-3">
              <label class="form-label" for="contact-file-<%$cont_matrix_id%>-<%$i%>">
                <i class="fa-solid fa-paperclip me-2" aria-hidden="true"></i>Select file
              </label>
              <input type="file" class="form-control js-file-input" id="contact-file-<%$cont_matrix_id%>-<%$i%>" name="datei[]" multiple aria-describedby="contact-file-help-<%$cont_matrix_id%>-<%$i%>">
              <div class="form-text" id="contact-file-help-<%$cont_matrix_id%>-<%$i%>">Multiple files can be selected.</div>
              <div class="selected-file-list small text-secondary mt-2" aria-live="polite"></div>
            </div>
            <%/for%>
          </div>
          <%/if%>

          <% if ($contact.cf_captcha>=1) %>
            <% if ($contact.cf_captcha==1) %>
            <fieldset class="form-group" aria-describedby="contact-secode-help-<%$cont_matrix_id%>">
              <legend class="h6 mb-2">{LBL_SECODE} <span aria-hidden="true">*</span></legend>
              <% if ($contact.captcha_type=='math' && $contact.captcha_question!='') %>
              <p class="mb-2" id="contact-secode-question-<%$cont_matrix_id%>">
                Task: <strong><%$contact.captcha_question|hsc%></strong>
              </p>
              <p class="text-secondary small mb-2" id="contact-secode-help-<%$cont_matrix_id%>">
                Solve the task and enter only the result.
              </p>
              <%else%>
              <div class="mb-2">
                <img title="{LBL_SECODE}" alt="Security code image" src="<%$contact.captcha%>" style="height: 2.3rem;" loading="lazy">
              </div>
              <p class="text-secondary small mb-2" id="contact-secode-help-<%$cont_matrix_id%>">
                Enter the security code shown in the image.
              </p>
              <%/if%>
              <label for="contact-secode-<%$cont_matrix_id%>" class="form-label">{LBL_CODEENTER}</label>
              <input
                placeholder="{LBL_CODEENTER}"
                id="contact-secode-<%$cont_matrix_id%>"
                autocomplete="off"
                required
                name="securecode"
                class="form-control"
                type="text"
                <% if ($contact.captcha_type=='math' && $contact.captcha_question!='') %>inputmode="numeric" pattern="[0-9]*" aria-describedby="contact-secode-help-<%$cont_matrix_id%> contact-secode-question-<%$cont_matrix_id%>"<%else%>aria-describedby="contact-secode-help-<%$cont_matrix_id%>"<%/if%>
                aria-required="true">
            </fieldset>
            <%else%>
            <div class="form-group">
              <p class="text-secondary small" id="recaptcha-help-<%$cont_matrix_id%>">
                Complete the security check.
              </p>
              <div id="js-recaptcha-<%$cont_matrix_id%>" aria-required="true" role="group" aria-label="{LBL_SECODE}" aria-describedby="recaptcha-help-<%$cont_matrix_id%>"></div>
            </div>
            <%/if%>
          <%/if %>

          <div class="form-group">
            <label for="contact-message-<%$cont_matrix_id%>">Nachricht*</label>
            <textarea class="form-control<% if ($kregform_err.tel!='') %> has-error<% /if %>" id="contact-message-<%$cont_matrix_id%>" placeholder="Ihre Nachricht" required rows="6" name="FORM_NOTEMPTY[nachricht]" aria-required="true"><% $CONTACTF.values.nachricht|sthsc %></textarea>
            <input type="hidden" name="FORM_LABEL[nachricht]" value="Nachricht">
          </div>

          <div class="form-check mb-3">
            <input type="checkbox" name="disclaimer_check-1" class="form-check-input js-disclaimer-check" value="1" required id="contact-disclaimer-1-<%$cont_matrix_id%>" aria-required="true">
            <label class="form-check-label" for="contact-disclaimer-1-<%$cont_matrix_id%>">
              Ich bin mit der Verarbeitung meiner angegebenen Daten zum Zwecke der Bearbeitung meiner Anfrage einverstanden.
            </label>
          </div>
          <div class="form-check mb-3">
            <input type="checkbox" name="disclaimer_check-2" value="1" class="form-check-input js-disclaimer-check" required id="contact-disclaimer-2-<%$cont_matrix_id%>" aria-required="true">
            <label class="form-check-label" for="contact-disclaimer-2-<%$cont_matrix_id%>">
              Ich habe die <a href="#" title="Datenschutzerkl&auml;rung">Datenschutzerkl&auml;rung</a> von <% $gbl_config.adr_general_firmname %> zur Kenntnis genommen.
            </label>
          </div>
          <div class="form-check mb-4">
            <input type="checkbox" name="disclaimer_check-3" value="1" class="form-check-input js-disclaimer-check" required id="contact-disclaimer-3-<%$cont_matrix_id%>" aria-required="true">
            <label class="form-check-label" for="contact-disclaimer-3-<%$cont_matrix_id%>">
              Ich bin dar&uuml;ber belehrt worden, dass ich meine vorstehende Einwilligung in die Verarbeitung meiner Daten jederzeit unter dem unten angegebenen Link auf der Kontaktseite dieser Homepage, durch Klick auf den entsprechenden Link in der Best&auml;tigungsmail zu meiner Anfrage, durch gesonderte E-Mail (<% $gbl_config.adr_service_email %>), Telefax (<% $gbl_config.adr_fax %>) oder Brief an die <% $gbl_config.adr_firma %>, <% $gbl_config.adr_street %>, <% $gbl_config.adr_plz %> <% $gbl_config.adr_town %> widerrufen kann.
            </label>
          </div>

          <% if ($contact.cf_captcha==3) %>
          <button class="g-recaptcha btn btn-primary mt-3" id="js-btn-send" disabled data-action="sendmsg" aria-disabled="true">senden</button>
          <%else%>
          <input type="submit" class="btn btn-primary mt-3" value="senden" id="js-btn-send" disabled aria-disabled="true">
          <%/if%>
        </form>
      </div>

      <div class="col-12 col-lg-4">
        <aside class="contact-card contact-aside p-4" aria-label="Contact information">
          <h3>Office hours</h3>
          <p>Monday to Friday 09:00 - 18:00.</p>
          <h3>Address</h3>
          <p>
            <% $gbl_config.adr_firma %><br>
            <% $gbl_config.adr_street %><br>
            <% $gbl_config.adr_plz %> <% $gbl_config.adr_town %>
          </p>
          <h3>Contact</h3>
          <p>
            Phone:
            <a href="tel:<% $gbl_config.adr_telefon %>" title="Phone number <% $gbl_config.adr_telefon %>"><% $gbl_config.adr_telefon %></a><br>
            Fax: <% $gbl_config.adr_fax %><br>
            Email:
            <a title="Contact" href="mailto:<% $gbl_config.adr_service_email %>"><% $gbl_config.adr_service_email %></a>
          </p>
        </aside>
      </div>
    </div>
  </div>
</section>
