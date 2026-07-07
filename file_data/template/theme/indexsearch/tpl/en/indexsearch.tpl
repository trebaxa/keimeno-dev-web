<div class="container my-4" role="main" aria-labelledby="search-heading">
  <h2 class="mb-3" id="search-heading"><%$REQUEST.FORM.q|sthsc%></h2>

  <div id="indexsearch" role="search" aria-labelledby="search-heading">
    <p class="text-muted small mb-4" role="status" aria-live="polite">
      <%$SE.search_count%> Ergebnisse 
    </p>

    <div class="results" role="list" aria-label="Suchergebnisse">
      <% foreach from=$SE.search_result item=item name=results %>
        <div class="card mb-3 shadow-sm border-0" role="listitem" aria-labelledby="result-title-<%$smarty.foreach.results.iteration%>">
          <div class="card-body">
            <h3 class="card-title mb-2" id="result-title-<%$smarty.foreach.results.iteration%>">
              <a href="<%$item.s_url%>" title="<%$item.s_title%>" class="stretched-link text-decoration-none text-primary" aria-describedby="result-desc-<%$smarty.foreach.results.iteration%>">
                <%$item.s_title%>
              </a>
            </h3>
            <p class="card-text text-body-secondary mb-2" id="result-desc-<%$smarty.foreach.results.iteration%>">
              <%$item.s_short%>
            </p>
            <a href="<%$item.s_url%>" title="Link auf <%$item.s_title|escape:'html'%>" class="text-muted small d-inline-block" aria-label="Link auf <%$item.s_title|escape:'html'%> (URL: <%$item.s_url%>)">
              <i class="bi bi-link-45deg" aria-hidden="true"></i> <%$item.s_url%>
            </a>
          </div>
        </div>
      <%/foreach%>
    </div>
  </div>
</div>