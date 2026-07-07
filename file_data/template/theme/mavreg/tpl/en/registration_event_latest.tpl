<section class="py-8" role="region" aria-hidden="true">
  <div class="container">
    <h2><%$plugopt.title|nl2br%></h2>
   <% if (count($MAVREG.table)>0) %>
     <div class="row">
     <% foreach from=$MAVREG.table name="loop" item=row %>
     <div class="col-md-6">
       <div class="row">
         <div class="col-md-4"><img alt="<%$row.e_name|sthsc%>" class="img-fluid" src="<%$row.thumb%>"></div>
         <div class="col-md-8"><h3><%$row.e_name%></h3></div>
         <div class="col-md-6">on <%$row.e_date_ger%>: <%$row.e_from%>&ndash;<%$row.e_to%></div>
         <div class="col-md-6 text-right"><a class="btn btn-primary" alt="book now <%$row.e_name|sthsc%>" href="<%$row.link%>">book now</a></div>
       </div>
     </div>
     <%/foreach%>
     </div>
   <%/if%>
  </div>
</section>  