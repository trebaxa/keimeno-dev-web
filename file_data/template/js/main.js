document.addEventListener("DOMContentLoaded", () => {
  const animateNumber = (element) => {
    if (!window.gsap || !element) {
      return;
    }

    const targetText = element.textContent.trim();
    const numericValue = Number(targetText.replace(/[^0-9.]/g, ""));

    if (!numericValue) {
      return;
    }

    const hasPercent = targetText.includes("%");
    const hasComma = targetText.includes(",");
    const counter = { value: 0 };

    window.gsap.to(counter, {
      value: numericValue,
      duration: 1.6,
      ease: "power2.out",
      onUpdate: () => {
        const roundedValue = Math.round(counter.value);
        element.textContent = hasPercent
          ? `${roundedValue}%`
          : hasComma
            ? roundedValue.toLocaleString("en-US")
            : String(roundedValue);
      }
    });
  };

  const createObserver = (selector, animation) => {
    if (!window.gsap) {
      return;
    }

    const elements = document.querySelectorAll(selector);

    if (!elements.length) {
      return;
    }

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) {
            return;
          }

          animation(entry.target);
          observer.unobserve(entry.target);
        });
      },
      {
        threshold: 0.2,
        rootMargin: "0px 0px -8% 0px"
      }
    );

    elements.forEach((element) => observer.observe(element));
  };

  const animateHeroSlide = () => {
    if (!window.gsap) {
      return;
    }

    const activeCaptionItems = document.querySelectorAll(".hero-carousel .carousel-item.active .carousel-caption > *");

    if (!activeCaptionItems.length) {
      return;
    }

    window.gsap.fromTo(
      activeCaptionItems,
      {
        y: 28,
        opacity: 0
      },
      {
        y: 0,
        opacity: 1,
        duration: 0.9,
        stagger: 0.14,
        ease: "power2.out",
        clearProps: "transform"
      }
    );
  };

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
    animateHeroSlide();

    createObserver(".section-panel .container, .section-soft .container, .section-space .container", (element) => {
      window.gsap.fromTo(
        element,
        {
          y: 34,
          opacity: 0
        },
        {
          y: 0,
          opacity: 1,
          duration: 0.9,
          ease: "power2.out",
          clearProps: "transform"
        }
      );
    });

    createObserver(".content-card, .resource-card", (element) => {
      window.gsap.fromTo(
        element,
        {
          y: 36,
          opacity: 0,
          scale: 0.98
        },
        {
          y: 0,
          opacity: 1,
          scale: 1,
          duration: 0.75,
          ease: "power2.out",
          clearProps: "transform"
        }
      );
    });

    createObserver(".masonry-gallery__item", (element) => {
      window.gsap.fromTo(
        element,
        {
          y: 42,
          opacity: 0
        },
        {
          y: 0,
          opacity: 1,
          duration: 0.8,
          ease: "power2.out",
          clearProps: "transform"
        }
      );
    });

    createObserver(".stats-strip", (element) => {
      const icons = element.querySelectorAll(".stats-icon");
      const values = element.querySelectorAll("h3");

      window.gsap.fromTo(
        icons,
        {
          y: 18,
          opacity: 0,
          scale: 0.88
        },
        {
          y: 0,
          opacity: 1,
          scale: 1,
          duration: 0.6,
          stagger: 0.12,
          ease: "back.out(1.6)"
        }
      );

      values.forEach((value) => animateNumber(value));
    });

    createObserver(".breaker-section", (element) => {
      const title = element.querySelector(".breaker-section__title");

      if (title) {
        window.gsap.fromTo(
          title,
          {
            y: 32,
            opacity: 0
          },
          {
            y: 0,
            opacity: 1,
            duration: 0.9,
            ease: "power2.out",
            clearProps: "transform"
          }
        );
      }
    });

    createObserver(".progress-stack .progress", (element) => {
      const bar = element.querySelector(".progress-bar");

      if (!bar) {
        return;
      }

      const finalWidth = bar.style.width;
      bar.style.width = "0%";

      window.gsap.to(bar, {
        width: finalWidth,
        duration: 1.1,
        ease: "power2.out"
      });
    });
  }

  const breakerSections = document.querySelectorAll(".breaker-section");

  if (breakerSections.length) {
    let ticking = false;

    const updateBreakerParallax = () => {
      const viewportHeight = window.innerHeight || document.documentElement.clientHeight;

      breakerSections.forEach((section) => {
        const rect = section.getBoundingClientRect();
        const totalTravel = viewportHeight + rect.height;
        const progress = totalTravel ? (viewportHeight - rect.top) / totalTravel : 0.5;
        const clampedProgress = Math.min(Math.max(progress, 0), 1);
        const y = (clampedProgress - 0.5) * 72;

        section.style.setProperty("--breaker-parallax-y", `${y.toFixed(2)}px`);
      });

      ticking = false;
    };

    const requestBreakerParallaxUpdate = () => {
      if (ticking) {
        return;
      }

      ticking = true;
      window.requestAnimationFrame(updateBreakerParallax);
    };

    updateBreakerParallax();
    window.addEventListener("scroll", requestBreakerParallaxUpdate, { passive: true });
    window.addEventListener("resize", requestBreakerParallaxUpdate);
  }

  document.querySelectorAll(".js-file-input").forEach((input) => {
    input.addEventListener("change", () => {
      const output = input.closest(".upload-field")?.querySelector(".selected-file-list");

      if (!output) {
        return;
      }

      const fileNames = Array.from(input.files || []).map((file) => file.name);
      output.textContent = fileNames.length ? fileNames.join(", ") : "";
    });
  });

  document.querySelectorAll(".contact-form").forEach((form) => {
    const checkboxes = form.querySelectorAll(".js-disclaimer-check");
    const submitButton = form.querySelector("#js-btn-send");

    if (!checkboxes.length || !submitButton) {
      return;
    }

    const updateSubmitState = () => {
      const allChecked = Array.from(checkboxes).every((checkbox) => checkbox.checked);
      submitButton.disabled = !allChecked;
      submitButton.setAttribute("aria-disabled", String(!allChecked));
    };

    checkboxes.forEach((checkbox) => checkbox.addEventListener("change", updateSubmitState));
    updateSubmitState();
  });

  const heroCarouselElement = document.getElementById("homepageCarousel");

  if (heroCarouselElement) {
    heroCarouselElement.addEventListener("slid.bs.carousel", animateHeroSlide);
  }

  if (window.jQuery && typeof window.jQuery.fn.slick === "function") {
    const resourceGroupSlider = window.jQuery(".js-resource-groups-slider");
    const resourceSliders = window.jQuery(".js-resource-slider");
    const setResourceSliderHeight = () => {
      const slides = document.querySelectorAll(".resource-slide");

      if (!slides.length) {
        return;
      }

      const maxHeight = Math.max(
        ...Array.from(slides).map((slide) => {
          const previousMinHeight = slide.style.minHeight;
          slide.style.minHeight = "";
          const height = slide.getBoundingClientRect().height;
          slide.style.minHeight = previousMinHeight;
          return height;
        })
      );

      document.documentElement.style.setProperty("--resource-slide-min-height", `${Math.ceil(maxHeight)}px`);
    };

    if (resourceGroupSlider.length && !resourceGroupSlider.hasClass("slick-initialized")) {
      resourceGroupSlider.slick({
        arrows: false,
        autoplay: false,
        dots: false,
        infinite: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        adaptiveHeight: false,
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
          adaptiveHeight: false
        });
      }
    });

    setResourceSliderHeight();

    window.jQuery("[data-resource-slide]").on("click", (event) => {
      const button = window.jQuery(event.currentTarget);
      const targetIndex = Number(button.attr("data-resource-slide"));

      window.jQuery("[data-resource-slide]").removeClass("active").attr("aria-selected", "false");
      button.addClass("active").attr("aria-selected", "true");

      if (resourceGroupSlider.length) {
        resourceGroupSlider.slick("slickGoTo", targetIndex);
        setResourceSliderHeight();
      }
    });

    if (resourceGroupSlider.length) {
      resourceGroupSlider.on("afterChange", (event, slick, currentSlide) => {
        window.jQuery("[data-resource-slide]").removeClass("active").attr("aria-selected", "false");
        window.jQuery(`[data-resource-slide="${currentSlide}"]`).addClass("active").attr("aria-selected", "true");
        resourceSliders.each((index, element) => {
          window.jQuery(element).slick("setPosition");
        });
        setResourceSliderHeight();
      });
    }

    resourceSliders.each((index, element) => {
      const slider = window.jQuery(element);

      slider.on("afterChange", () => {
        slider.slick("setPosition");
        setResourceSliderHeight();
      });
    });

    window.jQuery(window).on("resize", () => {
      setResourceSliderHeight();
      resourceSliders.each((index, element) => {
        window.jQuery(element).slick("setPosition");
      });
      if (resourceGroupSlider.length) {
        resourceGroupSlider.slick("setPosition");
      }
    });
  }
});
