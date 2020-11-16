import express from 'express';
import bodyParser from 'body-parser';
import routes from './controller/routes.js';
import request from 'request';
const app = express();

// parse requests of content-type: application/json
app.use(bodyParser.json());

// parse requests of content-type: application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Credentials", "true");
    res.header("Access-Control-Allow-Methods", "GET,DELETE,POST,PUT");
    return next();
});

app.use("/assets", express.static('.' + '/assets'));

// Parse URL-encoded bodies (as sent by HTML forms)
app.use(express.urlencoded());

// Parse JSON bodies (as sent by API clients)
app.use(express.json());

app.get("/", (req, res) => { // test route
    res.sendFile('index.html', { root: '.' })
});

app.post("/", function(req, res) {
    let user = req.body;
    console.log(req.body);
    // request.post('http://www.yoursite.com/formpage',
    //     { json: { key: 'value' } },
    //     function (error, response, body) {
    //         if (!error && response.statusCode == 200) {
    //             console.log(body);
    //         }
    //     }
    // );
});

app.get("/userprofile", (req, res) => { // test route
    res.sendFile('userprofile.html', { root: '.' })
});

// test routes
app.put("/admin/genre", routes.addGenre);
app.get("/genre/:is_safe", routes.getGenre);

app.get("/series/all", routes.getSeries);
app.get("/movies/all", routes.getMovies);
app.get("/admin/emails", routes.getEmails);

/**
 * USING THE ENDPOINTS BELOW FULFILL MINIMUM REQUIREMENTS
 */

// curl -X PUT -H "Content-Type: application/json" -d '{"user_name":"xXTristySimpXx", "password":"simplife4ever", "email":"simp@msn.ca"}' localhost:3000/user/create
app.put("/user/create", routes.addUser);

// curl -X DELETE -H "Content-Type: application/json" -d '{"anime_name": "The Wind Rises"}' localhost:3000/delete
app.delete("/delete", routes.deleteAnime);

// curl -X POST -H "Content-Type: application/json" -d '{"new_email":"saaarah99@haha.net", "old_email":"srah99@haha.net"}' localhost:3000/user/email
app.post("/user/email", routes.updateEmail);

// anime name must be url encoded
// curl localhost:3000/episodes/One%20Piece
app.get("/episodes/:anime_name", routes.getEpisodes);

// curl -X POST -H "Content-Type: application/json" -d '{"email": "felixlei@hotmail.com"}' localhost:3000/user/watching
app.post("/user/watching", routes.getWatching);

app.get("/browse/:first_letter/:is_safe", routes.getFilteredAnime);

// TODO sarah: possibly add endpoint for adding reviews/comments

app.get("/user_activity", routes.getUserActivity);

app.get("/servers/hosting/:num_videos", routes.getServersHosting);

// TODO sarah: return the comments of a given episode

// anime name must be url encoded
app.get("/popularity/:anime_name", routes.getAvgComments);

// genre must be url encoded
app.get("/watchedAll/:genre", routes.getWatchersOfGenre);

// set port
app.listen(3000, () => {
    console.log("Server is running on port 3000.");
});