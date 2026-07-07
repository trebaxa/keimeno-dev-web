<section role="main" aria-labelledby="page-title">
  <div class="container">
<% if ($customer.kid > 0) %>
  <h1 class="mb-4" id="page-title">Mitgliedsdaten ändern</h1>
<% else %>
  <h1 class="mb-4" id="page-title">Registration</h1>
<% /if %>
<form role="form" action="<% $PHPSELF %>" method="post" id="orderform" data-event="registerform" name="orderform" <% if ($CU_LOGGEDIN==false) %>onSubmit="return valform()"<%/if%> enctype="multipart/form-data" aria-describedby="form-required-hint">
  <p id="form-required-hint" class="sr-only">Mit * gekennzeichnete Felder sind Pflichtfelder.</p>
  <input type="hidden" name="cmd" value="<% if ($CU_LOGGEDIN==false) %>insert<%else%>update<%/if%>">
  <input type="hidden" name="page" value="<% $page %>">
  <input name="csrftoken" type="hidden" value="<%$plginopt.csrftoken%>">
  <input name="cont_matrix_id" type="hidden" value="<%$plginopt.cont_matrix_id%>">
  <input type="hidden" value="" name="email" class="d-none" aria-hidden="true" tabindex="-1">
  <div class="d-none" aria-hidden="true">
    <label for="honeypot" class="sr-only">Dieses Feld bitte leer lassen.</label>
    <input name="honeypot" id="honeypot" type="text" value="" tabindex="-1" autocomplete="off">
  </div>
  <div class="row" role="group" aria-labelledby="contact-data-heading">
    <div class="col-md-4">
      <h2 class="h4" id="contact-data-heading">Kontaktdaten</h2>
      <div class="form-group">
        <label for="fmrgeschlecht">{LBL_ANREDE}</label>
        <select class="form-control" id="fmrgeschlecht" name="FORM[anrede_sign]">
          <% $kregform.salutselect %>
        </select>
      </div>
      <div class="form-group">
        <label for="fmrfirma" class="sr-only">{LBL_FIRMENNAME}</label>
        <input type="text" class="form-control<% if ($kregform_err.firma!='') %> is-invalid<% /if %>" id="fmrfirma" placeholder="{LBL_FIRMENNAME}" name="FORM[firma]" value="<% $kregform.firma %>" aria-invalid="<% if ($kregform_err.firma!='') %>true<%else%>false<%/if%>">
      </div>
      <div class="form-group">
        <label for="vorname" class="sr-only">{LBL_VORNAME}*</label>
        <input type="text" class="form-control<% if ($kregform_err.vorname!='') %> is-invalid<% /if %>" id="vorname" placeholder="Vorname" required aria-required="true" name="FORM_NOTEMPTY[vorname]" value="<% $kregform.vorname %>" aria-invalid="<% if ($kregform_err.vorname!='') %>true<%else%>false<%/if%>">
      </div>
      <div class="form-group">
        <label for="fmrnachname"  class="sr-only">{LBL_NACHNAME}*</label>
        <input type="text" class="form-control<% if ($kregform_err.nachname!='') %> is-invalid<% /if %>" id="fmrnachname" placeholder="Nachname" required aria-required="true" name="FORM_NOTEMPTY[nachname]" value="<% $kregform.nachname %>" aria-invalid="<% if ($kregform_err.nachname!='') %>true<%else%>false<%/if%>">
      </div>
    </div>
    <div class="col-md-4" role="group" aria-labelledby="address-heading">
      <h2 id="address-heading">{LBL_ADDRESS}</h2>
      <div class="form-group">
        <div class="row">
          <div class="col-md-8">
            <label for="strasse" class="sr-only">{LBL_STRASSE}*</label>
            <input type="text" class="form-control<% if ($kregform_err.strasse!='') %> has-error<% /if %>" id="strasse" placeholder="Strasse" required aria-required="true" name="FORM_NOTEMPTY[strasse]" value="<% $kregform.strasse %>" aria-invalid="<% if ($kregform_err.strasse!='') %>true<%else%>false<%/if%>">
          </div>
          <div class="col-md-4">
            <label for="hausnr" class="sr-only">HausNr*</label>
            <input type="text" class="form-control<% if ($kregform_err.hausnr!='') %> has-error<% /if %>" id="hausnr" placeholder="Hausnr." required aria-required="true" name="FORM_NOTEMPTY[hausnr]" value="<% $kregform.hausnr %>" aria-invalid="<% if ($kregform_err.hausnr!='') %>true<%else%>false<%/if%>">
          </div>
        </div>
      </div>
      <div class="form-group">
        <label for="plz" class="sr-only">{LBL_PLZ}*</label>
        <input type="text" class="form-control<% if ($kregform_err.plz!='') %> has-error<% /if %>" id="plz" placeholder="PLZ" required aria-required="true" name="FORM_NOTEMPTY[plz]" value="<% $kregform.plz %>" aria-invalid="<% if ($kregform_err.plz!='') %>true<%else%>false<%/if%>">
      </div>
      <div class="form-group">
        <label for="ort" class="sr-only">{LBL_ORT}*</label>
        <input type="text" class="form-control<% if ($kregform_err.ort!='') %> has-error<% /if %>" id="ort" placeholder="Ort" required aria-required="true" name="FORM_NOTEMPTY[ort]" value="<% $kregform.ort %>" aria-invalid="<% if ($kregform_err.ort!='') %>true<%else%>false<%/if%>">
      </div>
      <div class="form-group">
        <label for="land" class="sr-only">{LBL_LAND}*</label>
        <select class="form-control<% if ($kregform_err.land!='') %> has-error<% /if %>" id="land" name="FORM[land]" required aria-required="true" aria-invalid="<% if ($kregform_err.land!='') %>true<%else%>false<%/if%>"><% $kregform.countryselect %></select>
      </div>
      <div class="form-group">
        <label for="tel" class="sr-only">{LBL_TELEFON}*</label>
        <input type="text" class="form-control<% if ($kregform_err.tel!='') %> has-error<% /if %>" id="tel" placeholder="Telefon" required aria-required="true" name="FORM_NOTEMPTY[tel]" value="<% $kregform.tel %>" aria-invalid="<% if ($kregform_err.tel!='') %>true<%else%>false<%/if%>">
      </div>
      <div class="form-group">
        <label for="fax" class="sr-only">{LBL_FAX}*</label>
        <input type="text" class="form-control<% if ($kregform_err.fax!='') %> has-error<% /if %>" id="fax" placeholder="{LBL_FAX}" required aria-required="true" name="FORM[fax]" value="<% $kregform.fax %>" aria-invalid="<% if ($kregform_err.fax!='') %>true<%else%>false<%/if%>">
      </div>
      <% if ($gbl_config.newsletter_disable_unreg==0) %>
        <div class="form-group form-check mt-3">
          <input type="checkbox" class="form-check-input" id="mailactive" name="FORM[mailactive]" value="1" <% if ($kregform.mailactive==1) %>checked<% /if %> aria-checked="<% if ($kregform.mailactive==1) %>true<%else%>false<%/if%>">
          <label class="form-check-label" for="mailactive">{LBL_NEWSACTIVE}</label>
        </div>
      <%/if%>
       <% if ($plginopt.use_capcha==1) %>
            <div class="mb-3" role="group" aria-labelledby="securecode-label">
              <label id="securecode-label" for="securecode" class="form-label">{LBL_SECODE}*</label>
              <div class="d-flex align-items-center mb-2">
                <img 
                  src="<%$MEMINDEX.captcha%>" 
                  alt="{LBL_SECODE}" 
                  title="{LBL_SECODE}" 
                  class="me-3 shadow-sm" 
                  role="img" 
                >
                <small class="text-muted" id="securecode-instruction">
                  Bitte lösen Sie die Aufgabe und tragen Sie das Ergebnis ein
                </small>
              </div>
              <input 
                type="text" 
                class="form-control<% if ($kregform_err.securecode!='') %> is-invalid<% /if %>" 
                id="securecode" 
                name="securecode" 
                placeholder="Captcha Ergebnis eingeben" 
                required 
                aria-required="true" 
                aria-describedby="securecode-label securecode-instruction" 
                aria-invalid="<% if ($kregform_err.securecode!='') %>true<%else%>false<%/if%>" 
              >
              <% if ($kregform_err.securecode!='') %>
                <div class="invalid-feedback" id="securecode-error">
                  {LBL_CODEENTER} ist erforderlich
                </div>
              <% /if %>
            </div>
      <%/if%>
    </div>
    <div class="col-md-4" role="group" aria-labelledby="login-data-heading">
      <h2 id="login-data-heading">Login Daten</h2>
      <div class="form-group has-feedback<% if ($kregform.username=="") %> has-error<%/if%>">
        <label for="js-username" class="sr-only">Username*</label>
        <input aria-describedby="inputSuccess2Status" type="text" class="required form-control<% if ($kregform_err.username!='') %> has-error<% /if %>" data-kid="<%$customer.kid%>" id="js-username" placeholder="Username" required aria-required="true" name="FORM_NOTEMPTY[username]" value="<% $kregform.username|sthsc %>" aria-invalid="<% if ($kregform_err.username!='') %>true<%else%>false<%/if%>">
        <span class="fa fa-times form-control-feedback" aria-hidden="true"></span>
        <span id="inputSuccess2Status" class="sr-only">Status der Eingabe für Benutzername</span>
      </div>
      <div class="form-group">
        <label for="email" class="sr-only">Email*</label>
        <input type="email" class="required form-control<% if ($kregform_err.email!='') %> has-error<% /if %>" id="email" placeholder="Email" required aria-required="true" name="FORM[email]" value="<% $kregform.email %>" aria-invalid="<% if ($kregform_err.email!='') %>true<%else%>false<%/if%>">
      </div>
      <div class="form-group">
        <label for="passwort" class="sr-only">{LBL_PASSWORT}*</label>
        <input type="password" class="<% if ($CU_LOGGEDIN==false) %>required<%/if%> form-control<% if ($kregform_err.passwort!='') %> has-error<% /if %>" id="passwort" placeholder="Passwort" <% if ($CU_LOGGEDIN==false) %>required aria-required="true"<%/if%> name="FORM[passwort]" value="<% $kregform.passwort %>" aria-invalid="<% if ($kregform_err.passwort!='') %>true<%else%>false<%/if%>">
      </div>
      <!--<h2>Bankverbindung</h2>
      <div class="form-group">
        <label for="iban" class="sr-only">IBAN*</label>
        <input type="text" class="form-control<% if ($kregform_err.iban!='') %> has-error<% /if %>" id="passwort" placeholder="IBAN" required name="FORM_NOTEMPTY[iban]" value="<% $kregform.iban %>">
      </div>
      <div class="form-group">
        <label for="bic" class="sr-only">BIC*</label>
        <input type="text" class="form-control<% if ($kregform_err.bic!='') %> has-error<% /if %>" id="bic" placeholder="BIC" required name="FORM_NOTEMPTY[bic]" value="<% $kregform.bic %>">
      </div>
      <div class="form-group">
        <label for="bank" class="sr-only">Bank*</label>
        <input type="text" class="form-control<% if ($kregform_err.bank!='') %> has-error<% /if %>" id="bank" placeholder="Bank" required name="FORM_NOTEMPTY[bank]" value="<% $kregform.bank %>">
        <% if ($kregform_err.bank!='') %><span class="glyphicon glyphicon-remove form-control-feedback"></span><% /if %>
      </div>
      -->
    </div>
  </div> <!-- ENDE ROW -->
  <div class="row" role="group" aria-labelledby="photo-heading">
    <div class="col-md-12">
      <h2 id="photo-heading">{LBL_YOURFOTO}</h2>
      <% include file="fileupload.tpl" %>
    </div>
    <div class="col-md-12">
      <% if ($CU_LOGGEDIN==false) %>
      <h2 id="agb-heading">AGB</h2>
  <div class="form-group form-check" role="group" aria-labelledby="agb-heading">
    <input type="checkbox" class="form-check-input" id="agbtrue" name="agbtrue" value="1" required aria-required="true">
    <label class="form-check-label" for="agbtrue">
      Die <a href="{URL_TPL_10045}" target="_blank" title="Allgemeine Geschäftsbedingungen in neuem Fenster öffnen">AGB</a> habe ich zur Kenntnis genommen und mit ihrer Geltung bin ich einverstanden
    </label>
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="wr" name="wr" value="1" required aria-required="true">
    <label class="form-check-label" for="wr">
      Die <a href="{URL_TPL_10045}" target="_blank" title="Widerrufsbelehrung in neuem Fenster öffnen">Widerrufsbelehrung</a> habe ich zur Kenntnis genommen
    </label>
  </div>
      <%/if%>
    </div>
  </div> <!-- ENDE ROW -->
  <% if (count($member_collections) > 0) %>
    <h2 id="topics-heading">Themen</h2>
    <% foreach from=$member_collections item=colg name=cgloop %>
    <h3 id="collection-<%$colg.col_id%>"><% $colg.col_name %></h3>
    <table class="table table-hover" role="presentation" aria-labelledby="collection-<%$colg.col_id%>">
      <tbody>
        <tr>
          <td>
            <% if ($colg.col_id==1) %>
            <% assign var=line_break value=8 %>
            <% else %>
            <% assign var=line_break value=11 %>
            <% /if %>
            <% foreach from=$colg.groups item=group name=gloop %>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="group-<%$group.gid%>-<%$colg.col_id%>" <% $group.checked %> name="MEMBERGROUPSCOL[<% $group.gid %>_<% $colg.col_id%>]" value="<% $group.gid %>_<% $colg.col_id%>" aria-checked="<% if $group.checked!='' %>true<%else%>false<%/if%>">
              <label class="form-check-label" for="group-<%$group.gid%>-<%$colg.col_id%>"><% $group.groupname %></label>
            </div>
            <% if $smarty.foreach.gloop.iteration % $line_break == 0 %></td>
          <td valign="top"><% /if %>
            <% /foreach %>
          </td>
        </tr>
      </tbody>
    </table>
    <% /foreach %>
  <%/if%>
  <% if ($CU_LOGGEDIN==false) %>
  <button class="btn btn-primary" type="submit" title="{LBL_REGISTER} Formular absenden">{LBL_REGISTER}</button>
  <%else%>
  <button class="btn btn-primary" type="submit" title="{LBL_BTN_SAVE}">{LBL_BTN_SAVE}</button>
  <% /if %>
