import { config } from "dotenv";
config();

// connectionString

export default {
  host: process.env.HOST || "dpg-cnl9092cn0vc73fiug50-a/simpleclass_ptug",
  database: process.env.DATABASE || "simpleclass_ptug",
  user: process.env.USER || "miguel",
  port: process.env.PORT || "5432",
  password: process.env.PASSWORD || "456123",
  database_url : "postgres://miguel:O2dc69APkpmhid3sK0o4Ww9tsX7yRHJS@dpg-cnl9092cn0vc73fiug50-a/simpleclass_ptug",
};
