<section class="bg-light py-5 ">
  <div class="container">
    <div class="row">
      <% foreach from=$flxt.dataset.staticons item=row %>
        <div class="col-6 col-md-3 text-center">
          <i class="bi bi-<%$row.icon_edt.value%> display-3"></i>
          <%if ($row.label_edt.value)%>
          <h3><%$row.label_edt.value%></h3>
          <%/if%>
          <%if ($row.subline_edt.value)%>
          <h4><%$row.subline_edt.value%></h4>
          <%/if%>
        </div>
      <%/foreach%>
    </div>
  </div>
</section>