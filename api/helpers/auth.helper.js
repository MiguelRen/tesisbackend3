import { json } from "body-parser";
import {getConnection} from "./../database/database.js";
import  bcrypt  from "bcryptjs";


export const findOneUser =  async(req,res) =>{

   
    try{
        
        
        const username = req.body.username;
       const sql = "SELECT * FROM users WHERE username = ?";
        const connection =  await getConnection();
        const [result,metadata] = await connection.query(sql, username);
        
       
        return result[0];
        
    }
    catch(error){
        
         return  res.status(401).send({message:error.message});
    }
};



export const findOneEmail = async (req,res) =>{
    try{
        const email = req.body.email;
        const connection = await getConnection();
        const [result,metadata] = await connection.query("SELECT username FROM users WHERE email = ?", email)
        
        return result[0];
    }
    catch(error){
        res.status(401).send(error.message);
    }
};
export const findByPk = async(userId) =>{
    try{
        
        const connection = await getConnection();
        const result = connection.query("SELECT * FROM users WHERE id = ?", userId);
        return res.status(200).json(result);
    }
    catch(error){
        res.status(500);
        res.send(error.message);

    }
};

 
// create new user
export const create = async(req,res)=> {
    // console.log(req.body);
    const username = req.body.username;
    const email =  req.body.email;
    const password = bcrypt.hashSync(req.body.password, 8);
    const dateTime = new Date();
    // console.log(dateTime);
    // console.log(username,email,password);
    try{     
        const connection = await getConnection();
        const sql = "INSERT INTO users (username,email,password) VALUES (?,?,?)";
        await connection.query(sql,[username,email,password],(err,result,fields)=>{
            if(err) throw err;
            return result;
            
        });
      
        // return res.status(200).send("usuario registrado");
    }
    catch(error){
        // console.log("blablablaaaa");
        return res.status(418).send(error.message);
    }
 
};
 // find all users

 export const findAll = async (req) => {
    try{
        const role =  req.body.role;
        
        const connection = await getConnection();
        const result = await connection.query("SELECT * FROM roles WHERE name = ?",role);
        res.status(200).send("rol encontrado");
        return result;
    }
    catch(error){
        res.status(500).send(error.message);
    }
  };

  export const getRole = async (user) =>{
    try {
        const sql = "select roles.name from roles join user_role on roles.id = user_role.roleId join users users on user_role.userId = users.id where users.username = ? ;"
        const connection = await getConnection();
        const [result,metadata] = await connection.query(sql,user.username)
       
        return result;
    } catch (error) {  
        console.error(error);
    }
  }