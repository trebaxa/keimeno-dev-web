<section class="stats-strip py-5">
  <div class="container">
    <div class="row">
      <% foreach from=$flxt.dataset.staticons item=row %>
        <div class="col-6 col-md-3 text-center mb-4 mb-md-0">
          <span class="stats-icon">
            <i class="fa-solid fa-<%$row.icon_edt.value|default:'star'%>" aria-hidden="true"></i>
          </span>
          <%if ($row.label_edt.value)%>
          <h3 class="fw-bold"><%$row.label_edt.value%></h3>
          <%/if%>
          <%if ($row.subline_edt.value)%>
          <p class="mb-0 text-secondary"><%$row.subline_edt.value%></p>
          <%/if%>
        </div>
      <%/foreach%>
    </div>
  </div>
</section>
