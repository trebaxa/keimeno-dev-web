<section class="py-4">
  <div class="container">
    <h2 class="h4 mb-4">Instagram</h2>

    <% if ($instastream.feed|count==0) %>
      <div class="alert alert-info">No posts available at the moment.</div>
    <%/if%>

    <div class="row">
      <% foreach from=$instastream.feed item=row name=instaloop %>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4" data-media_type="<%$row.media_type%>">
          <div class="card h-100 shadow-sm">
            <% if ($row.media_type=='VIDEO') %>
              <div class="embed-responsive embed-responsive-1by1">
                <video class="embed-responsive-item" preload="none" controls poster="<%$row.thumb_small%>">
                  <source src="<%$row.video_file%>">
                </video>
              </div>
            <%else%>
              <a href="<%$row.link%>" target="_blank" rel="noopener" aria-label="Instagram: <%$row.caption|sthsc|truncate:60%>">
                <img
                  src="<%$row.thumb%>"
                  srcset="<%$row.thumb_srcset%>"
                  sizes="<%$row.thumb_sizes%>"
                  loading="lazy" decoding="async"
                  alt="<%$row.caption|sthsc|truncate:80%>"
                  class="card-img-top">
              </a>
            <%/if%>
            <div class="card-body p-2">
              <div class="small text-muted mb-1"><i class="fa fa-calendar mr-1"></i><%$row.date_ger%></div>
              <div class="small" title="<%$row.caption|sthsc%>"><%$row.caption|truncate:120%></div>
            </div>
          </div>
        </div>
      <%/foreach%>
    </div>
  </div>
</section>