</form>
<% if ( isset($MEMINDEX.myfiles) && is_array($MEMINDEX.myfiles) && count($MEMINDEX.myfiles)>0) %>
<h2 id="files-heading">Dateien</h2>
<div class="row" role="region" aria-labelledby="files-heading">
  <div class="col-md-6">
    <ul id="doctree" role="tree" aria-label="Dateiordner">
      <li id="folder_treeroot" data-haschildren="1" role="treeitem" aria-expanded="false">
        <a 
          href="javascript:void(0)" 
          class="js-myfiles-click" 
          data-href="<%$PHPSELF%>?page=<%$page%>&cmd=load_customer_files&folder=<%$MEMINDEX.root_hash%>" 
          title="Storage Center öffnen" 
          role="button" 
          aria-controls="js-myfiles" 
        >
          Storage Center
        </a>
        <ul role="group">
          <% function name="resrc_treevar" %>
          <%foreach from=$items item=element%>
          <li 
            <% if ($element.haschildren==0) %>data-tid="<%$element.id%>"<%/if%> 
            data-haschildren="<% if ($element.haschildren==1) %>1<%else%>0<%/if%>" 
            role="treeitem" 
            aria-expanded="<% if ($element.haschildren==1) %>false<%else%>false<%/if%>" 
          >
            <a 
              href="javascript:void(0)" 
              class="js-myfiles-click" 
              data-href="<%$PHPSELF%>?page=<%$page%>&cmd=load_customer_files&folder=<%$element.hash%>" 
              title="<%$element.folder|sthsc%> öffnen" 
              role="button" 
              aria-controls="js-myfiles" 
            >
              <% if ($element.haschildren==1) %><%$element.folder|st|truncate:10%><%else%><%$element.folder|st%><%/if%>
            </a>
            <%if !empty($element.children)%>
            <ul role="group"><%call name="resrc_treevar" items=$element.children%></ul>
            <%/if%>
          </li>
          <%/foreach%>
          <%/function%>
          <% call name="resrc_treevar" items=$MEMINDEX.tree %>
        </ul>
      </li>
    </ul>
  </div>
  <div class="col-md-6" id="js-myfiles" role="region" aria-label="Ausgewählte Dateien">
    <% include file="mem_file_list.tpl" %>
  </div>
</div>
<%/if%>
</div>
</section>