import pg from "pg";
import config from "./config.js";

// import parse from pg-connection-string.parse

// const connectionString =parse('postgres://miguel:vhmKQup0dtQL0zuNmyaFl1mtT7oBHwGO@dpg-cld8prmg1b2c73f55i5g-a/simpleclass');
// console.table(pg)
const {Pool} = pg;
const pool = new Pool({
    // host : config.host,
    // database : config.database,
    // user : config.user,
    // password : config.password,
    // connectionString,
    // database_url : config.database_url,
    // database_url:"postgres://miguel:vhmKQup0dtQL0zuNmyaFl1mtT7oBHwGO@dpg-cld8prmg1b2c73f55i5g-a/simpleclass",
    database_url:"postgres://miguel:vhmKQup0dtQL0zuNmyaFl1mtT7oBHwGO@dpg-cld8prmg1b2c73f55i5g-a.oregon-postgres.render.com/simpleclass",
    ssl: {
        rejectUnauthorized:false,
    },

});


export default pool;


