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
        connection.query("SELECT U.user_username, count(distinct WR.anime_name) " +
            "FROM user U INNER JOIN writes_review WR ON U.email=WR.email " +
            "GROUP BY U.email ORDER BY count(distinct WR.anime_name)", undefined, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while getting user comment count");
            } else {
                console.log("Retrieved number of comments per user: ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getServersHosting = (num_videos, response) => {
        connection.query("SELECT server.sname, COUNT(video.video_link) " +
            "FROM server " +
            "INNER JOIN video ON server.server_link=video.server_link " +
            "INNER JOIN movie ON movie.video_link=video.video_link" +
            "GROUP BY server.sname HAVING COUNT(video.video_link)>=?", num_videos.params["num_videos"], (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while getting servers");
            } else {
                console.log("Retrieved servers with at least " + num_videos + " videos ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getAvgComments = (_, response) => {
        connection.query("SELECT anime_name, avg(cnt) FROM " +
                "(SELECT A.anime_name, E.number, COUNT(C.id) AS cnt " +
                "FROM anime A INNER JOIN has_episode E ON A.anime_name=E.anime_name " +
                "INNER JOIN comment C ON C.video_link=E.video_link " +
                "GROUP BY A.anime_name, E.number) " +
            "GROUP BY anime_name " +
            "ORDER BY avg(cnt) ", undefined, (err, res) => {
            if (err) {
                Response.sendResponseWithErr(response, err, "Error while counting comments");
            } else {
                console.log("Retrieved average number of comments per episode ", {result: res});
                response.send({result: res});
            }
        });
    };

    static getWatchersOfGenre = (genre, response) => {
        connection.query("SELECT U.user_name, U.email FROM user U WHERE NOT EXISTS " +
            "(SELECT A.anime_name " +
            "FROM anime A INNER JOIN genre G " +
            "ON A.genre=G.genre " +
            "WHERE G.genre=? " +
            "EXCEPT " +
            "SELECT A1.anime_name " +
            "FROM anime A1, watches W " +
            "ON A1.anime_name=W.anime_name " +
            "WHERE W.email=U.email)", genre.params["genre"], (err, res) => {
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