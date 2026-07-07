<% if ( isset($googlereviews.reviews) && is_array($googlereviews.reviews) && count($googlereviews.reviews)>0) %>
<%*$googlereviews.reviews|echoarr*%>
<section>
  <h2>Google Bewertungen</h2>
  <div class="row">
  <% foreach from=$googlereviews.reviews item=row %>
    <div class="col-md-3 text-center">
        <img src="<%$row.profile_photo_url%>" alt=""><br>
       <% $row.author_name %>
         <br>
         Verfasst am <% $row.date_ger %><br>
         <p><% $row.text%></p>
         <% for $foo=1 to $row.rating%>
           <span class="glyphicon glyphicon-star"></span> 
         <%/for%>
         <% for $foo=1 to $row.rating_diff%>
           <span class="glyphicon glyphicon-star-empty"></span> 
         <%/for%>
    </div>
  <% /foreach %>
  </div>
</section>

<% /if %>