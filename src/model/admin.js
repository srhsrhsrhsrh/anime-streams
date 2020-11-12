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
        })
    }

}