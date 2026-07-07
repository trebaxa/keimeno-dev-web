const homepage = {
  meta: {
    title: "Keimeno CMS Demo",
    description:
      "Keimeno CMS Demo: a fast, lightweight content platform with Bootstrap 5, reusable templates and a clean editorial workflow.",
    locale: "en"
  },
  navigation: [
    { label: "Home", href: "/", key: "home" },
    { label: "Story", href: "#story" },
    {
      label: "Services",
      href: "#services",
      children: [
        { label: "Research", href: "#services" },
        { label: "Medicine", href: "#services" },
        { label: "Technology", href: "#services" }
      ]
    },
    { label: "Gallery", href: "#gallery" },
    { label: "Resources", href: "#resources" }
  ],
  languages: [
    { label: "DE", href: "#", active: true },
    { label: "EN", href: "#", active: false }
  ],
  carousel: [
    {
      image: "/assets/images/hero-responsive.svg",
      title: "Responsive Design",
      subtitle: "Ready for mobile and built for editorial speed."
    },
    {
      image: "/assets/images/hero-theme.svg",
      title: "Keimeno Frontlight Theme",
      subtitle: "Simple, focused and maintainable."
    },
    {
      image: "/assets/images/hero-bootstrap.svg",
      title: "Bootstrap-Based Workflow",
      subtitle: "Flexible components without CMS lock-in."
    },
    {
      image: "/assets/images/hero-ai.svg",
      title: "AI-Ready Content Platform",
      subtitle: "A modern foundation for structured publishing."
    }
  ],
  intro: {
    title: "Keimeno CMS",
    text:
      "Keimeno CMS is a lightweight, AI-enhanced content management system designed for speed, simplicity and flexibility. It gives editors and developers a clean workspace for structured publishing, landing pages and reusable content blocks.",
    buttonLabel: "Open admin panel",
    buttonHref: "#resources"
  },
  cards: [
    {
      title: "Editorial focus",
      image: "/assets/images/card-editorial.svg",
      text:
        "A clear content structure keeps articles, landing pages and reusable snippets manageable as the project grows."
    },
    {
      title: "Fast frontend",
      image: "/assets/images/card-performance.svg",
      text:
        "Bootstrap utilities, local assets and a direct EJS workflow make iteration fast without hiding the HTML."
    },
    {
      title: "Flexible deployment",
      image: "/assets/images/card-deployment.svg",
      text:
        "The same project can be used as a dynamic local app during development and rendered into static output for delivery."
    }
  ],
  story: {
    title: "A CMS that balances structure, speed and presentation",
    text:
      "The original start page combines marketing content, tabbed services, galleries, counters and content resources. This EJS version keeps the same content logic but moves it into maintainable partials and data-driven sections.",
    buttonLabel: "Read more",
    buttonHref: "#resources",
    image: "/assets/images/story-city.svg"
  },
  services: [
    {
      id: "research",
      title: "Research",
      image: "/assets/images/service-research.svg",
      text:
        "Research projects need structured content, reference pages and reusable layouts. Keimeno helps teams maintain long-form knowledge without clutter."
    },
    {
      id: "medicine",
      title: "Medicine",
      image: "/assets/images/service-medicine.svg",
      text:
        "Medical organizations benefit from clear hierarchies, accessible pages and reliable editorial updates for departments, services and patient information."
    },
    {
      id: "technology",
      title: "Technology",
      image: "/assets/images/service-technology.svg",
      text:
        "Technology teams can combine product pages, documentation and resource entries while keeping the frontend compact and understandable."
    }
  ],
  gallery: [
    { title: "Desert horizon", image: "/assets/images/gallery-1.svg" },
    { title: "Studio portrait", image: "/assets/images/gallery-2.svg" },
    { title: "Modern interface", image: "/assets/images/gallery-3.svg" },
    { title: "Night drive", image: "/assets/images/gallery-4.svg" },
    { title: "Editorial layout", image: "/assets/images/gallery-5.svg" },
    { title: "City atlas", image: "/assets/images/gallery-6.svg" },
    { title: "Product concept", image: "/assets/images/gallery-7.svg" },
    { title: "Campaign visual", image: "/assets/images/gallery-8.svg" }
  ],
  stats: [
    { icon: "fa-user-group", value: "1,000", label: "Customers" },
    { icon: "fa-headset", value: "100%", label: "Reachable" },
    { icon: "fa-bag-shopping", value: "25,000", label: "Sales" },
    { icon: "fa-heart", value: "100", label: "Heartbeat" }
  ],
  breakers: [
    {
      title: "Sitebreaker",
      image: "/assets/images/breaker-1.svg"
    },
    {
      title: "Free your mind",
      image: "/assets/images/breaker-2.svg"
    }
  ],
  progress: {
    title: "Security overview",
    image: "/assets/images/security.svg",
    text:
      "Content systems are a constant target. Keimeno keeps the editing workflow lean while making security, maintenance and operational clarity part of the platform design.",
    bars: [
      { label: "Spam SEO", value: 70, className: "bg-success" },
      { label: "Malware", value: 20, className: "bg-info" },
      { label: "Hacking", value: 50, className: "bg-danger" },
      { label: "Other", value: 80, className: "bg-warning" }
    ]
  },
  resourcesIntro: {
    title: "Keimeno resources",
    text:
      "A resource is a repeatable data model that generates structured entries and detail views. You define it once, then editors can add entries that automatically fit into the site architecture.",
    buttonLabel: "Explore resources",
    buttonHref: "#resources"
  },
  resourceGroups: [
    {
      id: "france",
      label: "France",
      slides: [
        {
          city: "Paris",
          image: "/assets/images/resource-paris.svg",
          caption: "A structured content entry with summary text and related cards.",
          cards: [
            {
              title: "The Eiffel Tower",
              text: "A landmark entry can carry editorial text, images and contextual teaser content."
            },
            {
              title: "The Arc de Triomphe",
              text: "Reusable card layouts make destination pages and city pages feel consistent."
            },
            {
              title: "The Seine",
              text: "Grouped content items work well for guides, travel, directories and editorial collections."
            }
          ]
        },
        {
          city: "Marseille",
          image: "/assets/images/resource-marseille.svg",
          caption: "The same content type can render many entries without rebuilding the page layout.",
          cards: [
            {
              title: "Notre-Dame de la Garde",
              text: "Rich content cards can be fed from one source structure and reused in multiple views."
            },
            {
              title: "Old Port",
              text: "Images, captions and grouped references stay manageable through one consistent schema."
            },
            {
              title: "Mediterranean routes",
              text: "This approach is useful for catalogs, destinations, products and job listings."
            }
          ]
        }
      ]
    },
    {
      id: "germany",
      label: "Germany",
      slides: [
        {
          city: "Frankfurt",
          image: "/assets/images/resource-frankfurt.svg",
          caption: "Business pages, city guides and knowledge hubs can share the same editorial mechanics.",
          cards: [
            {
              title: "Finance district",
              text: "Structured entries help teams keep high-volume content consistent across sections."
            },
            {
              title: "Museums and culture",
              text: "Reference data, teaser text and supporting media can live in the same content model."
            },
            {
              title: "Transport hub",
              text: "Filtered listings and detail pages become much easier once the content is modeled properly."
            }
          ]
        }
      ]
    },
    {
      id: "test",
      label: "Test",
      slides: [
        {
          city: "Prototype",
          image: "/assets/images/resource-prototype.svg",
          caption: "Use a staging resource set to test editorial structures before publishing.",
          cards: [
            {
              title: "Flexible schemas",
              text: "Iterate on field sets and page layouts before they reach live content."
            },
            {
              title: "Fast preview",
              text: "Partial-based templates make design adjustments quicker and less error-prone."
            },
            {
              title: "Reusable content logic",
              text: "The same resource definition can power landing pages, detail pages and widgets."
            }
          ]
        }
      ]
    }
  ]
};

module.exports = homepage;
