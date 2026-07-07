<div class="row">
  <div class="col-md-6">
      <h2>Workshops in <%$WORKSHOP.city.c_city%></h2>
      <p><%$WORKSHOP.city.c_text|nl2br%></p>
  </div>
  <div class="col-md-6">
    <img src="<%$PATH_CMS%>file_data/workshop/<%$WORKSHOP.city.c_image%>" alt="" class="img-responsive">
  </div>
</div>

<% if ( isset($WORKSHOP.workshops) && is_array($WORKSHOP.workshops) && count($WORKSHOP.workshops)>0) %>
<table class="table table-striped- table-hover">
        <thead>
            <tr>                
                <th>Workshop</th>                
                <th>Datum</th>
                <th class="text-center">freie Plätze</th>
                <th>Beschreibung</th>
                <th></th>
            </tr>
        </thead>   
        <tbody>
        <% foreach from=$WORKSHOP.workshops item=row %>
            <tr >                
                <td><%$row.ws_title%></td>
                <td><%$row.date_ger%></td>
                <td class="text-center"><span class="badge<% if ($row.bookings_free>0) %> bg-success<%/if%>"><%$row.bookings_free%></span></td>
                <td width="60%"><%$row.ws_shortdesc|truncate:300%></td>
                <td class="text-right">
                  <% if ($row.bookings_free>0) %>
                    <a class="btn btn-default" href="<%$PHPSELF%>?page=<%$page%>&cmd=load_workshop&id=<%$row.id%>">mehr...</a>
                  <%else%>
                    <div class="alert alert-danger" data-event="remove_onload" data-seconds="3">ausgebucht</div>
                  <%/if%>
                </td>
            </tr>
        <%/foreach%>
        </tbody>
</table>
<%else%>
  <div class="alert alert-info">Zur Zeit gibt es hier keine Workshops.</div>
<%/if%>