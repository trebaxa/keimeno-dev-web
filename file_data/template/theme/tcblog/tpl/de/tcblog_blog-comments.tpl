  <% if ( isset($selected_item.comments) && is_array($selected_item.comments) && count($selected_item.comments)>0) %>
    <h2>Comments</h2>
    <% foreach from=$selected_item.comments item=row %>
      <div class="card mb-3">
        <div class="card-body">
          <h5 class="card-title"><%$row.c_autor%></h5>
          <p class="card-text"><%$row.c_comment|sthsc%></p>
          <p class="card-text text-muted"><%$row.c_time|date_format:"%d:%m:%Y"%></p>
        </div>
      </div>
    <%/foreach%>
  <%/if%>