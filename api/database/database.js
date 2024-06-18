import pg from "pg";
import config from "./config.js";


const { Pool } = pg;
const pool = new Pool({
  // connectionString: process.env.POSTGRES_URL,
  host: config.host,
  database: config.database,
  user: config.user,
  password: config.password,
  ssl: {
    rejectUnauthorized: false, // Esto es opcional y depende de tu configuración de seguridad
 },
  // connectionString,
  // database_url : config.database_url,
  // database_url:"postgres://miguel:vhmKQup0dtQL0zuNmyaFl1mtT7oBHwGO@dpg-cld8prmg1b2c73f55i5g-a/simpleclass",
  // database_url:"postgres://miguel:vhmKQup0dtQL0zuNmyaFl1mtT7oBHwGO@dpg-cld8prmg1b2c73f55i5g-a.oregon-postgres.render.com/simpleclass",

  // ssl: false,
  // {
  //     rejectUnauthorized:false,

  // },
  // password : "456123",
  // database:"simpleclass",
});

export default pool;
