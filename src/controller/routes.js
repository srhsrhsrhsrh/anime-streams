import Admin from "../model/admin.js";
import User from "../model/user.js";

/**
 * whether a function is located in User/Admin doesn't mean much and can be changed to match the inferface
 */
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

    static getWatching(email, response) {
        User.getWatching(email, response);
    }

    static getFilteredAnime(filters, response) {
        User.getFilteredAnime(filters, response);
    }

    static getUserActivity(_, response) {
        Admin.getUserActivity(_, response);
    }

    static getServersHosting(num_videos, response) {
        Admin.getServersHosting(num_videos, response);
    }

    static getAvgComments(anime, response) {
        Admin.getAvgComments(anime, response);
    }

    static getWatchersOfGenre(genre, response) {
        Admin.getWatchersOfGenre(genre, response);
    }
}