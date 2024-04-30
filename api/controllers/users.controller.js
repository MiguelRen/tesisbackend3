import {createUser,updateUser,findByUser,findByEmail,findAllUser} from "../helpers/user.helper.js"
import bcrypt from "bcryptjs"

const getUser = async (req, res) => {
    try {
        
      const {username}= req.body;


        const helperAnswer = await findByUser (username);
        if(helperAnswer) {
          res.status(200).send(helperAnswer)
        }else{
          res.status(404).send("Resouce not found")
        }
        
    } catch (error) {
        console.log("getUser controller ERROR",error.message);
        res.status(500).send("server problems");    
    }
  };
  
  
const getUserAll = async (req,res) => {
  try {
      
    const helperAnswer = await findAllUser();
    if (helperAnswer) {
      res.status(200).send(helperAnswer);
    }else{
      res.status(404).send("resource not found");
    }
      
  } catch (error) {
      console.log("getUserAll controller ERROR", error.message);    
      res.status(500).send("server problems")
  }
};
   
  const addUser= async (req, res) => {
    try {
      
        let {username, email, password} = req.body
        
        password = bcrypt.hashSync(password,8);

        
        const helperAnswer = await createUser(username, email, password);

        if (helperAnswer) {
          res.status(200).send("resource added");
        } else {
          res.status(409).send("conflict")
        }
       
    
  } catch (error) {
    console.log("addUser controller ERROR", error.message);
    res.status(503).send("resource not added \n server problems")
  }
  };
  
 const updUser = async (req, res) => {
  try {
    const clientData = req.body
    const helperAnswer = await updateUser(clientData);

      res.status(200).send("updated resource");
   

} catch (error) {
console.log("updUser controller ERROR", error.message);
res.status(304).send("not updated resource \n","server problems")
}
};
 


 const delUser = async (req, res) => {
  try {
    const clientData = req.body
    const helperAnswer = await delUser(clientData);

      res.status(200).send("deletedd resource");
   

} catch (error) {
console.log("deleted controller ERROR", error.message);
res.status(304).send("not deleted resource \n","server problems")
}
  };
 
 
export {
    getUser,
    getUserAll,
    addUser,
    updUser,
    delUser,

};

