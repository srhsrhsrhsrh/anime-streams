const sarah = {
    USER: "root",
    HOST: "localhost",
    PASSWORD: "", // REMINDER NOT TO COMMIT
    DB: "anime"
};

/**
 * In order to establish db connection, use your own auth parameters and don't commit your password
 * if it's the one you use for everything
 */
const user = sarah;
export const dbConfig = {
    HOST: user.HOST,
    USER: user.USER,
    PASSWORD: user.PASSWORD,
    DB: user.DB
};
