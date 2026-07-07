<% if ($cmd=='showcustomer') %>
    <meta property="og:title" content="<%$member.firma%> | <% $gbl_config.opt_site_title %>" />
  <meta property="og:description" content="<%$member.firma%>" />
  <meta property="og:url" content="<%$cms_url%><% $member.link %>" />
  <meta property="og:locale" content="<% $meta.contentlang %>" />
  <meta property="og:type" content="website" />
  <meta property="og:image" content="<%$cms_url%><% $member.img_fb %>" />
  <meta property="og:image:secure_url" content="<%$cms_url%><% $member.img_fb %>" />
  <meta property="og:image:type" content="image/jpeg" />
  <meta property="og:image:width" content="800" />
  <meta property="og:image:width" content="600" />
  <% foreach from=$member.images item=row %>
    <meta property="og:image" content="<%$cms_url%>/file_data/memindex/<%$member.kid%>/<%$row.pic_name%>" />
    <meta property="og:image:secure_url" content="<%$cms_url%>/file_data/memindex/<%$member.kid%>/<%$row.pic_name%>" />
  <%/foreach%>
  <meta property="og:image:alt" content="HILF <%$member.firma%>" />
  <% if ($member.ml_yt!="") %>
    <meta property="og:video" content="https://www.youtube.com/embed/<% $member.ml_yt %>" />
  <%/if%>
<%elseif ($cmd=='load_blog_item') %>
  <meta property="og:title" content="<% $selected_item.title %>" />
  <meta property="og:description" content="<% $selected_item.date %> - von <% $selected_item.username %>" />
  <meta property="og:url" content="<%$THISURL%>" />
  <meta property="og:locale" content="de_DE" />
  <meta property="og:type" content="website" />
  <% if ($selected_item.image_exists==true)%>
    <meta property="og:image" content="<%$selected_item.image%>" />
    <meta property="og:image:secure_url" content="<%$selected_item.image%>" />
  <%else%>
    <meta property="og:image" content="<% $PATH_CMS %>file_data/template/assets/img/fallback.jpg" />
    <meta property="og:image:secure_url" content="<% $PATH_CMS %>file_data/template/assets/img/fallback.jpg" />
  <%/if%>
  <meta property="og:image:type" content="image/jpeg" />
 <!-- <meta property="og:image:width" content="1200" />
  <meta property="og:image:height" content="630" /> -->
  <meta property="og:image:alt" content="<%$gbl_config.adr_firma%> - <%$selected_item.image%>" />

<%else%>

<meta property="og:title" content="<% $meta.title %>" />
<meta property="og:description" content="<% $meta.description %>" />
<meta property="og:url" content="<%$THISURL%>" />
<meta property="og:type" content="website" />
<meta property="og:locale" content="<% $meta.contentlang %>" />
<% if ($PAGEOBJ.theme_image!="" && $selected_item.image=="") %>
  <meta property="og:image" content="<%$PAGEOBJ.theme_image_url%>" />
  <meta property="og:image:secure_url" content="<%$PAGEOBJ.theme_image_url%>" />
  <meta property="og:image:type" content="image/jpeg" />
  <meta property="og:image:width" content="<%$PAGEOBJ.theme_image_width%>" />
  <meta property="og:image:height" content="<%$PAGEOBJ.theme_image_height%>" />
  <meta property="og:image:alt" content="<% $meta.title %>" />
<%/if%>

  
<%/if%>
