import {config} from 'dotenv';
config();

export default {
    host : process.env.HOST || "db4free.net",
    database : process.env.DATABASE || "simpleclass",
    user : process.env.USER || "miguelo@localhost",
    password : process.env.PASSWORD || "compasss",
    

};
