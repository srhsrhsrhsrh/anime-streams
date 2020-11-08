import Admin from "../model/admin.js";

export default class Router {
    static addGenre(genre, response) {
        Admin.addGenre(genre, response);
    }
}