import mysql from "mysql";
import { dbConfig } from "../../config/db.config.js";

/**
 * Creates connection to MySQL db
 * https://bezkoder.com/node-js-rest-api-express-mysql/
 */
export const connection = mysql.createConnection({
    host: dbConfig.HOST,
    user: dbConfig.USER,
    password: dbConfig.PASSWORD,
    database: dbConfig.DB
});

connection.connect(err => {
    if (err) throw err;
    console.log("Successfully connected to the database.");
});