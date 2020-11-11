import Admin from "../model/admin.js";
import User from "../model/user.js";

export default class Router {
    static addGenre(genre, response) {
        Admin.addGenre(genre, response);
    }

    static getGenre(genre, response) {
        Admin.getGenre(genre, response);
    }

    static addUser(user, response) {
        User.addUser(user, response);
    }

    static deleteAnime(anime, response) {
        Admin.deleteAnime(anime, response);
    }

    static updateEmail(email, response) {
        User.updateEmail(email, response);
    }

    static getEpisodes(anime, response) {
        User.getEpisodes(anime, response);
    }

    static getEmails(_, response) {
        Admin.getEmails(_, response);
    }
}