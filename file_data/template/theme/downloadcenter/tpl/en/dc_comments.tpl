<div class="file-comments">
    <span class="close">CLOSE</span>
    <ul>
      <% foreach from=$DOCCENTER.comments item=row  %>
      <li class="incoming">
        <span class="name"><%$row.customer.vorname%> <%$row.customer.nachname%></span>
        <span class="comment"><%$row.d_text|sthsc%></span>
      </li>
      <%/foreach%>
    </ul>
  <% include file="downloadcenter_dc-comment-form.tpl" %>
  </div>

  
  
<script>
  fwstart();
</script>