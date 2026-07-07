<section class="py-6">
  <div class="container">
    <%*$event_latest_items|echoarr*%>
    <%*$calendar_plugopt|echoarr*%>
    <div class="row">
      <div class="col-12 mx-auto">
        <h2 class="headline text-center pb-3">
          <%$calendar_plugopt.title%>
        </h2>
      </div>
    </div>
    <div class="row">
      <% foreach from=$event_latest_items item=row name=mt %>
      <div class="col-12 col-md-6 col-lg-4 mb-4 d-flex">
        <!-- Added d-flex to make all columns flex containers -->
        <div class="newscard highlight d-flex flex-column h-100">
          <!-- Added d-flex, flex-column, and h-100 to make all newscard boxes same height -->
          <div class="header">
            <a href="<%$row.detail_link%>" title="<% $row.title|sthsc %>">
              <div class="image">
                <img src="<%$row.thumb%>" class="img-fluid" />
              </div>
              <div class="info">
                <span class="date">
                  <% $row.date %>
                </span>
                <span class="place">
                  <% $row.place %>
                </span>
              </div>
            </a>
          </div>
          <div class="body flex-grow-1">
            <!-- Added flex-grow-1 to make body fill available space -->
            <div class="headline">
              <% $row.title %>
            </div>
            <div class="content">
              <p>
                <% if ($row.introduction!="") %><%$row.introduction%><%else%><% $row.content|st|truncate:360 %><%/if%>
              </p>
            </div>
          </div>
          <div class="footer mt-auto">
            <!-- Added mt-auto to push footer to the bottom -->
            <a href="<%$row.detail_link%>" title="<% $row.title|sthsc %>" class="btn btn-primary">
              <i class="bi bi-arrow-right"></i> mehr
            </a>
          </div>
        </div>
      </div>
      <% /foreach%>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="buttons">
          <a href="#" class="btn btn-secondary mx-auto"><i class="bi bi-calendar3"></i> Alle Termine</a>
        </div>
      </div>
    </div>
  </div>
</section>
