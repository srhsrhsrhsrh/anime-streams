import { connection } from './db-connector.js';
import Response from "./response.js";

export default class Admin {
    /**
     * Check password here or in the frontend
     */
    static password = "weLuvCharles";

    static addGenre = (genre, response) => {
        connection.query("INSERT INTO genre SET ?", genre.body, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while adding new genre");
            } else {
                console.log("Added new genre: ", {id: res.insertId, genre: genre.body.genre});
                response.send("Success");
            }
        });
    };

    static getGenre = (genre, response) => {
        connection.query("SELECT * FROM genre WHERE is_safe=?", genre.params["is_safe"], (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while fetching genre");
            } else {
                console.log("All genres: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getGenres = (_, response) => {
        connection.query("SELECT * FROM genre", undefined, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while retrieving genres");
            } else {
                console.log("All genres: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getUsers = (_, response) => {
        connection.query("SELECT * FROM user", undefined, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while retrieving users");
            } else {
                console.log("Retrieved all users: " + {result: res});
                response.send({result: res});
            }
        });
    };

    static deleteAnime = (anime, response) => {
        connection.query("DELETE FROM anime WHERE anime_name=?", anime.body["anime_name"], (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while deleting anime");
            } else {
                console.log("Deleted anime: " + anime.body["anime_name"]);
                response.send(res.affectedRows + " record(s) updated");
            }
        });
    };

    static getEmails = (_, response) => {
        connection.query("SELECT email FROM user", undefined, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while retrieving emails");
            } else {
                console.log("Retrieved emails: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getUserActivity = (_, response) => {
        connection.query("SELECT U.user_name AS 'Username', count(distinct WR.anime_name) AS '# of Anime Reviewed' " +
            "FROM user U INNER JOIN writes_review WR ON U.email=WR.email " +
            "GROUP BY U.email ORDER BY count(distinct WR.anime_name) desc", undefined, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while getting user comment count");
            } else {
                console.log("Retrieved number of comments per user: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getServersHosting = (num_videos, response) => {
        connection.query("SELECT server.sname AS 'Server Name', COUNT(video.video_link) AS '# of Videos Hosted' " +
            "FROM server " +
            "INNER JOIN video ON server.server_link=video.server_link " +
            "GROUP BY server.sname HAVING COUNT(video.video_link)>=?", num_videos.params["num_videos"], (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while getting servers");
            } else {
                console.log("Retrieved servers with at least " + num_videos + " videos ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getAvgComments = (anime, response) => {
        connection.query("SELECT B.anime_name AS 'Anime Name', avg(cnt) AS 'Average # of comments' FROM " +
                "(SELECT E.anime_name, E.number, COUNT(C.id) AS cnt " +
                "FROM has_episode E " +
                "INNER JOIN comment C ON C.video_link=E.video_link " +
                "WHERE E.anime_name=? " +
                "GROUP BY E.anime_name, E.number) B " +
            "GROUP BY B.anime_name " +
            "ORDER BY avg(cnt) ", decodeURI(anime.params["anime_name"]), (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while counting comments");
            } else {
                console.log("Retrieved average number of comments per episode ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getWatchersOfGenre = (genre, response) => {
        connection.query("SELECT U.user_name AS 'Username', U.email FROM user U WHERE NOT EXISTS " +
            "(SELECT A.anime_name " +
            "FROM anime A INNER JOIN genre G " +
            "ON A.genre=G.genre " +
            "WHERE G.genre=? AND A.anime_name NOT IN " +
            "(SELECT A1.anime_name " +
            "FROM anime A1 INNER JOIN watches W " +
            "ON A1.anime_name=W.anime_name " +
            "WHERE W.email=U.email))", decodeURI(genre.params["genre"]), (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while retrieving users watching all " +
                    "anime of genre " + genre.params["genre"]);
            } else {
                console.log("Retrieved users watching all " + genre.params["genre"] + " anime ", {result: res});
                response.send({result: res});
            }
        });
    };

}