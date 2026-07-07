<section>
  <h2><%$olmap.title%></h2>
  <div id="ol-<%$olmap.cont_matrix_id%>" class="ol js-load-ol" data-opt='<%$olmap.json%>'></div>
  <% foreach from=$olmap.addresses key=hash item=row %>
    <div id="ol-marker-<%$hash%>"><i class="fa fa-map-marker fa-3x text-danger" aria-hidden="true"></i></div>
  <%/foreach%>
</section>
<%*$olmap|echoarr*%>