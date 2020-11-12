import { connection } from './db-connector.js';

export default class User {

    static addUser = (user, response) => {
        connection.query("INSERT INTO user SET ?", user.body, (err, res) => {
            if (err) {
                console.log("Error while adding new user: ", err);
                response.send(err);
                return;
            }

            console.log("Added new user: ", {id: res.insertId, userName: user.body["user_name"]});
            response.send("Success");
        });
    };

    static updateEmail = (email, response) => {
        connection.query("UPDATE user SET email=? WHERE email=?",
            [email.body["new_email"], email.body["old_email"]], (err, res) => {
            if (err) {
                console.log("Error while updating email: ", err);
                response.send(err);
                return;
            }

            console.log("New email: ", email.body["new_email"]);
            response.send(res.affectedRows + " record(s) updated");
        });
    };

    static getEpisodes = (anime, response) => {
        connection.query("SELECT anime_name, number, video_link " +
                         "FROM anime INNER JOIN has_episode " +
                         "WHERE anime.anime_name=has_episode.anime_name AND anime.anime_name=?", anime.params["anime_name"], (err, res) => {
            if (err) {
                console.log("Error while retrieving episodes: ", err);
                response.send(err);
                return;
            }

            console.log("Retrieved episodes", {result: res});
            response.send({result: res});
        });
    };

}