
import { response } from "express";
import  pool  from "../database/database.js";
import bcrypt from "bcryptjs";





//verify if there is the user yet
export const findByUser = async (username) => {
  try {


    const sql = "SELECT * FROM tab_user WHERE use_username = \$1";
    const dbresponse = await pool.query(sql, [username]);
    

    const result = dbresponse.rows[0]; 
  
    return result;

  } catch (error) {
    
    console.log("findByUser helper ERROR \n", error);

} 
}



// find all users
export const findAllUser = async () => {
  try {
    
    const sql = `SELECT * FROM tab_user`;
 
    const dbresponse = await pool.query(sql);
    
    const result = dbresponse.rows; 

    return result;

  } catch (error) {
    console.log("findAllUser helper ERROR \n", error);
  }
};

//verify if there is the email yet
export const findByEmail = async (email) => {
  try {
      
    // const connection = await getConnection();
    const sql  ="SELECT * FROM tab_user WHERE use_useremail = \$1";
    const dbresponse = await pool.query(sql,email);
    const result = dbresponse.rows[0];
    
    return result;
  } catch (error) {
    console.log("findByEmail helper ERROR \n", error.message);
  }
};



// create new user
export const createUser = async (username, email, password) => {
 
  
  try {

 
    const sql1 =
      "INSERT INTO tab_user (use_username,use_useremail,use_userpassword) VALUES ($1,$2,$3) returning *"; 
      // console.log("p3");
      const dbresponse1 = await pool.query(sql1, [username, email, password],
        );
   
        const use_userid = dbresponse1.rows[0].use_userid; 
        // console.log(use_userid);
      const sql2 =
        "INSERT INTO link_userrole (userrole_tabuserid_fk) VALUES ($1)";
        // console.log("p5");
      const dbresponse2= await pool.query(sql2, [use_userid]);
      
      if (dbresponse1 && dbresponse2) {
        return "ok"        
      }else{
        error();
      }

      return

  } catch (error) {
    console.log("createUser helper  \n" , error.message);
  }
};

// update user data
export const updateUser = async (lastUserName, newUserName)=>{
  const userLastName = lastUserName;
  const userNewName= newUserName;
  console.log(userLastName, userNewName);
  const sql = `UPDATE tab_user set use_username = $1 where use_username = $2`;
  
  const dbresponse = await pool.query(sql, [ userNewName,userLastName]);
  console.log(dbresponse);
  
  if (dbresponse[0]) {
    
  } else {
    
  }
  
};

