<form role="form" name="searchform" action="<% $INDEXSEARCH.searchformurl %>" method="POST" class="d-flex align-items-center gap-2 my-3">
  <input type="hidden" name="cmd" value="indexsearch">
    <% assign var=sv value="" %>
  <% if ($REQUEST.FORM.q!="") %>
    <% assign var=sv value=$REQUEST.FORM.q|sthsc %>
  <%/if%>

  <div class="input-group">
    <input 
      type="text" 
      id="fe-searcher" 
      name="FORM[q]" 
      value="<% $sv %>" 
      autocomplete="off"
      class="form-control"
      placeholder="Suchbegriff"
      >
    <button type="submit" class="btn btn-primary">
      <i class="bi bi-search"></i>
    </button>
  </div>
</form>