const fs = require("fs-extra");
const path = require("path");

const publicRoot = path.join(__dirname, "..", "public");

async function cleanPublic() {
  await fs.emptyDir(publicRoot);
  await Promise.all([
    fs.ensureDir(path.join(publicRoot, "css")),
    fs.ensureDir(path.join(publicRoot, "js")),
    fs.ensureDir(path.join(publicRoot, "assets", "images"))
  ]);
}

cleanPublic().catch((error) => {
  console.error("Failed to clean public directory.", error);
  process.exit(1);
});
