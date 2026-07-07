const ejs = require("ejs");
const fs = require("fs-extra");
const path = require("path");
const homepage = require("../data/homepage");

const rootDir = path.join(__dirname, "..");
const viewsDir = path.join(rootDir, "views");
const pagesDir = path.join(viewsDir, "pages");
const distDir = path.join(rootDir, "dist");

const pages = [
  {
    template: "index.ejs",
    output: "index.html",
    data: {
      pageTitle: homepage.meta.title,
      currentPage: "home",
      homepage
    }
  }
];

async function renderPage(page) {
  const templatePath = path.join(pagesDir, page.template);
  const outputPath = path.join(distDir, page.output);
  const html = await ejs.renderFile(templatePath, page.data, {
    root: viewsDir,
    filename: templatePath
  });

  await fs.outputFile(outputPath, html);
}

async function renderPages() {
  await Promise.all(pages.map(renderPage));
}

renderPages().catch((error) => {
  console.error("Failed to render EJS pages.", error);
  process.exit(1);
});
