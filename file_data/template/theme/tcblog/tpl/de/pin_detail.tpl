<article class="article" role="article">
  <header>
    <img src="<%$selected_item.thumb%>" class="img-fluid m-b-1" alt="<% $selected_item.title|sthsc %>" title="<% $selected_item.title|sthsc %>" loading="lazy">
    <h1><% $selected_item.title %></h1>
    <p class="text-muted">by <%$selected_item.username%> | <% $selected_item.date %></p>
  </header>
  <%*$selected_item|echoarr*%>
  <% foreach from=$selected_item.cm_table item=row %>
    <% if ($row.cm_type=='IMG') %>
      <img alt="<%$row.img.thumb|sthsc%>" class="img-fluid" src="<%$row.img.thumb%>" title="<%$row.img.thumb|sthsc%>" loading="lazy"/>
    <%/if%>
    <% if ($row.cm_type=='TEXT') %>
      <% $row.cm_content %>
    <%/if%>
    <% if ($row.cm_type=='GAL') %>
      <section role="region" aria-labelledby="gallery-heading">
        <h2 id="gallery-heading">Gallery</h2>
        <div class="row">
          <% foreach from=$row.gallery item=img %>
          <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <img src="<%$img.thumb%>" alt="<%$img.thumb|sthsc%>" class="img-fluid" title="<%$img.thumb|sthsc%>" loading="lazy">
          </div>
          <%/foreach%>
        </div>
      </section>
    <%/if%>
  <%/foreach%>
  <% if ( isset($selected_item.fotos) && is_array($selected_item.fotos) && count($selected_item.fotos)>0) %>
  <section role="region" aria-labelledby="gallery-heading-2">
    <%*$selected_item.gallery|echoarr*%>
    <h2 id="gallery-heading-2">Gallery</h2>
    <div class="row">
      <% foreach from=$selected_item.gallery item=row %>
      <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
        <img src="<%$row.thumb%>" alt="<%$row.file|sthsc%>" class="img-fluid" title="<%$row.file|sthsc%>" loading="lazy">
      </div>
      <%/foreach%>
    </div>
  </section>
  <%/if%>
  <% if ( isset($selected_item.attachments) && is_array($selected_item.attachments) && count($selected_item.attachments)>0) %>
  <section role="region" aria-labelledby="attachments-heading">
    <h2 id="attachments-heading">Attachments</h2>
    <ul class="list-group">
      <% foreach from=$selected_item.attachments item=row %>
      <li class="list-group-item">
        <a href="<%$row.link%>" download title="<%$row.file|sthsc%>"><%$row.file%></a>
      </li>
      <%/foreach%>
    </ul>
  </section>
  <%/if%>
  <% if ($selected_item.b_ytid!="") %>
  <iframe width="100%" height="315" src="//www.youtube.com/embed/<%$selected_item.b_ytid%>" frameborder="0" allowfullscreen title="YouTube video"></iframe>
  <%/if%>
  <section id="js-blog-comments" role="region" aria-labelledby="comments-heading">
    <%include file="tcblog_blog-comments.tpl"%>
  </section>
  <hr>
  <h2 id="comment-form-heading">Leave a Comment</h2>
  <form class="jsonform" method="POST" action="<%$PHPSELF%>" aria-labelledby="comment-form-heading">
    <input type="hidden" value="send_comment_blog" name="cmd">
    <input type="hidden" value="<%$page%>" name="page">
    <input type="hidden" value="<%$selected_item.DID%>" name="FORM[c_itemid]">
    <div class="form-group">
      <label for="blog-username">Ihr Name</label>
      <input id="blog-username" type="text" value="" name="FORM[c_autor]" required="" class="form-control" tabindex="1" />
    </div>
    <div class="form-group">
      <label for="blog-comment">Ihr Kommentar</label>
      <textarea id="blog-comment" name="FORM[c_comment]" required="" class="form-control" tabindex="2"></textarea>
    </div>
    <div class="form-group hidden">
      <label for="blog-email">E-Mail</label>
      <input id="blog-email" type="email" value="" name="email" class="form-control" tabindex="3" />
    </div>
    <% if ($contact.cf_cpatcha==1) %>
    <div class="form-group">
      <label for="blog-secure" class="sr-only">{LBL_SECODE}*</label>
      <div class="input-group">
        <input placeholder="{LBL_CODEENTER}" id="blog-secure" autocomplete="OFF" name="securecode" class="form-control" type="text" tabindex="4">
        <div class="input-group-addon"><img title="{LBL_SECODE}" alt="captcha" style="height:20px;" src="<%$PATH_CMS%>captcha.php" loading="lazy"></div>
      </div>
    </div>
    <% /if %>
    <button class="btn btn-primary" type="submit" tabindex="5">Submit</button>
  </form>
</article>
<% if (count($selected_item.related_posts_by_tag) > 0) %>
<section>
  <div class="container">
      <h2 class="mb-4">Related Posts</h2>
      <div class="row">
        <% foreach from=$selected_item.related_posts_by_tag item=row %>
          <div class="col-md-6 mb-4">
            <div class="card h-100">
              <a href="<%$row.detail_link%>" title="<% $row.title|sthsc %>">
                <img src="<%$row.thumb_small%>" class="card-img-top" alt="<% $row.title|sthsc %>" loading="lazy">
              </a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="<%$row.detail_link%>" class="stretched-link text-dark">
                    <% $row.title|sthsc %>
                  </a>
                </h5>
              </div>
            </div>
          </div>
        <%/foreach%>
      </div>
  </div>
</section>
<%/if%>