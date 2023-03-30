import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import config from "../config/auth.config";
//import {getConnection} from "./../database/database.js";
import { create, findAll, findOneUser } from "./../helpers/auth.helper.js";
import { getRole } from "./../helpers/auth.helper.js";

exports.signup = (req, res) => {
  // Save User to Database
   
   create(req,res) 
    .then((user) => {
      
      // if (req.body.roles) {
      //   findAll(req).then((roles) => {
      //     user.setRoles(roles).then(() => {
            
      //       res.send({ message: "Usuario registrado exitosamente!" });
      //     });
      //   });
      // } else {
      //   // user role = 1
      //   user.setRoles([1]).then(() => {
      //     res.send({ message: "Usuario registrado exitosamente!" });
      //   });
      // }
      res.status(200).send({message: "Usuario registrado exitosamente!" });
    })
    .catch((err) => {
      
      res.status(501).send({ message: err.message });
    });
};

exports.signin = (req, res) => {
  

  findOneUser(req, res)
    .then((user) => {
      if (!user) {
        return res.status(404).send({ message: "Usuario no encontrado." });
      }

      var passwordIsValid = bcrypt.compareSync(
        req.body.password,
        user.password
      );
     
      if (!passwordIsValid) {
        
        return res.status(401).send({
          accessToken: null,
          message: "clave inválida!",
        });
      }

      var token = jwt.sign({ id: user.id }, config.secret, {
        expiresIn: 86400, // 24 hours
      });
      
      var authorities = [];
      getRole(user).then((roles) => {
        console.log(roles);
      
        for (let i = 0; i < roles.length; i++) {
          authorities.push("ROLE_" + roles[i].name.toUpperCase());
        }   
        const objValues = {
          id: user.id,
          username: user.username,
          email: user.email,
          roles: "yo",
          accessToken: token,
        };
        console.log(objValues);
        return res.status(200).send(
         objValues);
      });
  
      // return res.status(200).send({message:`Se ha hecho login 'correctamente'\n~${user[0]}`,})
    })
    .catch((err) => {
      console.log(err);
      // res.status(500).send({ message: err.message });
    });
};
