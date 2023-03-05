import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import { json } from "body-parser";
//import {getConnection} from "./../database/database.js";
import {create,findAll, findOneUser} from "./../helpers/auth.helper.js"

exports.signup = (req, res) => {
  // Save User to Database
  create(req)
    .then(user => {
      if (req.body.roles) {
        findAll(req).then(roles => {
          user.setRoles(roles).then(() => {
            res.send({ message: "Usuario registrado exitosamente!" });
          });
        });
      } else {
        // user role = 1
        user.setRoles([1]).then(() => {
          res.send({ message: "Usuario registrado exitosamente!" });
        });
      }
    })
    .catch(err => {
      console.log("problemas");
      res.status(500).send({ message: err.message });
    });

}; 

exports.signin = async (req, res) => {
  
 
  await findOneUser(req,res)
    .then(user => {
      console.log(typeof(user));
      console.log(user);
      console.log(user.password);
      if (!user) {
        
       return res.status(404).send({message:'Usuario no encontrado.'}) ;
      
      }
      console.log(req.body.password);
      console.log(user.password);
       
   
      var passwordIsValid = bcrypt.compareSync(
        req.body.password,
        user.password
      );
      console.log(passwordIsValid);
      if (!passwordIsValid) {
        
        return res.status(401).send({
          accessToken: null,
          message: "clave inválida!"
        });
        
       
      }
      console.log(res.data);
      var token = jwt.sign({ id: user.id }, config.secret, {
        expiresIn: 86400 // 24 hours
      });

      var authorities = [];
      user.getRoles().then(roles => {
        for (let i = 0; i < roles.length; i++) {
          authorities.push("ROLE_" + roles[i].name.toUpperCase());
        }
        return res.status(200).send({
          id: user.id,
          username: user.username,
          email: user.email,
          roles: authorities,
          accessToken: token
        });
      });
    })
    .catch(err => {
      
      console.log(err);
     // res.status(500).send({ message: err.message });
    });
};