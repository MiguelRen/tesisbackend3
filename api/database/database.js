import pg from "pg";
import config from "./config.js";
// console.table(pg)
const {Pool} = pg;
const pool = new Pool({
    host : config.host,
    database : config.database,
    user : config.user,
    password : config.password 
});


export default pool;


