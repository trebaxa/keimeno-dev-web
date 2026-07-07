<%* Build Hero (SEO-optimiert) *%>
<% include file="theme_templates_project-hero.tpl" 
  title=$resrc.var.fv_titel
  title_type="h1"
  img_default=$resrc.var.fv_themenbild
  img_default_srcset=$resrc.var.fv_themenbild_srcset
  img_mobile_exists=$resrc.var.fv_themenbildmobile_exists
  img_mobile=$resrc.var.fv_themenbildmobilee_org
  img_mobile_srcset=$resrc.var.fv_themenbildmobile_srcset
  img_alt=$resrc.var.fv_themenbild_alt
%>
<section id="job" class="py-8" itemscope itemtype="https://schema.org/JobPosting">
  <div class="container">
    <div class="row">
      <div class="col-12 col-lg-8 mx-auto">
        <article class="text" itemprop="description">
          <header class="mb-3">
            <%if ($resrc.var.fv_gltigab)%>
              <h2 class="subline">
                Stellenangebot gültig ab: 
                <time datetime="<%$resrc.var.fv_gltigab|strtotime|date_format:"%Y-%m-%d"%>">
                  <%$resrc.var.fv_gltigab%>
                </time>
              </h2>
            <%/if%>
          </header>
          <%* Hauptbeschreibung der Stelle (bereits HTML aus CMS) *%>
          <%$resrc.var.fv_beschreibung%>
        </article>
      </div>
    </div>
    <div class="row mt-4">
      <div class="col-12 col-lg-8 mx-auto">
        <div class="buttons">
          <a href="{URL_TPL_100277}#jobs"
             class="btn btn-primary"
             title="Zurück zur Übersicht aller Stellenangebote">
            Zurück zur Übersicht der Stellenangebote
          </a>
        </div>
      </div>
    </div>
  </div>
  <%* Strukturierte Daten ergänzend als JSON-LD *%>
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
        "addressCountry": "DE"
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
        "unitText": "YEAR"
      }
    },
    "estimatedSalary": {
      "@type": "MonetaryAmount",
      "currency": "EUR",
      "value": {
        "@type": "QuantitativeValue",
        "value": <%$resrc.var.fv_monatsseinkommen|intval%>,
        "unitText": "MONTH"
      }
    }
  }
  </script>
</section>