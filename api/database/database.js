import pg from "pg";
import config from "./config.js";
const connectionString = "postgres://miguel:vhmKQup0dtQL0zuNmyaFl1mtT7oBHwGO@dpg-cld8prmg1b2c73f55i5g-a/simpleclass";
// console.table(pg)
const {Pool} = pg;
const pool = new Pool({
    // host : config.host,
    // database : config.database,
    // user : config.user,
    // password : config.password,
    connectionString,
    // database_url : config.database_url,
    ssl: {
        rejectUnauthorized:false,
    },

});


export default pool;


