const fs = require("fs-extra");
const path = require("path");

const rootDir = path.join(__dirname, "..");
const publicDir = path.join(rootDir, "public");
const srcJsDir = path.join(rootDir, "src", "js");
const srcAssetsDir = path.join(rootDir, "src", "assets");
const vendorDir = path.join(publicDir, "assets", "vendor");

const vendorCopies = [
  {
    from: path.join(rootDir, "node_modules", "bootstrap", "dist", "js", "bootstrap.bundle.min.js"),
    to: path.join(vendorDir, "bootstrap", "js", "bootstrap.bundle.min.js")
  },
  {
    from: path.join(rootDir, "node_modules", "jquery", "dist", "jquery.min.js"),
    to: path.join(vendorDir, "jquery", "jquery.min.js")
  },
  {
    from: path.join(rootDir, "node_modules", "gsap", "dist", "gsap.min.js"),
    to: path.join(vendorDir, "gsap", "gsap.min.js")
  },
  {
    from: path.join(rootDir, "node_modules", "slick-carousel", "slick", "slick.min.js"),
    to: path.join(vendorDir, "slick", "slick.min.js")
  },
  {
    from: path.join(rootDir, "node_modules", "slick-carousel", "slick", "slick.css"),
    to: path.join(vendorDir, "slick", "slick.css")
  },
  {
    from: path.join(rootDir, "node_modules", "@fancyapps", "ui", "dist", "fancybox", "fancybox.css"),
    to: path.join(vendorDir, "fancybox", "fancybox.css")
  },
  {
    from: path.join(rootDir, "node_modules", "@fancyapps", "ui", "dist", "fancybox", "fancybox.umd.js"),
    to: path.join(vendorDir, "fancybox", "fancybox.umd.js")
  },
  {
    from: path.join(rootDir, "node_modules", "@fortawesome", "fontawesome-free", "css", "all.min.css"),
    to: path.join(vendorDir, "fontawesome", "css", "all.min.css")
  },
  {
    from: path.join(rootDir, "node_modules", "@fortawesome", "fontawesome-free", "webfonts"),
    to: path.join(vendorDir, "fontawesome", "webfonts")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "raleway", "files", "raleway-latin-400-normal.woff2"),
    to: path.join(vendorDir, "fonts", "raleway", "raleway-latin-400-normal.woff2")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "raleway", "files", "raleway-latin-400-normal.woff"),
    to: path.join(vendorDir, "fonts", "raleway", "raleway-latin-400-normal.woff")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "raleway", "files", "raleway-latin-ext-400-normal.woff2"),
    to: path.join(vendorDir, "fonts", "raleway", "raleway-latin-ext-400-normal.woff2")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "raleway", "files", "raleway-latin-ext-400-normal.woff"),
    to: path.join(vendorDir, "fonts", "raleway", "raleway-latin-ext-400-normal.woff")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "raleway", "files", "raleway-latin-600-normal.woff2"),
    to: path.join(vendorDir, "fonts", "raleway", "raleway-latin-600-normal.woff2")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "raleway", "files", "raleway-latin-600-normal.woff"),
    to: path.join(vendorDir, "fonts", "raleway", "raleway-latin-600-normal.woff")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "raleway", "files", "raleway-latin-ext-600-normal.woff2"),
    to: path.join(vendorDir, "fonts", "raleway", "raleway-latin-ext-600-normal.woff2")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "raleway", "files", "raleway-latin-ext-600-normal.woff"),
    to: path.join(vendorDir, "fonts", "raleway", "raleway-latin-ext-600-normal.woff")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "roboto-condensed", "files", "roboto-condensed-latin-400-normal.woff2"),
    to: path.join(vendorDir, "fonts", "roboto-condensed", "roboto-condensed-latin-400-normal.woff2")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "roboto-condensed", "files", "roboto-condensed-latin-400-normal.woff"),
    to: path.join(vendorDir, "fonts", "roboto-condensed", "roboto-condensed-latin-400-normal.woff")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "roboto-condensed", "files", "roboto-condensed-latin-ext-400-normal.woff2"),
    to: path.join(vendorDir, "fonts", "roboto-condensed", "roboto-condensed-latin-ext-400-normal.woff2")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "roboto-condensed", "files", "roboto-condensed-latin-ext-400-normal.woff"),
    to: path.join(vendorDir, "fonts", "roboto-condensed", "roboto-condensed-latin-ext-400-normal.woff")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "roboto-condensed", "files", "roboto-condensed-latin-700-normal.woff2"),
    to: path.join(vendorDir, "fonts", "roboto-condensed", "roboto-condensed-latin-700-normal.woff2")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "roboto-condensed", "files", "roboto-condensed-latin-700-normal.woff"),
    to: path.join(vendorDir, "fonts", "roboto-condensed", "roboto-condensed-latin-700-normal.woff")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "roboto-condensed", "files", "roboto-condensed-latin-ext-700-normal.woff2"),
    to: path.join(vendorDir, "fonts", "roboto-condensed", "roboto-condensed-latin-ext-700-normal.woff2")
  },
  {
    from: path.join(rootDir, "node_modules", "@fontsource", "roboto-condensed", "files", "roboto-condensed-latin-ext-700-normal.woff"),
    to: path.join(vendorDir, "fonts", "roboto-condensed", "roboto-condensed-latin-ext-700-normal.woff")
  }
];

async function prepareStaticFiles() {
  await fs.ensureDir(path.join(publicDir, "js"));
  await fs.ensureDir(path.join(publicDir, "assets"));

  await Promise.all([
    fs.copy(srcJsDir, path.join(publicDir, "js")),
    fs.copy(srcAssetsDir, path.join(publicDir, "assets")),
    ...vendorCopies.map((copyInstruction) => fs.copy(copyInstruction.from, copyInstruction.to))
  ]);
}

prepareStaticFiles().catch((error) => {
  console.error("Failed to prepare static files.", error);
  process.exit(1);
});
