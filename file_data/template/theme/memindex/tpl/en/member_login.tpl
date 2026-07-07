<% if ($cmd=='show_setnewpass') %>
  <section class="container" role="main" aria-labelledby="h-setpass">
    <h3 id="h-setpass">Passwort neu setzen</h3>
    <form role="form" method="POST" action="<% $HTA_CMSSSLLINKS_CMS.EC_URL %>" aria-labelledby="h-setpass" autocomplete="new-password">

      <input type="hidden" name="page" value="<%$page%>">
      <input name="cmd" type="hidden" value="set_password">
      <input type="hidden" name="csrftoken" value="<%$plginopt.csrftoken%>">

      <div class="form-group" role="group" aria-labelledby="lbl-pass1">
        <label id="lbl-pass1" class="text-right middle" for="pass1"><i class="fa fa-lock" aria-hidden="true"></i> Neues Passwort</label>
        <input type="password" required aria-required="true" id="pass1" name="pass" placeholder="Neues Passwort" autocomplete="new-password">
      </div>
      <div class="form-group" role="group" aria-labelledby="lbl-pass2">
        <label id="lbl-pass2" class="text-right middle" for="pass2"><i class="fa fa-lock" aria-hidden="true"></i> Passwort wiederholen</label>
        <input type="password" required aria-required="true" id="pass2" name="passwdh" placeholder="Passwort wiederholen" autocomplete="new-password">
      </div>

      <button type="submit" class="btn btn-primary" title="Neues Passwort speichern" aria-label="Neues Passwort speichern"><i class="fa fa-save" aria-hidden="true"></i>&nbsp; neu speichern</button>

    </form>
  </section>
  <%elseif ($cmd=='show_setpok') %>
  <section class="section okbox mt-lg" role="region" aria-labelledby="h-pass-ok">
    <div class="container">
      <h3 id="h-pass-ok" class="sr-only" style="position:absolute;left:-9999px;top:auto;width:1px;height:1px;overflow:hidden;">Passwort geändert</h3>
      <div class="alert alert-success" role="alert" aria-live="assertive" data-event="remove_onload" data-seconds="3" tabindex="-1" title="Erfolgsmeldung: Passwort wurde neugesetzt">
        Passwort wurde neugesetzt
      </div>
    </div>
  </section>
  <%else%>
  <section class="container" role="main" aria-labelledby="h-login h-forgot">
    <div class="row">
      <div class="col-md-6">
        <h3 id="h-login">{LBL_LOGIN}</h3>
        <form method="POST" action="<% $PHPSELF %>" role="form" aria-labelledby="h-login" autocomplete="on">
          <input type="hidden" name="page" value="<% $page %>">
          <input name="cmd" type="hidden" value="login">
          <input type="hidden" name="csrftoken" value="<%$login.csrftoken%>">

          <div class="form-group" role="group" aria-labelledby="lbl-login-email">
            <label id="lbl-login-email" for="login-email">{LBL_IHREEMAIL}:</label>
            <input id="login-email" type="email" class="form-control" name="email" inputmode="email" autocomplete="email">
          </div>
          <div class="form-group" role="group" aria-labelledby="lbl-login-pass">
            <label id="lbl-login-pass" for="login-pass">{LBL_PASSWORT}:</label>
            <input id="login-pass" type="password" name="pass" class="form-control" autocomplete="current-password">
            <div class="form-check">
              <input id="stayloggedin" type="checkbox" value="1" name="stayloggedin" class="form-check-input">
              <label for="stayloggedin" class="form-check-label">angemeldet bleiben</label>
            </div>
          </div>
          <button type="submit" class="btn btn-secondary" title="{LBL_LOGIN}" aria-label="{LBL_LOGIN}">{LBL_LOGIN}</button>

        </form><br>
        <h3 id="h-register">{LBL_NEUKUNDE}</h3>
        <a href="/register.html" class="btn btn-secondary" role="button" title="{LBL_REGISTER}" aria-label="{LBL_REGISTER}">{LBL_REGISTER}</a>
      </div>

      <div class="col-md-6">
        <h3 id="h-forgot">{LBL_PASSWORTVERG}</h3>
        <form action="<% $HTA_CMSSSLLINKS_CMS.EC_URL %>?" method="post" role="form" aria-labelledby="h-forgot" autocomplete="on">
          <input type="hidden" name="page" value="<% $page %>">
          <input name="cmd" type="hidden" value="send_pass_link">
          <input type="hidden" name="csrftoken" value="<%$plginopt.csrftoken%>">{LBL_PASSINFO}<br>
          
          <div class="form-group" role="group" aria-labelledby="lbl-forgot-email">
            <label id="lbl-forgot-email" for="forgot-email">{LBL_IHREEMAIL}:</label>
            <input id="forgot-email" type="email" required class="form-control" value="@" name="FORM[tschapura]" inputmode="email" autocomplete="email" <% if ($loginform_err.email!='') %> aria-invalid="true" aria-describedby="err-forgot-email" <% /if %> >
            <% if ($loginform_err.email!='') %>
            <span id="err-forgot-email" class="important" role="alert"><% $loginform_err.email%></span>
            <% /if %>
          </div>
          <button type="submit" class="btn btn-secondary" title="{LBL_ANFORDERN}" aria-label="{LBL_ANFORDERN}">{LBL_ANFORDERN}</button>
        </form>
      </div>
    </div>
  </section>
  <%/if%>