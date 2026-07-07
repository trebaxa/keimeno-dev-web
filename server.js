const express = require("express");
const path = require("path");

const app = express();
const port = process.env.PORT || 3000;

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

app.use(express.static(path.join(__dirname, "public")));

app.get("/", (request, response) => {
  response.render("pages/index", {
    pageTitle: "Keimeno Dev Web",
    currentPage: "home"
  });
});

app.listen(port, () => {
  console.log(`Development server running at http://localhost:${port}`);
});
