<%*$plugopt|echoarr*%>
<% if ($cmd=='load_reg_event') %>
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
        <h4><%$MAVREG.regevent.e_name%></h4>
        <p><%$MAVREG.regevent.e_description|nl2br%></p>
        <p>Es sind noch <b><%$MAVREG.regevent.free%></b> Plätze frei.</p>
        <form action="<%$PHPSELF%>" method="POST" class="jsonform form js-mav-con" role="form">
          <input type="hidden" name="cmd" value="add_user">
          <input type="hidden" name="evtid" value="<%$MAVREG.regevent.id%>">
          <input type="hidden" name="page" value="<%$page%>">
          <input type="hidden" name="csrftoken" value="<%$MAVREG.regevent.csrftoken%>">
          <input type="hidden" name="cont_matrix_id" value="<%$plugopt.cont_matrix_id%>">
          <div class="row align-items-center">
            <div class="col-12">
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
            <div class="col-12 text-right">
              <button type="submit" class="btn btn-primary text-uppercase" aria-label="Formular senden">Senden</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<%else%>
<section class="py-8" role="region" aria-hidden="true">
  <div class="container">
    <h2><%$plugopt.title|nl2br%></h2>
   <% if (count($MAVREG.table)>0) %>
     <div class="row">
     <% foreach from=$MAVREG.table name="loop" item=row %>
     <div class="col-md-6">
       <div class="row">
         <div class="col-md-4"><img alt="<%$row.e_name|sthsc%>" class="img-fluid" src="<%$row.thumb%>"></div>
         <div class="col-md-8"><h3><%$row.e_name%></h3></div>
         <div class="col-md-6">on <%$row.e_date_ger%>: <%$row.e_from%>&ndash;<%$row.e_to%></div>
         <div class="col-md-6 text-right"><a class="btn btn-primary" alt="book now <%$row.e_name|sthsc%>" href="<%$row.link%>">book now</a></div>
       </div>
     </div>
     <%/foreach%>
     </div>
   <%/if%>
  </div>
</section>  
<%/if%>