<nav class="navbar navbar-expand-xl navbar-light fixed-top site-navbar" role="navigation" itemscope itemtype="http://schema.org/SiteNavigationElement">
  <div class="container">
    <a class="navbar-brand fw-bold" href="<%$PATH_CMS%>" aria-label="Home" itemprop="name">
      K-THEME
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavigation" aria-controls="mainNavigation" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNavigation">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0" role="menubar">
        <%function name="mainmenutree" %>
          <%foreach from=$items item="element"%>
            <%if ($element.catlevel == 1)%>
              <% if (!(is_array($exclude_cids) && $element.id|in_array:$exclude_cids)) %>
                <li class="nav-item<%if !empty($element.children)%> dropdown<%/if%>" role="presentation" itemscope itemtype="http://schema.org/MenuItem">
                  <a itemprop="url" class="nav-link <%$element.t_class%><%if ($element.active==true)%> active<%/if%><%if !empty($element.children)%> dropdown-toggle<%/if%>" href="<%$element.catlink%>" title="<%$element.catlabel|hsc%>" <%if !empty($element.children)%>data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"<%/if%> <%$element.t_attributes%> aria-label="<%$element.catlabel%>" role="menuitem" tabindex="0">
                    <span itemprop="name"><%$element.catlabel%></span>
                  </a>
                  <%if !empty($element.children)%>
                    <ul class="dropdown-menu" aria-labelledby="<%$element.catlabel%>" role="menu">
                      <%call name="mainmenutree" items=$element.children%>
                    </ul>
                  <%/if%>
                </li>
              <%/if%>
            <%else%>
              <li role="none">
                <a itemprop="url" class="dropdown-item <%$element.t_class%>" href="<%$element.catlink%>" title="<%$element.catlabel|hsc%>" <%$element.t_attributes%> aria-label="<%$element.catlabel%>" role="menuitem" tabindex="0">
                  <span itemprop="name"><%$element.catlabel%></span>
                </a>
              </li>
            <%/if%>
          <%/foreach%>
        <%/function%>
        <% call name="mainmenutree" items=$categorytree %>
      </ul>
      <div class="d-flex align-items-center gap-3">
        <% include file="flagtable.tpl" %>
      </div>
    </div>
  </div>
</nav>
