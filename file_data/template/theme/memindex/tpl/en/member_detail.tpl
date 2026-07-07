<div itemscope itemtype="https://schema.org/LocalBusiness">
  <meta itemprop="email" content="<%$member.email%>">
  <meta itemprop="legalName" content="<%$member.firma|sthsc%>">
  <meta itemprop="image" content="<%$cms_url%><% $member.img_detail %>">
  <meta itemprop="priceRange" content="10€ - 900000€">
  <meta itemprop="name" content="<%$member.firma|sthsc%>">
  <div itemprop="address" itemscope itemtype="https://schema.org/PostalAddress">
    <meta itemprop="streetAddress" content="<%$member.strasse|sthsc%> <%$member.hasunr|sthsc%>">
    <meta itemprop="postalCode" content="<%$member.plz|sthsc%>">
    <meta itemprop="addressLocality" content="<%$member.ort|sthsc%>">
    <meta itemprop="telephone" content="<%$member.tel|sthsc%>">
  </div>
</div>
<section class="light">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <%*$member|echoarr*%>
        <p class="lead">Unternehmensprofil:</p>
        <h1><% if ($member.firma!="") %><% $member.firma %><% else %><% $member.vorname %>, <% $member.nachname%><%/if%></h1>
      </div>
    </div>
    <div class="row">
      <div class="col-12 col-md-12 col-lg-8">
        <figure>
          <% if ( isset($member.images) && is_array($member.images) && count($member.images)>0) %>
          <% assign var=break value=false%>
          <% foreach from=$member.images item=row name=iloop %>
          <% if ($row.width>=$row.height && $break==false) %>
          <img src="<%$row.img_detail%>" alt="<% $member.firma|sthsc %>" loading="lazy">
          <% assign var=break value=true%>
          <%/if%>
          <% if ($row.width<$row.height && $break==false) %>
          <img src="<%$row.img_crop_big%>" alt="<% $member.firma|sthsc %>" loading="lazy">
          <% assign var=break value=true%>
          <%/if%>
          <%/foreach%>
          <% if ($break==false) %>
          <img src="<%$member.img_detail%>" alt="<% $member.firma|sthsc %>" class="mx-auto" loading="lazy">
          <%/if%>
          <%else%>
          <img src="<%$member.img_detail%>" alt="<% $member.firma|sthsc %>" class="mx-auto" loading="lazy">
          <%/if%>
        </figure>
        <hr>
        <div class="about-customer">
          <p class="lead">
            <%$member.description%>
          </p>
          <% if ( isset($member.images) && is_array($member.images) && count($member.images)>0) %>
          <hr class="m-t-3 m-b-3">
          <div class="swiper-container member-gallery">
            <div class="swiper-wrapper">
              <% foreach from=$member.images item=row name=customgal %>
              <div class="swiper-slide">
                <a title="<% $member.firma|sthsc %> Galeriebild <% $smarty.foreach.customgal.iteration %>" href="/file_data/memindex/<%$member.kid%>/<%$row.pic_name%>" data-fancybox="gal">
                  <img src="<%$row.img_crop%>" alt="<% $member.firma|sthsc %> Galeriebild <% $smarty.foreach.customgal.iteration %>" loading="lazy">
                </a>
              </div>
              <%/foreach%>
            </div>
            <div class="swiper-button-prev"><i class="icofont-rounded-left"></i></div>
            <div class="swiper-button-next"><i class="icofont-rounded-right"></i></div>
            <div class="swiper-scrollbar tx-hide"></div>
          </div>
          <% /if %>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12 col-md-12 col-lg-3 offset-lg-1">
        <% if ($member.ml_yt!="") || ( isset($member.images) && is_array($member.images) && count($member.images)>0)  %>
        <a title="Webseite" href="<% $member.homepage %>" target="_blank" rel="noreferrer noopener" class="member__logo m-b-1 mx-auto">
          <img src="<%$member.img_detail%>" alt="<% $member.firma %>" loading="lazy">
        </a>
        <%/if%>
        <div class="callout <% foreach from=$member.groups item=row name=iloop %><%$row.class%><%/foreach%>">
          <div class="callout__header">
            <span class="h6"><i class="<%$member.first_group.icon_class%>"></i> <%$member.first_group.groupname%></span>
          </div>
          <div class="callout__body">
            <dl class="kontakt">
              <dt><i class="icofont-location-pin"></i></dt>
              <dd><% $member.strasse %> <% $member.hausnr %> <br><% $member.plz%> <% $member.ort%></dd>
            </dl>
            <% if ($member.tel !="") %>
            <dl class="kontakt">
              <dt><i class="icofont-phone"></i></dt>
              <dd><a title="Telefon" href="tel:+49<% $member.tel|regex_replace:"/D/":""  %>"><% $member.tel%></a></dd></dd>
            </dl>
            <% /if %>
            <% if ($member.email !="") %>
            <dl class="kontakt">
              <dt><i class="icofont-envelope"></i></dt>
              <dd><a title="Email" href="mailto:<% $member.email %>" data-tooltip data-position="top" data-alignment="right" title="E-Mail schrieben an <% $member.firma %>"><% $member.email|truncate:25|sthsc %></a></dd>
            </dl>
            <% /if %>
            <% if ($member.homepage!="") %>
            <dl class="kontakt">
              <dt><i class="icofont-globe"></i></dt>
              <dd><a title="<%$member.firma|sthsc%>" href="<% $member.homepage %>" target="_blank">zur Webseite</a></dd>
            </dl>
            <% /if %>
            <% if ($member.link_fb!="") %>
            <dl class="kontakt">
              <dt><i class="icofont-facebook"></i></dt>
              <dd><a title="<%$member.link_fb|sthsc%>" href="<% $member.link_fb %>" target="_blank">Facebook</a></dd>
            </dl>
            <% /if %>
            <% if ($member.link_insta!="") %>
            <dl class="kontakt">
              <dt><i class="icofont-instagram"></i></dt>
              <dd><a title="<%$member.link_insta|sthsc%>" href="<% $member.link_insta %>" target="_blank">Instagram</a></dd>
            </dl>
            <% /if %>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<% include file="kshop_kshop-produktauflistung.tpl" %>
<%*
<table class="tab_std" width="100%" >
 <tr>
<% if ($member.img!="") %> <td width="<% $gbl_config.opt_box_thumb_width %>">
<img src="<% $member.img %>" loading="lazy" ></td><% /if %>
 <td valign="top"><h1><% $member.anrede %> <% $member.vorname %> <% $member.nachname %></h1>
<% if ($member.firma!="") %>
<% $member.firma %><br>
<% else %>
<% $member.vorname %>, <% $member.nachname%><br>
<% /if %>
<% $member.strasse %><br>
<% $member.plz%> <% $member.ort%><br><br>
<% if ($member.tel !="") %> Telefon: <% $member.tel %><br><% /if %>
<% if ($member.fax !="") %> Fax: <% $member.fax %><br><% /if %>
<br>
<% if ($member.homepage!="") %> Internet: <a href="<% $member.homepage %>" target="_blank"><% $member.homepage %></a><br><% /if %>
<% if ($member.email !="") %> Email: <% $member.email %><br><% /if %>
<% if ($member.collectiontogroup) %>
<% foreach from=$member.collectiontogroup item=colg name=cgloop %>
 <h6><% $colg.collection.col_name %></h6>
 <ul style="list-style:none">
 <% foreach from=$colg.groups item=group name=gloop %>
  <li><% $group.groupname %></li>
<% /foreach %>
</ul>
<% /foreach %>
<% /if %>
</td></tr></table>
*%>