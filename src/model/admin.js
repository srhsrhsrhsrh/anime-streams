import { connection } from './db-connector.js';

export default class Admin {
    /**
     * Check password here or in the frontend
     */
    static password = "weLuvCharles";

    /**
     * Suppose we have multiple parameters for the query:
     *      - genre.body below can be replaced with [genre.body.id, genre.body uuid, etc.]
     */
    static addGenre = (genre, response) => {
        connection.query("INSERT INTO Genre SET ?", genre.body, (err, res) => {
            if (err) {
                console.log("Error while adding new genre: ", err);
                response.send(err);
                return;
            }

            console.log("Added new genre: ", {id: res.insertId, genre: genre.body.genre});
            response.send("Success");
        });
    };


}