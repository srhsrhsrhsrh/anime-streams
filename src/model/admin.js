import { connection } from './db-connector.js';

export default class Admin {
    /**
     * Check password here or in the frontend
     */
    static password = "weLuvCharles";

    static addGenre = (genre, response) => {
        connection.query("INSERT INTO genre SET ?", genre.body, (err, res) => {
            if (err) {
                console.log("Error while adding new genre: ", err);
                response.send(err);
                return;
            }

            console.log("Added new genre: ", {id: res.insertId, genre: genre.body.genre});
            response.send("Success");
        });
    };

    static getGenre = (genre, response) => {
        connection.query("SELECT * FROM genre WHERE is_safe=?", genre.params["is_safe"], (err, res) => {
            if (err) {
                console.log("Error while adding new genre: ", err);
                response.send(err);
                return;
            }

            console.log("All genres: ", {result: res});
            response.send({result: res});
        });
    };

    static deleteAnime = (anime, response) => {
        connection.query("DELETE FROM anime WHERE anime_name=?", anime.body["anime_name"], (err, res) => {
            if (err) {
                console.log("Error while deleting anime: ", err);
                response.send(err);
                return;
            }

            console.log("Deleted anime: " + anime.body["anime_name"]);
            response.send(res.affectedRows + " record(s) updated");
        });
    };

    static getEmails = (_, response) => {
        connection.query("SELECT email FROM user", undefined, (err, res) => {
            if (err) {
                console.log("Error while retrieving emails: ", err);
                response.send(err);
                return;
            }

            console.log("Retrieved emails: ", {result: res});
            response.send({result: res});
        })
    }

}