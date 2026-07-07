<% if $fileup.isForm==true %>
<form role="form" action="<% $PHPSELF %>" method="post" enctype="multipart/form-data">
<% /if %>

  <div class="form-group">
    <label for="datei"><% $fileup.file_desc %></label>
    <div class="input-group">
      <div class="custom-file">
        <input type="file" class="custom-file-input" id="datei" accept=".jpg,.jpeg,.png" name="datei" onchange="this.nextElementSibling.innerText = this.files[0]?.name || 'Keine Datei ausgewählt';">
        <label class="custom-file-label" for="datei">Keine Datei ausgewählt</label>
      </div>
    </div>
    <small class="form-text text-muted">{LBL_ALLOWEDFILESIZE}: <% $gbl_config.max_pic_size_mb %> MB</small>
  </div>

  <% if $fileup.canDelete==true && $fileup.picture!="" %>
    <div class="mb-3">
      <img <% $fileup.mouseover %> src="<% $fileup.picture %>" class="img-thumbnail d-block mb-1">
      <small class="text-muted"><% $fileup.picture_dim.width %>x<% $fileup.picture_dim.height %> px</small><br>
      <a <% $fileup.confirm %> class="btn btn-sm btn-outline-danger mt-2" href="<% $fileup.del_link %>">{LBL_DELETE}</a>
    </div>
  <% /if %>

  <input type="hidden" name="ftarget" value="<% $fileup.ftarget %>">
  <input type="hidden" name="page" value="<% $page %>">
  <input type="hidden" name="force_ext" value="<% $fileup.force_ext %>">

  <% if $fileup.isForm==true %>
    <button class="btn btn-primary" type="submit">{LBL_UPLOAD}</button>
    <input type="hidden" name="aktion" value="<% $fileup.aktion %>">
</form>
<% /if %>