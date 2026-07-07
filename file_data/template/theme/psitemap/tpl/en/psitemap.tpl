<h2 class="mt-5" id="sitemap-heading">Sitemap</h2>
<ul id="psitemap"
    class="list-unstyled container"
    role="list"
    aria-labelledby="sitemap-heading">
  <% function name="psitemap" %>
    <%foreach from=$items item=element%>
      <%if empty($element.children)%>
        <li>
          <a href="<%$element.catlink%>"
             title="<%$element.catlabel|escape:'html'%>"
             aria-label="<%$element.catlabel|escape:'html'%>">
            <%$element.catlabel%>
          </a>
        </li>
      <%else%>
        <li aria-haspopup="true">
          <strong><%$element.catlabel%></strong>
          <%if !empty($element.children)%>
            <ul class="ms-3" role="list">
              <%call name="psitemap" items=$element.children%>
            </ul>
          <%/if%>
        </li>
      <%/if%>
    <%/foreach%>
  <%/function%>
  <%call name=psitemap items=$PSITEMAP.menu_arr%>
</ul>
