<% if (count($leaflet.addresses) > 0) %>
<section class="py-3" role="region" aria-labelledby="leaflet-title-<%$leaflet.cont_matrix_id%>">
    <% if ($leaflet.title != "") %>
        <h2 id="leaflet-title-<%$leaflet.cont_matrix_id%>"><%$leaflet.title%></h2>
    <%/if%>
    <div id="leaflet-<%$leaflet.cont_matrix_id%>"
        class="ol js-load-leaflet"
        data-opt='<%$leaflet.json%>'
        role="application"
        aria-label="Interaktive Karte mit Adressen"
    ></div>
    <% foreach from=$leaflet.addresses key=hash item=row %>
        <div id="leaflet-hover-<%$hash%>"
            class="leaflet-hover visually-hidden"
            aria-hidden="true"
        >
            <b><%$row.name%></b><br>
            <%$row.str%><br>
            <%$row.plz%> <%$row.city%>
            <p><%$row.text|nl2br%></p>
        </div>
    <%/foreach%>
</section>
<%/if%>
<%*$leaflet|echoarr*%>