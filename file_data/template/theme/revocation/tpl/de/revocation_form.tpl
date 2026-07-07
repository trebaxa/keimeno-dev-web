<section class="revocation-page container">
    <% if $REVOCATION.page == 'done' %>
        <h1>Widerruf eingegangen</h1>
        <div class="alert alert-success">
            <p>Ihre Widerrufserkl&auml;rung wurde &uuml;bermittelt.</p>
            <p>Referenz: <strong><%$REVOCATION.ref%></strong></p>
            <p>Sie erhalten eine automatische Eingangsbest&auml;tigung per E-Mail.</p>
        </div>
    <% elseif $REVOCATION.page == 'confirm' %>
        <h1>Widerruf best&auml;tigen</h1>
        <% if $REVOCATION.message %>
            <div class="alert alert-warning"><%$REVOCATION.message%></div>
        <% /if %>
        <dl class="revocation-contract dl-horizontal well">
            <dt>Name</dt>
            <dd><%$REVOCATION.contract.name%></dd>
            <dt>Vertrags-ID</dt>
            <dd><%$REVOCATION.contract.oid%></dd>
            <dt>E-Mail</dt>
            <dd><%$REVOCATION.contract.email%></dd>
        </dl>
        <form method="post" action="<%$REVOCATION.action%>">
            <input type="hidden" name="cmd" value="revocation_submit">
            <input type="hidden" name="step" value="declare">
            <input type="hidden" name="token" value="<%$REVOCATION.contract.token%>">
            <button class="btn btn-primary" type="submit">Widerruf best&auml;tigen</button>
        </form>
    <% else %>
        <h1>Vertrag widerrufen</h1>
        <% if $REVOCATION.message %>
            <div class="alert alert-warning"><%$REVOCATION.message%></div>
        <% /if %>
        <p>Bitte geben Sie die Vertrags-ID und die zugeh&ouml;rige E-Mail-Adresse an.</p>
        <form method="post" action="<%$REVOCATION.action%>">
            <input type="hidden" name="cmd" value="revocation_submit">
            <input type="hidden" name="step" value="identify">
            <div class="form-group">
                <label for="revocation-oid">Vertrags-ID</label>
                <input class="form-control" id="revocation-oid" type="text" name="FORM[oid]" required>
            </div>
            <div class="form-group">
                <label for="revocation-name">Name</label>
                <input class="form-control" id="revocation-name" type="text" name="FORM[name]" required>
            </div>
            <div class="form-group">
                <label for="revocation-email">E-Mail-Adresse</label>
                <input class="form-control" id="revocation-email" type="email" name="FORM[email]" required>
            </div>
            <button class="btn btn-primary" type="submit">Vertrag ausw&auml;hlen</button>
        </form>
    <% /if %>
</section>
