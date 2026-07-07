<%*$LIEFERMA.nationalitys|echoarr*%>
<div class="btn-group">
  <% foreach from=$LIEFERMA.nationalitys item=row %>
    <a class="btn btn-secondary" href="<% $eurl %>cmd=load_res&FILTER[r_typ]=<%$row.key%>"><%$row.key%></a>
  <%/foreach%>
</div>


<% if ($cmd=='') %>

                <%* $LIEFERMA|echoarr *%>

      <div class="container">
            <% if ( isset($LIEFERMA.data) && is_array($LIEFERMA.data) && count($LIEFERMA.data)>0) %>
              <% foreach from=$LIEFERMA.data.data item=row %>
              <div class="col-sm-3" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title"><%$row.name%></h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Zum Restaurant</a>
                  </div>
                </div>
        <%/foreach%>
  <%else%>
      <div class="alert alert-info">Nix da</div>
  <%/if%>
<%/if%>
</div>
  


<% if ($cmd=='load_res') %>
<div class="row">
  <%*$LIEFERMA.restaurants|echoarr*%>
<% foreach from=$LIEFERMA.restaurants item=row %>
  <div class="col-md-4">
    <h3><%$row.r_name%></h3>
  </div>
<%/foreach%>
</div>




<%/if%>