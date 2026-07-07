<section class="my-5 py-5">
  <div class="container">
    <%if ($flxt.var.fv_titel_2)%>
    <div class="row">
      <div class="col-12">
        <h2><%$flxt.var.fv_titel_2%></h2>
      </div>
    </div>
    <%/if%>
    <%$chart_data = []%>
    <% foreach from=$flxt.dataset.chartsjsdiagramm item=row%>
      <%$chart_data[$row@index]['year'] = $row.wert_edt.valu%>
      <%$chart_data[$row@index]['value'] = $row.datum_edt.value%>
    <%/foreach%>
    <div class="row">
      <div class="col-12 col-lg-6">
        <canvas data-event="chart" data-content='<%$chart_data|@json_encode%>'>
		    </canvas>
      </div>
      <div class="col-12 col-lg-6">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>Datum</th>
              <th>Wert</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <td colspan="2" class="bigger text-center">...</td>
            </tr>
          </tfoot>
          <tbody>
         <% foreach from=$flxt.dataset.chartsjsdiagramm item=row%>
          <% if ($row@index <6) %>
          <tr>
            <td><%$row.datum_edt.value%></td>
            <td><%$row.wert_edt.value%>></td>
          </tr>
          <%/if%>
          <%/foreach%>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</section>