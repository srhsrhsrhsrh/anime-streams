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

app.get("/", (req, res) => { // test route
    res.json({ message: "304 simp gang" });
});

// test routes (these are the ones tested and working without the full db)
app.put("/admin/genre", routes.addGenre);
app.get("/genre/:is_safe", routes.getGenre);

// body needs whole user object
app.put("/user/create", routes.addUser);

// body needs anime_name
app.delete("/admin/anime", routes.deleteAnime);

// body has new_email and old_email
app.post("/user/email", routes.updateEmail);

// params has anime_name, which should be URL encoded because it might have spaces
app.get("/episodes/:anime_name", routes.getEpisodes);

// params and body aren't important
app.get("/admin/emails", routes.getEmails);

// set port
app.listen(3000, () => {
    console.log("Server is running on port 3000.");
});