import { connection } from './db-connector.js';
import Response from './response.js';

export default class User {

    static getSeries = (_, response) => {
        connection.query("select distinct has_episode.anime_name, series.num_eps " +
            "from series inner join has_episode " +
            "on series.anime_name=has_episode.anime_name", undefined, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while retrieving series and numbers of episodes");
            } else {
                console.log("Retrieved series and number of episodes: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getMovies = (_, response) => {
        connection.query("select * from movie", undefined, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while retrieving movies");
            } else {
                console.log("Retrieved all movies: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static addUser = (user, response) => {
        connection.query("INSERT INTO user SET ?", user.body, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while adding new user");
            } else {
                console.log("Added new user: ", {id: res.insertId, userName: user.body["user_name"]});
                response.send("Success");
            }
        });
    };

    static updateEmail = (email, response) => {
        connection.query("UPDATE user SET email=? WHERE email=?",
            [email.body["new_email"], email.body["old_email"]], (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while updating email");
            } else {
                console.log("New email: ", email.body["new_email"]);
                response.send(res.affectedRows + " record(s) updated");
            }
        });
    };

    static getEpisodes = (anime, response) => {
        connection.query("SELECT anime.anime_name, has_episode.number, has_episode.video_link " +
                         "FROM anime INNER JOIN has_episode " +
                         "WHERE anime.anime_name=has_episode.anime_name AND anime.anime_name=?",
            decodeURI(anime.params["anime_name"]), (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while retrieving episodes");
            } else {
                console.log("Retrieved episodes: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getWatching = (email, response) => {
        connection.query("SELECT anime_name, number, video_link FROM watches WHERE email=?",
            email.body["email"], (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while retrieving watch list");
            } else {
                console.log("Retrieved currently watching: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getFilteredAnime = (filters, response) => {
        connection.query("SELECT anime_name " +
                         "FROM anime INNER JOIN genre " +
                         "WHERE anime.genre=genre.genre AND is_safe=? AND " +
                         "anime.anime_name LIKE" + connection.escape(filters.params["first_letter"]+'%'),
            filters.params["is_safe"], (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while filtering anime");
            } else {
                console.log("Filtered anime: ", {result: res});
                response.send({result: res});
            }
        });
    };

}