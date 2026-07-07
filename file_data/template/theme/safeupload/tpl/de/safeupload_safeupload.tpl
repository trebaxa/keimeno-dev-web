<% if ($customer.kid>0) %>

  <% if ($cmd=="") %>
  <script src="<%$PATH_CMS%>includes/modules/safeupload/js/dropzone/dropzone.js"></script>
  <link rel="stylesheet" href="<%$PATH_CMS%>includes/modules/safeupload/js/dropzone/dropzone.css">
  <script>
  const _su = {
    eurl: '<%$eurl%>',
    acceptedFiles: '.jpg,.jpeg,.png,.pdf,.xls,.csv',
    max_upload_size: <%$max_upload_size_mb|intval%>
  };
  </script>
  <a href="#main-content" class="visually-hidden-focusable" tabindex="0" title="Zum Hauptinhalt springen">Zum Inhalt springen</a>
  <section id="main-content" class="section-space upload-section" role="main" aria-labelledby="upload-heading">
    <div class="container">
      <div class="row mb-4">
        <div class="col-lg-8">
          <h1 class="section-title" id="upload-heading">Dateien hochladen</h1>
          <p class="lead mt-3 text-secondary">
            Verwalten Sie Ihre Ordner und laden Sie Dokumente sicher in Ihren Kundenbereich.
          </p>
        </div>
      </div>

      <div class="row g-4 align-items-start" role="region" aria-label="Dateiverwaltung">
        <div class="col-12 col-lg-5" role="complementary" aria-label="Ordnernavigation">
          <nav class="contact-card file-explorer p-4" aria-label="Dokumentenbaum">
            <h2 class="h5 mb-3">Ordner</h2>
            <ul class="file-tree" role="tree" aria-label="Stammverzeichnis">
              <li role="treeitem" aria-expanded="true">
                <a href="#" data-event="open-dir" data-dir="" title="Home" aria-label="Ordner Home &ouml;ffnen">
                  <i class="fa-solid fa-folder-open me-2" aria-hidden="true"></i>Home
                </a>
                <ul role="group">
                  <% function name="doctree" %>
                  <%foreach from=$items key=dir item=element%>
                  <li class="<%if !empty($element.children)%>open<%/if%>" role="treeitem" aria-expanded="<%if !empty($element.children)%>true<%else%>false<%/if%>" aria-label="Ordner <%$element.folder|hsc%>">
                    <a href="#" data-event="open-dir" data-dir="<%$element.hash|hsc%>" title="<%$element.folder|hsc%>" aria-controls="group-<%$element.hash|hsc%>" aria-label="Ordner <%$element.folder|hsc%> &ouml;ffnen">
                      <i class="fa-solid fa-folder me-2" aria-hidden="true"></i><%$element.folder%>
                    </a>
                    <%if !empty($element.children)%>
                    <ul id="group-<%$element.hash|hsc%>" role="group"><%call name="doctree" items=$element.children%></ul>
                    <%/if%>
                  </li>
                  <%/foreach%>
                  <%/function%>
                  <% call name=doctree items=$SAFEUPLOAD.tree %>
                </ul>
              </li>
            </ul>
          </nav>
        </div>

        <div class="col-12 col-lg-7" role="region" aria-label="Dateiliste und Upload">
          <div class="contact-card upload-panel p-4 p-lg-5">
            <div id="js-su-files" class="upload-file-list mb-4" role="region" aria-label="Ausgew&auml;hlte Ordnerdateien"></div>
            <h2 class="h4 mb-3">Upload</h2>
            <div class="dropzonecss upload-dropzone" id="js-customer-dropzone" role="button" tabindex="0" aria-label="Dateien per Drag and Drop hier ablegen oder Eingabetaste dr&uuml;cken, um eine Datei auszuw&auml;hlen" aria-describedby="dropzone-instructions" data-cont_matrix_id="<%$cont_matrix_id%>">
              <i class="fa-solid fa-cloud-arrow-up" aria-hidden="true"></i>
              <span>Drag &amp; Drop Dateien hier</span>
            </div>
            <p class="small text-secondary mt-3 mb-3" id="dropzone-instructions">
              Erlaubte Dateitypen: JPG, JPEG, PNG, PDF, XLS, CSV.
            </p>
            <div id="dropzonefeedback" class="small" role="status" aria-live="polite"></div>
            <div id="js-customer-files" class="mt-4" role="region" aria-label="Hochgeladene Dateien"></div>
            <small class="d-block text-secondary mt-4" id="upload-meta" aria-live="polite">
              Upload f&uuml;r <%$customer.vorname%> <%$customer.nachname%>, KNR: <%$customer.kid%> | Maximale Dateigr&ouml;&szlig;e: <%$SAFEUPLOAD.max_upload_size%>
            </small>
          </div>
        </div>
      </div>
    </div>
  </section>
  <%/if%>

  <% if ($cmd=="reload_customer_files" || $cmd=="load_customer_files") %>
  <div class="upload-current-directory mb-3"><i class="fa-solid fa-folder-open me-2" aria-hidden="true"></i>Verzeichnis: <%$SAFEUPLOAD.current_dir%></div>

  <% if ( isset($SAFEUPLOAD.files) && is_array($SAFEUPLOAD.files) && count($SAFEUPLOAD.files)>0) %>
  <h3 id="files-heading">Ihre Dateien</h3>
  <div class="table-responsive">
    <table class="table table-hover align-middle" aria-labelledby="files-heading">
      <caption class="visually-hidden">Tabelle der verf&uuml;gbaren Dateien mit Name, Gr&ouml;&szlig;e und Datum</caption>
      <thead>
        <tr>
          <th scope="col">Datei</th>
          <th scope="col">Gr&ouml;&szlig;e</th>
          <th scope="col">Datum</th>
          <th scope="col" class="text-end">Aktionen</th>
        </tr>
      </thead>
      <tbody>
        <% foreach from=$SAFEUPLOAD.files item=row %>
        <tr>
          <td><a title="Download <%$row.file%>" aria-label="Datei <%$row.file%> herunterladen" href="<%$eurl%>cmd=user_safe_file_download&kid=<%$GET.kid%>&hash=<%$row.hash%>"><%$row.file%></a></td>
          <td><%$row.size%></td>
          <td><%$row.date%></td>
          <td class="text-end"><a title="Download <%$row.file%>" aria-label="Herunterladen: <%$row.file%>" href="<%$eurl%>cmd=user_safe_file_download&cmid=<%$cont_matrix_id%>&hash=<%$row.hash%>" class="btn btn-primary btn-sm"><i class="fa-solid fa-download" aria-hidden="true"></i></a></td>
        </tr>
        <%/foreach%>
      </tbody>
    </table>
  </div>
  <%else%>
  <div class="alert alert-info" role="status" aria-live="polite">Keine Dateien vorhanden</div>
  <%/if%>
  <%/if%>

<%else%>
  <section class="section-space">
    <div class="container">
      <div class="alert alert-info" role="alert">Bitte melden Sie sich an.</div>
    </div>
  </section>
<%/if%>
