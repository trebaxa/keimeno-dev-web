<script>
  var _tcblog = {
    eurl: "<%$eurl%>",
    id: "<%$selected_item.DID%>",
    id_comments: "js-blog-comments"
  };
</script>
<div class="container blog" role="main">
  <% if (isset($themes) && is_array($themes) && count($themes) > 1) %>
  <div class="btn-group m-b-1" role="navigation" aria-label="Theme selection">
    <% foreach from=$themes item=theme name=mt %>
    <a class="btn btn-group btn-secondary <% $theme.class %>" href="<% $theme.link %>" role="button" aria-pressed="false" tabindex="0" title="<% $theme.theme %>"><% $theme.theme %></a>
    <% /foreach %>
  </div>
  <% /if %>
  <% if ($GET.year|intval > 0) %>
  <h3 tabindex="0"><%$BLOG.daterange%></h3>
  <% /if %>
  <div class="row">
    <div class="col-12 col-md-9">
      <% if ($cmd == 'load_blog_item') %>
        <% include file="pin_detail.tpl" %>
      <% else %>
        <% include file="pin_table.tpl" %>
      <% /if %>
    </div>
    <div class="col-md-3">
      <% include file="blog_aside.tpl" %>
    </div>
  </div>
</div>