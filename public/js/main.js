document.addEventListener("DOMContentLoaded", () => {
  if (window.gsap) {
    window.gsap.from(".hero__content > *", {
      y: 24,
      opacity: 0,
      duration: 0.8,
      stagger: 0.12,
      ease: "power2.out"
    });
  }

  if (window.jQuery && typeof window.jQuery.fn.slick === "function") {
    window.jQuery(".js-showcase-slider").slick({
      arrows: false,
      autoplay: true,
      autoplaySpeed: 2800,
      dots: true,
      infinite: true,
      slidesToShow: 2,
      slidesToScroll: 1,
      responsive: [
        {
          breakpoint: 992,
          settings: {
            slidesToShow: 1
          }
        }
      ]
    });
  }
});
