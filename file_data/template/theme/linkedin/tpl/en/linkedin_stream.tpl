<section>
  <div class="container">
  <h2>LinkedIn</h2>
  <%*$linkedinstream|echoarr*%>
  <div class="row">
  <% foreach from=$linkedinstream.feed item=row name=instaloop %>
    <div class="col-md-3" data-media_type="<%$row.media_type%>">
        <% if ($row.media_type=='VIDEO') %>
      <video loop muted="" controls style="width:100%">
        <source  src="<%$row.video_file%>" />
        <%*<!--<source src="../static/video/10s.webm" type='video/webm; codecs="vp8, vorbis"' />
        <source src="../static/video/10s.ogv" type='video/ogg; codecs="theora, vorbis"' />-->*%>
      </video>   
      <%else%>
        <img src="<%$row.thumb%>" alt="<%$row.caption|sthsc%>" class="img-responsive" loading="lazy">
      <%/if%>
      <p><%$row.message%></p>
      <small>vom: <%$row.date_ger%></small>
    </div>
  <%/foreach%>
  </div>
</div>  
</section>