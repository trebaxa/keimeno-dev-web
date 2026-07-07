<script>
var _docopt = (window._docopt = window._docopt || []);
_docopt.push(["eurl", "<%$eurl%>"]);
_docopt.push(["params", '<%$plginopt|json_encode%>']);
_docopt.push(["cont_matrix_id", "<%$cont_matrix_id%>"]);
</script>

  <section id="downloads">
    <div class="container">
      <h1>Dokumente</h1>

      <div class="row">
        <div class="col-md-4">
          <div class="file-explorer" data-event='file-explorer'>
            <ul>
              <%$first = true%>
              <% function name="doctree" %>
              <%foreach from=$items key=dir item=element%>
              <li class="<%if !empty($element.children)%>open<%/if%>">
                <a href="javascript:;" <%if !empty($element.children)%> data-event='open-tree' <%/if%> data-event='open-dir' data-params='<%$plginopt|json_encode%>' data-dir="<%$dir|base64encode%>" title="<%$dir|hsc%>">
                  <% if ($first)  %>
                  <%$dir|replace:'/':''|hsc%>
                  <%$first = false%>
                  <%  else  %>
                  <%$element.label%>
                  <% /if %>
                </a>
                <%if !empty($element.children)%>
                <ul><%call name="doctree" items=$element.children%></ul>
                <%/if%>
              </li>
              <%/foreach%>
              <%/function%>
              <% call name=doctree items=$DOCCENTER.tree %>
            </ul>
          </div>

        </div>

        <div class="col-md-8">
          
          <div id="js-doc-files">
            <% include file="downloadcenter_dc-files.tpl" %>
          </div>
          
          
           <% if ($customer.ALLPERM.downloadcenter.upl==1) %>
            <button class="btn btn-primary mt-3 mb-3" type="button" id="js-btn-upl" data-path="<%$DOCCENTER.path|md5%>">upload</button>
          
        <div id="js-upload" style="display:none">
              <div class="row">
                <div class="col-md-12 mt-3">
                  <form action="<%$PHPSELF%>" class="form jsonform" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="cmd" value="doc_fileupload" />
                    <input type="hidden" name="page" value="<%$page%>">
                    <input type="hidden" name="path" id="js-dc-path" value="<%$DOCCENTER.path|md5%>">
                    <div class="form-group">
                      <label>Titel:</label>
                      <input type="text" required="" class="form-control" name="FORM[title]" placeholder="Bezeichnung" value="" />
                    </div>
                    <div class="form-group">
                      <label>Beschreibung:</label>
                      <textarea class="form-control" name="FORM[description]" placeholder="Beschreibung"></textarea>
                    </div>
          
                    <div class="form-group">
                      <label for="exampleFormControlFile1">Datei</label>
                      <input type="file" class="form-control-file" name="datei" id="exampleFormControlFile1">
                    </div>
          
          
                    <div class="btn-group">
                      <button type="submit" class="btn btn-primary">Upload</button>
                      <button type="button" class="btn btn-secondary" onclick="$('#js-upload').slideToggle();">close</button>
                    </div>
                  </form>
                </div>
                <div class="col-md-6">
                </div>
              </div>
            </div>      
        <%/if%>    
         
         
        </div>

      </div>


    </div>
  </section>