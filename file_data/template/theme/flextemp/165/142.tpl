<%if ($flxt.var.fv_jobs|has_values)%>
<section class="pb-0 pt-8 py-lg-10" <%if ($flxt.var.fv_id_5)%>id="<%$flxt.var.fv_id_5%>"<%/if%>>
  <div class="container">
    <%if ($flxt.var.fv_titel_8) || ($flxt.var.fv_introtext)%>
    <div class="row">
      <div class="col-12 col-lg-8 mx-auto">
        <%if ($flxt.var.fv_titel_8)%>
        <h2 class="headline"><%$flxt.var.fv_titel_8|nl2br%></h2>
        <%/if%>
        <%if ($flxt.var.fv_introtext)%>
        <div class="content">
          <%$flxt.var.fv_introtext%>
        </div>
        <%/if%>
      </div>
    </div>
    <%/if%>
    <% foreach from=$flxt.var.fv_jobs item=row %>
    <div class="row justify-content-center pb-6 pb-lg-">
      <div class="col-12 col-lg-5 px-lg-6">
        <div class="content"></div>
        <div class="image-stack top left">
          <div class="images">
            <a href="<%$row.resrc_link%>">
            <div class="image-1" >
              <img src="<%$row.fv_thumbnail%>" class="img-fluid lazyloaded" alt="" loading="lazy">
            </div>
            </a>
          </div>
        </div>
        <div class="image-stack">
          <div class="images"></div>
        </div>
      </div>
      <div class="col-12 col-lg-5 px-lg-6">
        <h4 class="headline marked ">
          <span><%$row.fv_titel|nl2br%></span>
        </h4>
        <div class="content">
          <%$row.fv_beschreibung|st|truncate:250%>
        </div>
        <div class="buttons">
          <a href="<%$row.resrc_link%>" class="btn btn-primary mt-4">
            Mehr 
          </a>
        </div>
      </div>
    </div>
  <%/foreach%>
  </div>
</section>
<%/if%>
<% foreach from=$flxt.var.fv_jobs item=row %>
<script type="application/ld+json">
  {
  "@context": "https://schema.org/",
  "@type": "JobPosting",
  "title": "<%$row.fv_titel|sthsc%>",
  "description": "<%$row.fv_beschreibung|sthsc%>",
  "hiringOrganization": {
    "@type": "Organization",
    "name": "<% $gbl_config.adr_firma %>",
    "sameAs": "<%$cms_url%>",
    "logo": "<%$cms_url%>/file_server/logo.jpg"
  },
  "jobLocation": {
    "@type": "Place",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "<% $gbl_config.adr_street %>",
      "addressLocality": "<% $gbl_config.adr_town %>",
      "addressRegion": "<% $gbl_config.adr_region %>",
      "postalCode": "<% $gbl_config.adr_plz %>",
      "addressCountry": "Deutschland"
    }
  },
  "datePosted": "<%$row.fv_gltigab|strtotime|date_format:"%Y-%m-%d"%>",
  "validThrough": "<%$row.fv_gltigbis|strtotime|date_format:"%Y-%m-%d"%>",
  "employmentType": "<%$row.fv_anstellungzeit%>",
  "jobBenefits": "<%$row.fv_benefits|sthsc%>",
  "salaryCurrency": "EUR",
  "baseSalary": {
    "@type": "MonetaryAmount",
    "currency": "EUR",
    "value": {
      "@type": "QuantitativeValue",
      "value": <%$row.fv_jahreseinkommen|intval%>,
      "unitText": "Jahr"
    }
  },
  "salary": {
    "@type": "MonetaryAmount",
    "value": {
      "@type": "QuantitativeValue",
      "value": <%$row.fv_monatsseinkommen|intval%>,
      "unitText": "EUR"
    }
  }
}
</script>
 <%/foreach%>