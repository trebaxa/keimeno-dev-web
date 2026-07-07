const fs = require("fs-extra");
const path = require("path");

const rootDir = path.join(__dirname, "..");
const distDir = path.join(rootDir, "dist");
const srcJsDir = path.join(rootDir, "src", "js");
const srcAssetsDir = path.join(rootDir, "src", "assets");
const vendorDir = path.join(distDir, "assets", "vendor");

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

async function buildStaticFiles() {
  await fs.ensureDir(path.join(distDir, "js"));
  await fs.ensureDir(path.join(distDir, "assets"));

  await Promise.all([
    fs.copy(srcJsDir, path.join(distDir, "js")),
    fs.copy(srcAssetsDir, path.join(distDir, "assets")),
    ...vendorCopies.map((copyInstruction) => fs.copy(copyInstruction.from, copyInstruction.to))
  ]);
}

buildStaticFiles().catch((error) => {
  console.error("Failed to build static files.", error);
  process.exit(1);
});
