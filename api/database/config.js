import {config} from 'dotenv';
config();

connectionString

export default {
    // host :process.env.HOST ||  "localhost" ,
    // database :  process.env.DATABASE || "simpleclass" ,
    // user :   process.env.USER || "miguel" ,
    // password : process.env.PASSWORD || "456123" ,
    // port : process.env.PORT || "5432",
    database_url : process.env.DATABASE_URL,
    

};