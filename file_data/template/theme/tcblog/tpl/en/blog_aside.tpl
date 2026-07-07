<aside class="sidebar">

    
    <% if (count($BLOG.latest_items_by_blog)>0) %>
    <h3>Letzte Artikel</h3>
    <ul>
      <% foreach from=$BLOG.latest_items_by_blog item=row %>
      <li>
        <a title="<%$row.title|sthsc%>" href="<%$row.detail_link%>"><%$row.title%></a><br>
        <small>published: <% $row.date %></small>
      </li>
      <% /foreach %>
    </ul>
    <%/if%>
    
    <% if (count($BLOG.top_items)>0) %>
    <h3>Top Beiträge</h3>
    <ul>
      <% foreach from=$BLOG.top_items item=row %>
      <li>
        <a title="<%$row.title|sthsc%>" href="<%$row.detail_link%>"><%$row.title%></a><br>
        <small>published: <% $row.date %></small>
      </li>
      <% /foreach %>
    </ul>
    <%/if%>
    <% if (count($BLOG.yearfilter)>0) %>
    <h3>Archive</h3>
    <% foreach from=$BLOG.yearfilter item=row key=year %>
    <ul>
      <li>
        <span><%$year%></span>
        <ul>
          <% foreach from=$row item=month key=numm %>
            <% if ($month.count>0) %>
              <li><a href="<%$month.link%>"><%$month.label%><span class="badge pull-right"><%$month.count%></span></a></li>
            <%/if%>
          <%/foreach%>
        </ul>
      </li>
      <%/foreach%>
    </ul>
    <%/if%>
  </aside>