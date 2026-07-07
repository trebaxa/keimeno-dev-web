<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light" role="navigation" itemscope itemtype="http://schema.org/SiteNavigationElement">
  <div class="container">
    <a class="navbar-brand" href="/index.html" aria-label="Home" itemprop="name">
      K-THEME
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav" role="menubar">
        <%function name="mainmenutree" %>
          <%foreach from=$items item="element"%>
            <%if ($element.catlevel == 1)%>
              <% if (is_array($exclude_cids) && $element.id|in_array:$exclude_cids) %>
                <li role="none">
              <%else%>
                <li class="nav-item<% if ($element.active==true) %> active<%/if%><%if !empty($element.children)%> dropdown<%/if%>" role="presentation" itemscope itemtype="http://schema.org/MenuItem">
                  <a itemprop="url" class="nav-link <%$element.t_class%><%if !empty($element.children)%>dropdown-toggle<%/if%>" href="<%$element.catlink%>" title="<%$element.catlabel|hsc%>" <%if !empty($element.children)%> data-toggle="dropdown" data-close-others="false" aria-haspopup="true" aria-expanded="false" <%/if%> <%$element.t_attributes%> aria-label="<%$element.catlabel%>" role="menuitem" tabindex="0">
                    <% if ($element.t_icon_img!="") %>
                      <img src="<%$element.t_icon_img%>" alt="<%$element.catlabel%>" itemprop="image" loading="lazy">
                    <%/if%>
                    <span itemprop="name"><%$element.catlabel%></span>
                    <% if ($element.t_icon_img!="") %>
                      <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                    <%/if%>
                  </a>
              <%/if%>
              <%if !empty($element.children)%>
                <div class="dropdown-menu" aria-labelledby="<%$element.catlabel%>" role="menu">
                  <%call name="mainmenutree" items=$element.children%>
                </div>
              <%/if%>
            </li>
            <%else%>
              <a itemprop="url" class="nav-link <%$element.t_class%>" href="<%$element.catlink%>" title="<%$element.catlabel|hsc%>" <%$element.t_attributes%> aria-label="<%$element.catlabel%>" role="menuitem" tabindex="0">
                <% if ($element.t_icon_img!="") %>
                  <img src="<%$element.t_icon_img%>" alt="<%$element.catlabel%>" itemprop="image" loading="lazy">
                <%/if%>
                <span itemprop="name"><%$element.catlabel%></span>
                <% if ($element.t_icon_img!="") %>
                  <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                <%/if%>
              </a>
            <%/if%>
          <%/foreach%>
        <%/function%>
        <% call name="mainmenutree" items=$categorytree %>
      </ul>
      <div class="ml-auto">
        <% include file="flagtable.tpl" %>
      </div>
    </div>
  </div>
</nav>
<%*$categorytree|echoarr*%>