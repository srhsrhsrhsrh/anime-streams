export default class Response {
    static sendResponseWithErr = (response, err, message) => {
        console.log(message, ": ", err);
        response.send(err);
    }
}