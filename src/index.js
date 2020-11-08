import express from 'express';
import bodyParser from 'body-parser';
import routes from './controller/routes.js';
const app = express();

// parse requests of content-type: application/json
app.use(bodyParser.json());

// parse requests of content-type: application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Credentials", "true");
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    return next();
});
// simple route
app.get("/", (req, res) => {
    res.json({ message: "304 simp gang" });
});

app.put("/admin/genre", routes.addGenre);

// set port
app.listen(3000, () => {
    console.log("Server is running on port 3000.");
});