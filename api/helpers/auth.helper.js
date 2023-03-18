import { json } from "body-parser";
import {getConnection} from "./../database/database.js";

export const findOneUser =  async(req,res) =>{
    try{
        console.log(req.body.username);
        
        const username = req.body.username;
       const sql = "SELECT * FROM users WHERE username = ?";
        const connection =  await getConnection();
        const [result,metadata] = await connection.query(sql, username);
        
        console.log(result[0]);
        return result[0];
        
    }
    catch(error){
        
         return  res.status(401).send({message:error.message});
    }
};



export const findOneEmail = async (req) =>{
    try{
        const email = req.body.email;
        const connection = await getConnection();
        const result = await connection.query("SELECT username FROM users WHERE email = ?", email)
        return result;
    }
    catch(error){
        res.status(500);
        res.send(error.message);
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
export const create = async(req)=> {

    const username = req.body.username;
    const email =  req.body.email;
    const password = bcrypt.hashSync(req.body.password, 8)
    try{
        const connection = await getConnection();
        const result = await connection.query("INSERT INTO users (id,username,email,password,createdAt,updatedAt) VALUES (?,?,?,?)","AUTO_INCREMENT",username,email,password,NOW(),NOW());
        res.status(200).send("usuario registrado");
    }
    catch(error){
        res.status(500).send(error.message);
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