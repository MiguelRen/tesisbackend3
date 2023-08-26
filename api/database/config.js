import {config} from 'dotenv';
config();

export default {
    host : "db4free.net" || process.env.HOST ,
    database : "simpleclass" || process.env.DATABASE ,
    user :  "miguelo" || process.env.USER,
    password :  "compasss" ||  process.env.PASSWORD ,
    

};
