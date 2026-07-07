<% if ($customer.kid>0) %>
  
  <% if ($cmd=="") %>
  <script src="<%$PATH_CMS%>includes/modules/safeupload/js/dropzone/dropzone.js"></script>
  <link rel="stylesheet" href="<%$PATH_CMS%>includes/modules/safeupload/js/dropzone/dropzone.css">
  <script>
  const _su = {
    eurl: '<%$eurl%>',
    acceptedFiles: '.jpg,.jpeg,.png,.pdf,.xls,.csv',
    max_upload_size: <%$max_upload_size_mb|intval%>
  }
  </script>
  <a href="#main-content" class="skip-link" tabindex="0" title="Zum Hauptinhalt springen">Zum Inhalt springen</a>
  <section id="main-content" class="section has-background-light is-medium" role="main" aria-labelledby="upload-heading">
    <div class="container">
      <div class="columns" role="region" aria-label="Dateiverwaltung">

        <div class="column is-6-desktop" role="complementary" aria-label="Ordnernavigation">
          <nav class="file-explorer content" aria-label="Dokumentenbaum">
            <ul role="tree" aria-label="Stammverzeichnis">
              <li role="treeitem" aria-expanded="true">
                <a href="#" role="presentation" data-event='open-dir' data-dir="" title="Home" aria-label="Ordner Home öffnen">Home</a>
                <ul role="group">
                  <% function name="doctree" %>
                  <%foreach from=$items key=dir item=element%>
                  <li class="<%if !empty($element.children)%>open<%/if%>" role="treeitem" aria-expanded="<%if !empty($element.children)%>true<%else%>false<%/if%>" aria-label="Ordner <%$element.folder|hsc%>">
                    <a href="#" role="presentation" data-event='open-dir' data-dir="<%$element.hash|hsc%>" title="<%$element.folder|hsc%>" aria-controls="group-<%$element.hash|hsc%>" aria-label="Ordner <%$element.folder|hsc%> öffnen"><%$element.folder%></a>
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

        <div class="column is-6-desktop" role="region" aria-label="Dateiliste und Upload">
          <div id="js-su-files" style="margin-bottom:3rem;" role="region" aria-label="Ausgewählte Ordnerdateien"></div>
          <h3 id="upload-heading">Dateien hochladen</h3>

          <div class="dropzonecss" id="js-customer-dropzone" role="button" tabindex="0" aria-label="Dateien per Drag and Drop hier ablegen oder drücken Sie die Eingabetaste, um eine Datei auszuwählen" aria-describedby="dropzone-instructions" data-cont_matrix_id="<%$cont_matrix_id%>">
            Drag & Drop Dateien hier
          </div>
          <p id="dropzone-instructions">Ziehen Sie zulässige Dateien hierher oder navigieren Sie mit der Tastatur und drücken Sie Eingabetaste, um eine Auswahl zu treffen. Erlaubte Dateitypen: JPG, JPEG, PNG, PDF, XLS, CSV.</p>
          <div id="dropzonefeedback" role="status" aria-live="polite"></div>
          <div id="js-customer-files" role="region" aria-label="Hochgeladene Dateien"></div>

          <small id="upload-meta" aria-live="polite">Upload für <%$customer.vorname%> <%$customer.nachname%>, KNR: <%$customer.kid%> | Maximale Datei Größe: <%$SAFEUPLOAD.max_upload_size%></small>
        </div>
      </div>
    </div>
  </section>
  <%/if%>

  <% if ($cmd=="reload_customer_files" || $cmd=="load_customer_files") %>
  <p><i aria-hidden="true">Verzeichnis: <%$SAFEUPLOAD.current_dir%></i></p>
  <br><br>

  <% if ( isset($SAFEUPLOAD.files) && is_array($SAFEUPLOAD.files) && count($SAFEUPLOAD.files)>0) %>
  <h3 id="files-heading">Ihre Dateien</h3>
  <table class="table" aria-labelledby="files-heading">
    <caption class="visually-hidden">Tabelle der verfügbaren Dateien mit Name, Größe und Datum</caption>
    <thead>
      <tr>
        <th scope="col">Datei</th>
        <th scope="col">Größe</th>
        <th scope="col">Datum</th>
        <th scope="col">Aktionen</th>
      </tr>
    </thead>
    <tbody>
      <% foreach from=$SAFEUPLOAD.files item=row %>
      <tr>
        <td><a title="Download <%$row.file%>" aria-label="Datei <%$row.file%> herunterladen" href="<%$eurl%>cmd=user_safe_file_download&kid=<%$GET.kid%>&hash=<%$row.hash%>"><%$row.file%></a></td>
        <td><%$row.size%></td>
        <td><%$row.date%></td>
        <td class="text-right"><a title="Download <%$row.file%>" aria-label="Herunterladen: <%$row.file%>" href="<%$eurl%>cmd=user_safe_file_download&cmid=<%$cont_matrix_id%>&hash=<%$row.hash%>" class="btn btn-default btn-sm"><i class="fa fa-download" aria-hidden="true"></i></a></td>
      </tr>
      <%/foreach%>
    </tbody>
  </table>
  <%else%>
  <div class="callout" role="status" aria-live="polite">Keine Dateien vorhanden</div>
  <%/if%>
  <%/if%>

  <%else%>
  <div class="alert alert-info" role="alert">Bitte melden Sie sich an.</div>
  <%/if%>