<section>
  <div class="container">
  <h2>Produkte</h2>
  <%foreach from=$elopage.data item=row %>
    <div class="row">
      <div class="col-md-12">
        <%$row.name%>
        <a href="<%$row.url_to_pay%>" target="_blank">bestellen</a>
        
      </div>
    </div>
  <%/foreach%>
  </div>
</section>