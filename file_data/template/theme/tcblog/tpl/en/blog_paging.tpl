<% if ($BLOG.paging.total_pages > 1) %>
  <nav class="pagination">
    <ul class="pagination">
      <% if ($BLOG.paging.start > 0) %>
      <li class="page-item">
        <a title="Blog paging to <% $BLOG.paging.startback %>" class="page-link" href="<% $BLOG.paging.base_link %>&start=<% $BLOG.paging.startback %>" tabindex="1">Previous</a>
      </li>
      <% /if%>
      <% foreach from=$BLOG.paging.back_pages item=ppage_link %>
      <li class="page-item">
        <a title="Blog paging to <% $ppage_link.index %>" class="page-link" href="<% $ppage_link.link %>" tabindex="<% $ppage_link.index %>"><% $ppage_link.index %></a>
      </li>
      <% /foreach %>
      <li class="page-item active" aria-current="page">
        <span class="page-link" aria-disabled="true"><% $BLOG.paging.akt_page %></span>
      </li>
      <% foreach from=$BLOG.paging.next_pages item=ppage_link %>
      <li class="page-item">
        <a title="Blog paging to <% $ppage_link.index %>" class="page-link" href="<% $ppage_link.link %>" tabindex="<% $ppage_link.index %>"><% $ppage_link.index %></a>
      </li>
      <% /foreach %>
      <% if ($BLOG.paging.start + $gbl_config.pro_max_paging < $BLOG.paging.product_count_total) %>
      <li class="page-item">
        <a title="Blog paging to <% $BLOG.paging.newstart %>" class="page-link" href="<% $BLOG.paging.base_link %>&start=<% $BLOG.paging.newstart %>" tabindex="<% $BLOG.paging.newstart %>">Next</a>
      </li>
      <% /if%>
    </ul>
  </nav>
 <% /if%>