# Node.js EJS Bootstrap Starter

This project is a simple Node.js web starter for Visual Studio Code. It uses Express, EJS, Bootstrap 5, SCSS, BrowserSync live reload, GSAP, Font Awesome and Slick Slider.

## Installation

```bash
npm install
```

## Start development

```bash
npm run start
```

This command:

- starts the Express development server
- watches and compiles `src/scss/main.scss` to `public/css/main.css`
- copies JavaScript and assets into `public/`
- copies local vendor files from `node_modules` into `public/assets/vendor/`
- opens the browser automatically with live reload enabled

## Build for production

```bash
npm run build
```

This command:

- removes and recreates the `dist/` folder
- compiles production CSS into `dist/css/main.css`
- copies JavaScript and assets into `dist/`
- copies local vendor files into `dist/assets/vendor/`
- renders EJS pages into static HTML files such as `dist/index.html`

## Folder structure

```text
project-root/
├── package.json
├── server.js
├── scripts/
│   ├── build-static.js
│   ├── clean-public.js
│   ├── prepare-static.js
│   └── render-pages.js
├── src/
│   ├── scss/
│   │   ├── _variables.scss
│   │   └── main.scss
│   ├── js/
│   │   └── main.js
│   └── assets/
│       └── images/
├── views/
│   ├── pages/
│   │   └── index.ejs
│   └── partials/
│       ├── head.ejs
│       ├── header.ejs
│       ├── navigation.ejs
│       └── footer.ejs
├── public/
│   ├── css/
│   ├── js/
│   └── assets/
│       └── images/
└── dist/
```

## EJS usage

- Page templates live in `views/pages/`
- Shared partials live in `views/partials/`
- Includes are used to keep head, header, navigation and footer reusable

## SCSS usage

- Bootstrap variables are overridden in `src/scss/_variables.scss`
- `src/scss/main.scss` imports the variable file before Bootstrap
- Custom project styles are added after the Bootstrap import
