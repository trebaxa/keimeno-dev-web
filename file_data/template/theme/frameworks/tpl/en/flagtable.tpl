<% if ( isset($flags) && is_array($flags) && count($flags)>1) %>
  <div class="btn-group pull-right">
    <% foreach from=$flags item=language %>
      <a title="<%$language.post_lang|sthsc%>" href="<%$language.link%>" class="btn btn-secondary btn-sm<% if ($language.id == $GBL_LANGID)%> is-active<%/if%>"><%$language.local|strtoupper%></a>
      <%*<% if ($language.bild!="") %>
      &nbsp;<a title="<%$language.post_lang|sthsc%>" href="<%$language.link%>" target="_self"><img title="<%$language.post_lang%>" alt="<%$language.post_lang%>" src="<%$language.icon%>" loading="lazy"></a>
      <%else%>
      &nbsp;<a title="<%$language.post_lang|sthsc%>" href="<%$language.link%>" target="_self"><%$language.post_lang%></a>
      <%/if%>*%>
    <%/foreach%>
  </div>
<%/if%>