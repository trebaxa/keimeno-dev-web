<% if ($customer.kid > 0) %>
<section>
  <div class="container">
    <div class="row mb-6">
      <div class="col-12">
              <div class="btn-group">
        <a href="<%$eurl%>" class="btn btn-secondary">Mein Team</a>
        <a href="<%$eurl%>cmd=show_memteam_add" class="btn btn-primary"><i class="fa fa-plus"></i> Teammitglied hinzufügen</a></div>
        </div>
    </div>
  </div>
</section>
<% if ($cmd=='') %>
<section>
  <div class="container">
    <% if (count($MEMTEAMS.myteam)>0) %>
<table class="table">
  <thead>
    <tr>
      <th>Nachname</th>
      <th>Vorname</th>
      <th>Klasse</th>
      <th>E-Mail</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <% foreach from=$MEMTEAMS.myteam item=row %>
      <tr>
        <td><%$row.nachname%></td>
        <td><%$row.vorname%></td>
        <td><%$row.klasse%></td>
        <td><%$row.email%></td>
        <td>
          <div class="btn-group">
            <a href="<%$eurl%>cmd=del_memteam&kid=<%$row.kid%>"
               class="btn btn-danger btn-sm"
               onclick="return confirm('Soll dieses Team-Mitglied wirklich gelöscht werden?');">
              löschen
            </a>
            <a href="<%$eurl%>cmd=edit_memteam&kid=<%$row.kid%>"
               class="btn btn-info btn-sm">
              bearbeiten
            </a>
            <a href="<%$eurl%>cmd=send_memteam&kid=<%$row.kid%>"
               class="btn btn-warning btn-sm json-link">
              Zugang senden
            </a>
          </div>
        </td>
      </tr>
    <%/foreach%>
  </tbody>
</table>

      <%else%>
        <div class="alert alert-info">Noch keine Mitglieder hinterlegt</div>
    <%/if%>
  </div>
</section>
<%/if%>
<% if ($cmd=='show_memteam_add' || $cmd=='edit_memteam') %>

<section role="region" aria-labelledby="tmr-heading">
  <div class="container">
    <% if ($MEMTEAMS.customer.kid==0) %>
    <h1 id="tmr-heading" class="mb-4" tabindex="0" title="Team Mitglied Registration">Team Mitglied Registration</h1>
    <div id="js-memteams-thx" class="alert alert-success" style="display:none">Das neue Team-Mitglied wurde angelegt.</div>
    <%else%>
    <h1 id="tmr-heading" class="mb-4" tabindex="0" title="Team Mitglied Registration">Team Mitglied bearbeiten</h1>
    <div id="js-memteams-thx" class="alert alert-success" style="display:none">Das Team-Mitglied wurde bearbeitet.</div>
    <%/if%>
    <form role="form" aria-labelledby="tmr-heading" id="js-memteamsform" aria-describedby="form-help error-summary" action="<% $PHPSELF %>" method="post" class="jsonform" enctype="multipart/form-data" novalidate>
      <p id="form-help"><%$plginopt.info%></p>
      <% if ($MEMTEAMS.customer.kid==0) %>
      <input type="hidden" name="cmd" value="add_teammember" aria-hidden="true">
      <%else%>
      <input type="hidden" name="cmd" value="update_teammember" aria-hidden="true">
      <input type="hidden" name="kid" value="<%$MEMTEAMS.customer.kid|intval%>" aria-hidden="true">
      <%/if%>
      <input type="hidden" name="page" value="<% $page %>" aria-hidden="true">
      <input name="csrftoken" type="hidden" value="<%$plginopt.csrftoken%>" aria-hidden="true">
      <input name="cont_matrix_id" type="hidden" value="<%$plginopt.cont_matrix_id%>" aria-hidden="true">
      <div class="row">
        <div class="col-md-4">
          <fieldset>
            <legend class="h4 mb-3" id="legend-kontakt" tabindex="0">Kontaktdaten</legend>
            <div class="mb-3">
              <label for="fmrgeschlecht" class="form-label">{LBL_ANREDE}</label>
              <select class="form-select form-control" id="fmrgeschlecht" name="FORM[anrede_sign]"
                      autocomplete="honorific-prefix" title="Anrede" aria-label="Anrede">
                <% foreach from=$MEMTEAMS.salutselect item=val key=kkey %>
                  <option value="<%$kkey%>"><%$val%></option>
                <%/foreach%>
              </select>
            </div>
      
            <div class="mb-3">
              <label for="vorname" class="form-label">{LBL_VORNAME}*</label>
              <input type="text" class="form-control" id="vorname"
                     placeholder="Vorname" required aria-required="true"
                     name="FORM[vorname]"
                     autocomplete="given-name" title="Vorname"
                     value="<%$MEMTEAMS.customer.vorname|sthsc%>"
                     >
            </div>
      
            <div class="mb-3">
              <label for="fmrnachname" class="form-label">{LBL_NACHNAME}*</label>
              <input type="text" class="form-control" id="fmrnachname"
                     placeholder="Nachname" required aria-required="true"
                     name="FORM[nachname]" 
                     autocomplete="family-name" title="Nachname"
                     value="<%$MEMTEAMS.customer.nachname|sthsc%>"
                     >
            </div>
      
            <div class="mb-3">
              <label for="email" class="form-label">Email*</label>
              <input type="email" class="form-control" id="email"
                     placeholder="Email" required aria-required="true"
                     name="FORM[email]"
                     autocomplete="email" title="E-Mail-Adresse"
                     value="<%$MEMTEAMS.customer.email|sthsc%>"
                     <% if ($MEMTEAMS.customer.kid>0) %>disabled="" readonly=""<%/if%>
                     >
            </div>
          </fieldset>
        </div>
      </div> <!-- ENDE ROW -->

      <input type="hidden" name="FORM[land]" value="1" aria-hidden="true">
      <div class="btn-group">
        <a href="<%$eurl%>" class="btn btn-secondary">zurück</a>
         <% if ($MEMTEAMS.customer.kid==0) %>
        <button class="btn btn-primary" type="submit" title="Registrierung absenden" aria-label="Registrierung absenden">{LBL_REGISTER}</button>
        <%else%>
        <button class="btn btn-primary" type="submit" title="speichern" aria-label="Registrierung absenden">aktualisieren</button>
        <%/if%>
      </div>
    </form>
  </div>
</section>
<% /if %>
<%else%>
  <div class="alert alert-warning" role="alert" aria-live="assertive">Bitte anmelden</div>
<% /if %>