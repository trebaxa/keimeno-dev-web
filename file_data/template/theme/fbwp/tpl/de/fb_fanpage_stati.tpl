  <%*$FBWP.fanpage_status.data|echoarr*%>
  <section>
    <div class="container">
      <h2><%$plugopt.title%></h2>
      <p class="lead"><%$plugopt.lead|nl2br%></p>


      <% foreach from=$FBWP.fanpage_status.data  item=row name=redifbloop %>
      <div class="card my-3">
        <div class="card-body">
          <h5 class="card-title c-blue d-flex justify-content-start justify-content-md-between">
            <!--<i class="icofont-news"></i>--><small><%$row.ptime|date_format:"%d.%m.%Y"%></small>
          </h5>
          <% if ($smarty.foreach.redifbloop.iteration is div by 2) %>
          <div class="row">
            <div class="col-12 col-md-4">
              <img class="img-fluid" src="<%$row.thumb%>" alt="<%$row.message|st|truncate:30|hsc%>">
            </div>
            <div class="col-12 col-md-7 offset-sm-1">
              <p class="card-text mt-3">
                <%$row.message|link_urls|nl2br%>
              </p>
              <%*$row|echoarr*%>
            </div>
          </div>
          <%else%>
          <div class="row">
            <div class="col-12 col-md-8">
              <p class="card-text mt-3">
                <%$row.message|link_urls|nl2br%>
              </p>
              <%*$row|echoarr*%>
            </div>
            <div class="col-12 col-md-3 offset-sm-1">
              <img class="img-fluid" style="width:100%" src="<%$row.thumb%>" alt="<%$row.message|st|truncate:30|hsc%>">
            </div>
          </div>
          <%/if%>
        </div>
      </div>
      <%/foreach%>
      <% if ($FBWP.fanpage_status.paging.next_page!="") %>
      <div class="col-12 js-fb-next-cont">
        <p class="text-center"><button type="button" data-target="<%$FBWP.fanpage_status.paging.hash%>" data-href="<%$FBWP.fanpage_status.paging.next_page%>" class="btn btn-red btn-lg my-3 js-fb-next">mehr ...</button></p>
      </div>
      <%/if%>
      <div id="<%$FBWP.fanpage_status.paging.hash%>"></div>
      <% if ($GET.axcall==1) %><script>
  fbwp.init_fbwp_paging();
      </script><%/if%>
    </div>
  </section>