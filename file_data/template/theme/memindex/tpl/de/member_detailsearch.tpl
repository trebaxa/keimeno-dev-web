<h1>{LBL_DETAILMEMBERSEARCH}</h1>
<form role="form" action="<% $PHPSELF %>" method="post">
<table class="tab_std">
<tr>
    <td><label for="nachname">{LBL_NACHNAME}</label></td>
    <td><input class="form-control" type="text" name="FORM_NOTEMPTY[nachname]" id="nachname" size="30" value="<% $searchform_notempty.nachname %>"></td>
 </tr>
<tr>
    <td><label for="plz" id="plz_ort_label">{LBL_PLZ} / {LBL_ORT}</label></td>
    <td><input class="form-control" type="text" name="FORM[plz]" id="plz" size="6" value="<% $searchform.plz %>" aria-labelledby="plz_ort_label"> 
    <input class="form-control" type="text" name="FORM[ort]" id="ort" size="10" aria-label="{LBL_ORT}">
    </td>
</tr>
</table>
<input type="hidden" name="aktion" value="detailsearch">
<input type="hidden" name="page" value="<% $page %>">
<button class="btn btn-primary" type="submit">Suche</button>
</form>