<% if ($downloads) %>
<%* $dl_tree|echoarr *%>
<%* $downloads|echoarr *%>


<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th>Datei</th>
      <th>Beschreibung</th>
      <th class="text-right">Größe</th>
      <th class="text-right">Download</th>
    </tr>
  </thead>
  <tbody>
  <% foreach from=$downloads item=fileobj name=membloop %>
      <tr>
        <td><% $fileobj.title %></td>
        <td><% $fileobj.description %></td>
        <td class="text-right"><% $fileobj.filesize %></td>
        <td class="text-right">
            <a title="Download <% $fileobj.title %>" href="<% $fileobj.link %>"><i class="fa fa-2x fa-download"></i></a>
            <a href="javascript:;" class="comments" data-ident='<%$fileobj.id%>' data-event="comment">
              <span class="value"><%$fileobj.comment_count|intval%></span>
            </a>
        </td>
      </tr>
  <% /foreach %>
  </tbody>
</table>
<%else%>
  <div class="alert alert-info">Es liegen derzeit keine Dokumente vor.</div>
<% /if %>