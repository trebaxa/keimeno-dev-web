<section class="py-4" aria-labelledby="newsletter-heading">
  <div class="container">
    <h3 id="newsletter-heading">{LBL_NEWSLETTER}</h3>
    <p class="newsub-text">
      <%$newssub.infotext%>
    </p>
    <form action="<% $PHPSELF %>" method="post" aria-describedby="newsletter-heading">
      <% if ($newssub.connect=='KG') %>
      <div class="mb-3">
        <label for="newssub-n" class="form-label">Nachname</label>
        <input id="newssub-n" name="FORM[nachname]" type="text" class="form-control" value="<% $POST.FORM.nachname|hsc %>"
          autocomplete="family-name"
        >
      </div>
      <div class="mb-3">
        <label for="newssub-v" class="form-label">Vorname</label>
        <input id="newssub-v" name="FORM[vorname]" type="text" class="form-control" value="<% $POST.FORM.vorname|hsc %>"
          autocomplete="given-name"
        >
      </div>
      <%/if%>
      <div class="mb-3">
        <label for="newssub-e" class="form-label">E-Mail-Adresse</label>
        <input id="newssub-e" name="FORM[tschapura]" type="email" class="form-control" value="<% $POST.FORM.tschapura|hsc %>"
          autocomplete="email"
          required
          aria-required="true"
        >
      </div>
      <% if ($newssub.cf_captcha>=1) %>
          <% if ($newssub.cf_captcha==1) %>
              <div class="mb-3">
                  <label for="secode" class="form-label">
                    {LBL_SECODE}*
                  </label>
                  <img
                    src="<%$newssub.captcha%>"
                    title="{LBL_SECODE}"
                    alt="{LBL_SECODE}"
                    class="img-fluid mb-2"
                    loading="lazy"
                  >
                  <input placeholder="{LBL_CODEENTER}" id="secode" autocomplete="off" required name="securecode" class="form-control" type="text" aria-required="true" >
              </div>
          <%elseif ($newssub.cf_captcha>=2) %>
              <div class="mb-3">
                  <div id="js-recaptcha-<%$cont_matrix_id%>" aria-label="Spam-Schutz"></div>
              </div>
          <%/if%>
      <% /if %>
      <div class="form-check mb-3">
        <input id="dsgvo-1" type="checkbox" name="DSGVO[dsgvo-1]" class="form-check-input" required aria-required="true" >
        <label for="dsgvo-1" class="form-check-label">
          <%$newssub.dsgvolabel%>
        </label>
      </div>
      <button class="btn btn-primary" type="submit" aria-label="Newsletter-Anmeldung senden">
        senden
      </button>
      <input type="hidden" name="cmd" value="add_to_newsletter">
      <input type="hidden" name="page" value="<% $page %>">
      <input name="token" type="hidden" value="<% $cms_token %>">
      <input type="hidden" name="cont_matrix_id" value="<%$cont_matrix_id%>">
      <input type="hidden" value="" name="email" class="d-none" aria-hidden="true">
    </form>
  </div>
</section>