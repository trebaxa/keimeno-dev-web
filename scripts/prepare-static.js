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
    from: path.join(rootDir, "node_modules", "@fortawesome", "fontawesome-free", "css", "all.min.css"),
    to: path.join(vendorDir, "fontawesome", "css", "all.min.css")
  },
  {
    from: path.join(rootDir, "node_modules", "@fortawesome", "fontawesome-free", "webfonts"),
    to: path.join(vendorDir, "fontawesome", "webfonts")
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
