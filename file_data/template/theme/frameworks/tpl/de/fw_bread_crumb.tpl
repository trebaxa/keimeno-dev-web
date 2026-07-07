<% if ( isset($PAGEOBJ.t_breadcrumb_arr) && is_array($PAGEOBJ.t_breadcrumb_arr) && count($PAGEOBJ.t_breadcrumb_arr)>1)%>
<nav aria-label="breadcrumb">
  <ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
    <%*<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a itemprop="item" href="/index.html"><span itemprop="name">Startseite</span></a><meta itemprop="position" content="0" /></li>*%>
    <% foreach from=$PAGEOBJ.t_breadcrumb_arr item=bread name=breadloop %>
      <% if ($bread.id!=$page) %>
        <li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
          <a itemprop="item" title="<%$bread.label|hsc%>" href="<%$bread.link%>">
            <%$bread.label%>
          </a>
        </li>
      <%else%>    
        <li class="breadcrumb-item active" aria-current="page"><%$bread.label%></li>
      <%/if%>
    <%/foreach%>
    </ol>
  </div>
<%/if%>