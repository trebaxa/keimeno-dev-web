document.addEventListener("DOMContentLoaded", () => {
  if (window.Fancybox) {
    window.Fancybox.bind('[data-fancybox="homepage-gallery"]', {
      animated: true,
      showClass: "fancybox-fadeIn",
      hideClass: "fancybox-fadeOut",
      dragToClose: true,
      Toolbar: {
        display: {
          left: [],
          middle: ["counter"],
          right: ["zoomIn", "zoomOut", "toggle1to1", "slideshow", "fullscreen", "close"]
        }
      }
    });
  }

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
    const resourceGroupSlider = window.jQuery(".js-resource-groups-slider");
    const resourceSliders = window.jQuery(".js-resource-slider");

    if (resourceGroupSlider.length && !resourceGroupSlider.hasClass("slick-initialized")) {
      resourceGroupSlider.slick({
        arrows: false,
        autoplay: false,
        dots: false,
        infinite: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        adaptiveHeight: true,
        swipe: true
      });
    }

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

    window.jQuery("[data-resource-slide]").on("click", (event) => {
      const button = window.jQuery(event.currentTarget);
      const targetIndex = Number(button.attr("data-resource-slide"));

      window.jQuery("[data-resource-slide]").removeClass("active").attr("aria-selected", "false");
      button.addClass("active").attr("aria-selected", "true");

      if (resourceGroupSlider.length) {
        resourceGroupSlider.slick("slickGoTo", targetIndex);
      }
    });

    if (resourceGroupSlider.length) {
      resourceGroupSlider.on("afterChange", (event, slick, currentSlide) => {
        window.jQuery("[data-resource-slide]").removeClass("active").attr("aria-selected", "false");
        window.jQuery(`[data-resource-slide="${currentSlide}"]`).addClass("active").attr("aria-selected", "true");
        resourceSliders.each((index, element) => {
          window.jQuery(element).slick("setPosition");
        });
      });
    }

    resourceSliders.each((index, element) => {
      const slider = window.jQuery(element);

      slider.on("afterChange", () => {
        slider.slick("setPosition");
      });
    });

    window.jQuery(window).on("resize", () => {
      resourceSliders.each((index, element) => {
        window.jQuery(element).slick("setPosition");
      });
      if (resourceGroupSlider.length) {
        resourceGroupSlider.slick("setPosition");
      }
    });
  }
});
