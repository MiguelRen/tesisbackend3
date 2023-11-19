import {config} from 'dotenv';
config();

export default {
    host :process.env.HOST ||  "localhost" ,
    database :  process.env.DATABASE || "simpleclass" ,
    user :   process.env.USER || "miguel" ,
    password : process.env.PASSWORD || "compasss" ,
    port : process.env.PORT || "6060"
    

};