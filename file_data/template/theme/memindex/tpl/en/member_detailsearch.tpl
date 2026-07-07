<h1>{LBL_DETAILMEMBERSEARCH}</h1>
<form role="form" action="<% $PHPSELF %>" method="post">
<table class="tab_std">
<tr>
    <td>{LBL_NACHNAME}</td>
    <td><input class="form-control" type="text" name="FORM_NOTEMPTY[nachname]" size="30" value="<% $searchform_notempty.nachname %>" aria-label="{LBL_NACHNAME}"></td>
 </tr>
<tr>
    <td>{LBL_PLZ} / {LBL_ORT}</td>
    <td><input class="form-control" type="text" name="FORM[plz]" size="6" value="<% $searchform.plz %>" aria-label="{LBL_PLZ}"> 
    <input class="form-control" type="text" name="FORM[ort]" size="10" aria-label="{LBL_ORT}">
    </td>
</tr>
</table>
<input type="hidden" name="aktion" value="detailsearch">
<input type="hidden" name="page" value="<% $page %>">
<button class="btn btn-primary" type="submit">Suche</button>
</form>