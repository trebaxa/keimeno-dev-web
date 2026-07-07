<section class="my-5">
  <div class="container">
    <div class="cover position-relative">
      <div class="image">
          <img src="<%$resrc.var.fv_themenbild%>" class="img-fluid w-100" alt="<%$resrc.var.fv_titel|sthsc%>" loading="lazy">
      </div>
      <div class="headline position-absolute fixed-bottom">
        <div class="row">
          <div class="col-10 offset-1">
            <h1 class="display-4 text-white mb-5">
            <%$resrc.var.fv_titel%>
            </h1>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="pb-6">
  <div class="container">
    <div class="row">
      <div class="col-12 col-lg-10 mx-auto">
        <div class="text">
          <div class="d-block">
            <h3 class="subline"><%$resrc.var.fv_abteilung%></h3>
          </div>
          <%$resrc.var.fv_beschreibung%>
        </div>
      </div>
    </div>
  </div>
</section>
<script type="application/ld+json">
  {
  "@context": "https://schema.org/",
  "@type": "JobPosting",
  "title": "<%$resrc.var.fv_titel|sthsc%>",
  "description": "<%$resrc.var.fv_beschreibung|sthsc%>",
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
  "datePosted": "<%$resrc.var.fv_gltigab|strtotime|date_format:"%Y-%m-%d"%>",
  "validThrough": "<%$resrc.var.fv_gltigbis|strtotime|date_format:"%Y-%m-%d"%>",
  "employmentType": "<%$resrc.var.fv_anstellungzeit%>",
  "jobBenefits": "<%$resrc.var.fv_benefits|sthsc%>",
  "salaryCurrency": "EUR",
  "baseSalary": {
    "@type": "MonetaryAmount",
    "currency": "EUR",
    "value": {
      "@type": "QuantitativeValue",
      "value": <%$resrc.var.fv_jahreseinkommen|intval%>,
      "unitText": "Jahr"
    }
  },
  "salary": {
    "@type": "MonetaryAmount",
    "value": {
      "@type": "QuantitativeValue",
      "value": <%$resrc.var.fv_monatsseinkommen|intval%>,
      "unitText": "EUR"
    }
  }
}
</script>