<form method="POST" action="<%$eurl%>" class="jsonform">
    <input type="hidden" name="cmd" value="add_comment"></input>
    <input type="hidden" name="page" value="<%$page%>"></input>
    <input type="hidden" name="id" value="<%$GET.id|intval%>"></input>
  <div class="form-group"> 
    <textarea class="form-control" required="" placeholder="Kommentar schreiben" name="FORM[d_text]"></textarea>
  </div>
  <div class="btn-group">
    <button class="btn btn-primary" type="submit">senden</button>
    <button class="btn btn-secondary js-popers-close" type="button" onclick="doccenter.close_cmt()" data-toggle="tooltip">close</button>
  </div>
</form>