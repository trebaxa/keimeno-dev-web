document.addEventListener("DOMContentLoaded", () => {
  if (window.gsap) {
    window.gsap.from(".hero-carousel .active .carousel-caption > *", {
      y: 28,
      opacity: 0,
      duration: 0.9,
      stagger: 0.14,
      ease: "power2.out"
    });
  }

  if (window.jQuery && typeof window.jQuery.fn.slick === "function") {
    const resourceSliders = window.jQuery(".js-resource-slider");

    resourceSliders.each((index, element) => {
      const slider = window.jQuery(element);

      if (!slider.hasClass("slick-initialized")) {
        slider.slick({
          arrows: false,
          autoplay: false,
          dots: true,
          infinite: true,
          slidesToShow: 1,
          slidesToScroll: 1,
          adaptiveHeight: true
        });
      }
    });

    window.jQuery('button[data-bs-toggle="tab"]').on("shown.bs.tab", () => {
      resourceSliders.each((index, element) => {
        window.jQuery(element).slick("setPosition");
      });
    });
  }
});
