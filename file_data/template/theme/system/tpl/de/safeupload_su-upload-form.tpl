  <% if ($customer.kid>0) %>
  
  <% if ($cmd=="") %>
  <script>
  const _su = {
    eurl: '<%$eurl%>',
    acceptedFiles: '.jpg,.jpeg,.png,.pdf,.xls,.csv',
    max_upload_size: <%$max_upload_size_mb|intval%>
  }
  </script>
  <script src="<%$PATH_CMS%>includes/modules/safeupload/js/dropzone/dropzone.js"></script>
  <link rel="stylesheet" href="<%$PATH_CMS%>includes/modules/safeupload/js/dropzone/dropzone.css">
  <section>
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="file-explorer content">
            <ul>
              <li><a href="#" data-event='open-dir' data-dir="" title="Home">Home</a>
                <ul>
                  <% function name="doctree" %>
                  <%foreach from=$items key=dir item=element%>
                  <li class="<%if !empty($element.children)%>open<%/if%>">
                    <a href="#" data-event='open-dir' data-dir="<%$element.hash|hsc%>" title="<%$element.folder|hsc%>"><%$element.folder%></a>
                    <%if !empty($element.children)%>
                    <ul><%call name="doctree" items=$element.children%></ul>
                    <%/if%>
                  </li>
                  <%/foreach%>
                  <%/function%>
                  <% call name=doctree items=$SAFEUPLOAD.tree %>
                </ul>
              </li>
            </ul>

          </div>
        </div>
        <div class="col-md-6">
          <h3>Dateien hochladen</h3>

          <div class="dropzonecss" id="js-customer-dropzone" data-cont_matrix_id="<%$cont_matrix_id%>">
            Drag & Drop Dateien hier
          </div>
          <div id="dropzonefeedback"></div>
          <div id="js-customer-files"></div>

          <small>Upload für <%$customer.vorname%> <%$customer.nachname%>, KNR: <%$customer.kid%> | Maximale Datei Größe: <%$SAFEUPLOAD.max_upload_size%></small>

          <div id="js-su-files"></div>
        </div>
      </div>
    </div>
  </section>
  <%/if%>

  <% if ($cmd=="reload_customer_files") %>

  <% if ( isset($SAFEUPLOAD.files) && is_array($SAFEUPLOAD.files) && count($SAFEUPLOAD.files)>0) %>
  <p><i>Verzeichnis: <%$SAFEUPLOAD.current_dir%></i></p>

  <h3>Ihre Dateien</h3>
  <table class="table table-hover table-striped">
    <thead>
      <tr>
        <th>Datei</th>
        <th>Größe</th>
        <th>Datum</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <% foreach from=$SAFEUPLOAD.files item=row %>
      <tr>
        <td><a title="Download <%$row.file%>" href="<%$eurl%>cmd=user_file_download&kid=<%$GET.kid%>&hash=<%$row.hash%>"><%$row.file%></a></td>
        <td><%$row.size%></td>
        <td><%$row.date%></td>
        <td class="text-right"><a title="Download <%$row.file%>" href="<%$eurl%>cmd=user_file_download&kid=<%$GET.kid%>&hash=<%$row.hash%>" class="btn btn-default btn-sm"><i class="fa fa-download"></i></a></td>
      </tr>
      <%/foreach%>
    </tbody>
  </table>
  <%/if%>
  <%/if%>



  <%else%>
  <div class="alert alert-info">Bitte melden Sie sich an.</div>
  <%/if%>