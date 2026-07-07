<%*$MEMINDEX.myfiles|echoarr*%>
<% if ( isset($MEMINDEX.myfiles) && is_array($MEMINDEX.myfiles) && count($MEMINDEX.myfiles)>0) %>
  <table class="table table-hover table-striped" role="table" aria-describedby="user-files-caption">
    <caption id="user-files-caption" class="sr-only">User files list with file name, size in bytes, date, and download action.</caption>
    <thead>
      <tr role="row">
        <th scope="col" id="col-file">File name</th>
        <th scope="col" id="col-size">Size (Bytes)</th>
        <th scope="col" id="col-date">Date</th>
        <th scope="col" id="col-actions" class="text-right">Actions</th>
      </tr>
    </thead>
    <tbody>
  <% foreach from=$MEMINDEX.myfiles item=row %>
    <tr role="row">
        <td headers="col-file">
          <a href="<%$PHPSELF%>?page=<%$page|escape%>&cmd=user_file_download&hash=<%$row.hash|escape%>&folder=<%$row.file_to_root_hash|escape%>" title="Download <%$row.file|escape%>" aria-label="Download <%$row.file|escape%>"><%$row.file|escape%></a>
        </td>
        <td headers="col-size"><%$row.size|escape%> Bytes</td>
        <td headers="col-date"><%$row.date|escape%></td>
        <td headers="col-actions" class="text-right">
          <a href="<%$PHPSELF%>?page=<%$page|escape%>&cmd=user_file_download&hash=<%$row.hash|escape%>&folder=<%$row.file_to_root_hash|escape%>" class="btn btn-default" title="Download <%$row.file|escape%>" aria-label="Download <%$row.file|escape%>" download="<%$row.file|escape%>">
            <i class="fa fa-download" aria-hidden="true"></i>
            <span class="sr-only">Download <%$row.file|escape%></span>
          </a>
        </td>
    </tr>
  <%/foreach%>
  </tbody>
  </table>
<%/if%>