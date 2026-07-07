const fs = require("fs-extra");
const path = require("path");

const rootDir = path.join(__dirname, "..");
const publicDir = path.join(rootDir, "public");
const cmsTemplateDir = path.join(rootDir, "file_data", "template");

const syncCopies = [
  {
    from: path.join(publicDir, "css"),
    to: path.join(cmsTemplateDir, "css")
  },
  {
    from: path.join(publicDir, "js"),
    to: path.join(cmsTemplateDir, "js")
  },
  {
    from: path.join(publicDir, "assets"),
    to: path.join(cmsTemplateDir, "assets")
  }
];

async function syncCmsTemplate() {
  await fs.ensureDir(cmsTemplateDir);

  for (const copyInstruction of syncCopies) {
    if (await fs.pathExists(copyInstruction.from)) {
      await fs.copy(copyInstruction.from, copyInstruction.to, { overwrite: true });
    }
  }
}

module.exports = syncCmsTemplate;

if (require.main === module) {
  syncCmsTemplate().catch((error) => {
    console.error("Failed to sync CMS template assets.", error);
    process.exit(1);
  });
}
