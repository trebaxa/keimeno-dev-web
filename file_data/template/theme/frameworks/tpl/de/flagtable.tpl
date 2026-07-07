<% if ( isset($flags) && is_array($flags) && count($flags)>1) %>
  <div class="btn-group btn-group-sm" role="group" aria-label="Language switcher">
    <% foreach from=$flags item=language %>
      <a title="<%$language.post_lang|sthsc%>" href="<%$language.link%>" class="btn <% if ($language.id == $GBL_LANGID)%>btn-primary<%else%>btn-outline-secondary<%/if%>"><%$language.local|strtoupper%></a>
    <%/foreach%>
  </div>
<%/if%>
