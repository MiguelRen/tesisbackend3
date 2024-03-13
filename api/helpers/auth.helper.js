import  json  from "body-parser";
import  pool  from "./../database/database.js";
import bcrypt from "bcryptjs";

export const findOneUser = async (req, res) => {
  try {
    const username = [req.body.username];
    // const connection = await getConnection();
    const sql = "SELECT * FROM tab_user WHERE use_username = \$1";
    const dbresponse = await pool.query(sql, username);
    console.log(dbresponse);
    
 const result = dbresponse.rows[0]; 
    return new Promise((resolve) => resolve(result));
  } catch (error) { 
    
    return new Promise((resolve) =>
      resolve(res.status(401).send({ message: error.message }))
    );
  } finally {
  }
};

export const findOneEmail = async (req, res) => {
  try {
    const email = [req.body.email];
     
    // const connection = await getConnection();
    const sql  ="SELECT * FROM tab_user WHERE use_useremail = \$1";
    const dbresponse = await pool.query(sql,email);
    const result = dbresponse.rows[0];
    
    return new Promise((resolve)=> resolve(result));
  } catch (error) {
     return res.status(401).send(error.message);
  }
};
export const findByPk = async (userId) => {
  try {
    // const connection = await getConnection();
    const dbresponse = pool.query(
      "SELECT * FROM tab_user WHERE use_userid = \$1",
      userId
    );
    // connection.release;

    return res.status(200).json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

// create new user
export const create = async (req, res) => {
  // console.log("p1");
  const username = req.body.username;
  const email = req.body.email;
  const password = bcrypt.hashSync(req.body.password, 8);
  // console.log(username+"\n"+email+"\n"+password);
  
  // console.log("p2");
  // const dateTime = new Date();
  // console.log(username,email,password);
  try {

    // const sql1 = "INSERT INTO tab_user (use_username,use_useremail,use_userpassword) VALUES ($1,$2,$3) returning use_userid ";
    //   const result1 = await pool.query(sql1, [username, email, password],
    //     (err,response1) =>{
    //       if(err){
    //         console.table(err)
    //       }else{
    //         console.log(response1.rows[0].use_userid);
    //       }
    //     });
          
    const sql1 =
      "INSERT INTO tab_user (use_username,use_useremail,use_userpassword) VALUES ($1,$2,$3) returning *"; 
      // console.log("p3");
      const dbresponse1 = await pool.query(sql1, [username, email, password],
        );
        // console.log("p4 +" );
        // (err,response1) =>{
        //   if(err){
        //     console.table(err)
        //   }else{
        //     console.log(response1);
        //   }
          
        // }
        const use_userid = dbresponse1.rows[0].use_userid; 
        // console.log(use_userid);
      const sql2 =
        "INSERT INTO link_userrole (userrole_tabuserid_fk) VALUES ($1)";
        // console.log("p5");
      const dbresponse2= await pool.query(sql2, [use_userid],
        
      //  (err)=>{
      //   if (err){
      //     console.log(err);
      //   }
      //  }
        );

        // console.log("p6  "+ dbresponse2);


 
 
    // return result2;
    // return res.status(200).send("usuario registrado");
  } catch (error) {
    console.log("p7  \n" + error);
    return res.status(418).send(error.message);
  }
};
// find all users

export const findAll = async (req) => {
  try {
    const role = req.body.role;

    const connection = await getConnection();
    const result = await connection.query(
      "SELECT * FROM listRoles WHERE name = ?",
      role
    );
    res.status(200).send("rol encontrado");
    connection.release;
    return result;
  } catch (error) {
    return res.status(500).send(error.message);
  }
};

export const getRole = async (user) => {
  try {
    

    const sql =
    " select \
      list_role.rol_rolename \
      from \
      list_role \
      inner join \
      link_userrole \
      on \
      list_role.rol_roleid = link_userrole.userrole_listroleid_fk \
      inner join \
      tab_user \
      on \
      link_userrole.userrole_tabuserid_fk = tab_user.use_userid \
      where \
      tab_user.use_userid = \$1";
    // const connection = await getConnection();
    const dbresponse = await pool.query(sql, [user.use_userid]);
    // connection.release;
    const result = dbresponse.rows;
    // console.log(result);
    return result;
  } catch (error) {
    console.error(error);
  }
};
