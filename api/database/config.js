import {config} from 'dotenv';
config();

export default {
    host :process.env.HOST ||  "db4free.net" ,
    database :  process.env.DATABASE || "simpleclass" ,
    user :   process.env.USER || "miguelo" ,
    password : process.env.PASSWORD || "compasss" ,
    port : process.env.PORT || "3306"
    

};
