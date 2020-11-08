import { connection } from './db-connector.js';

/**
 * Can't guarantee that create is working rn
 */
const User = function(user) {
    this.email = user.email;
    this.password = user.password;
    this.username = user.username;
};

User.create = (newUser, response) => {
    connection.query("INSERT INFO User SET ?", newUser.body, (err, res) => {
        if (err) {
            console.error("Error while creating user: ", err);
            response(err);
            return;
        }

        console.log("Created user with email: ", { id: res.insertId, ...newUser });
        response("success");
    });
};
