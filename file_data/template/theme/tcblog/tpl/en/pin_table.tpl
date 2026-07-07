<% if (isset($BLOG.items) && is_array($BLOG.items) && count($BLOG.items) > 0) %>
<% foreach from=$BLOG.items item=row name=mt %>
<article class="article" role="article">
  <header>
    <a title="<% $row.title|sthsc %>" href="<%$row.detail_link %>" aria-label="<% $row.title|sthsc %>">
      <img class="img-thumbnail" src="<%$row.thumb%>" alt="<% $row.title|sthsc %>" role="img">
    </a>
    <h2>
      <a href="<%$row.detail_link %>" tabindex="0" aria-label="Read more about <% $row.title %>"><% $row.title %></a>
    </h2>
    <p>
      Published on
      <time datetime="<% $row.ndate|date_format:"%Y-%m-%d" %>"><% $row.ndate|date_format:"%d %b %Y" %></time>
      <% if ($row.username!="") %>
      by
      <span itemscope itemtype="http://schema.org/Person">
        <span itemprop="name">
          <a href="<% $eurl %>cmd=load_by_user&user=<% $row.username %>" tabindex="0" aria-label="Posts by <% $row.username %>"><% $row.username %></a>
        </span>
      </span>
      <%/if%>
    </p>
  </header>
  <section>
    <p><% $row.content|st|truncate:360 %></p>
  </section>
  <footer>
    <div class="btn-group" role="group" aria-label="Tag buttons">
      <% foreach from=$row.tags item=tag %>
      <a class="btn btn-secondary btn-sm" href="<% $eurl %>cmd=load_by_tag&tag=<% $tag %>" title="Filter by tag <%$tag%>" tabindex="0" aria-label="Filter by tag <%$tag%>"><%$tag%>&nbsp;</a>
      <%/foreach%>
    </div>
    <div class="text-right">
      <a title="<% $row.title|sthsc %>" href="<%$row.detail_link %>" class="btn btn-primary pull-right" tabindex="0" aria-label="Read more about <% $row.title %>">Read More</a>
    </div>
    <% if ($row.perm.edit==true) %>
    <a href="<%$eurl%>id=<% $row.DID %>&cmd=pininsertshow" tabindex="0" aria-label="Edit <% $row.title %>">edit</a>
    <% /if %>
    <% if ($row.perm.del==true) %>
    <a onClick="return confirm('Sind Sie sicher?')" href="<%$eurl%>&id=<% $row.DID %>&cmd=a_delpin" tabindex="0" aria-label="Delete <% $row.title %>">delete</a>
    <% /if %>
  </footer>
</article>
<%/foreach%>
<% include file="blog_paging.tpl" %>
<% else %>
<div class="alert alert-info" role="alert" tabindex="0">Keine Einträge</div>
<% /if %>
