<% if ($title=="") %>
    <% assign var=title value="Drag & Drop Fotos hier" %>
<%/if%>
<% if ($paramName=="") %>
    <% assign var=paramName value="file" %>
<%/if%>
<% if ($page=="") %>
    <% assign var=page value=$gbl_config.mem_link_detail_pageid %>
<%/if%>
  <div class="dropzonecss" id="drop-zone-files-<%$ident%>" style="line-height:30px;min-height:100px">
            <%$title%><br><small>max. 7MB</small>
        </div>
        <div id="dropzonefeedback-<%$ident%>" 
        data-reloadfunction="<%$reloadFunction%>" 
        data-addon="<%$addon%>" 
        data-maxfiles="<%$maxFiles%>" 
        data-cmd="<%$cmd%>"
        data-paramname="<%$paramName%>"
        -title="<%$title%>" 
        data-ident="<%$ident%>" 
        data-acceptfiles="<%$acceptedFiles%>" 
        data-event="dropzone">
          
        </div>