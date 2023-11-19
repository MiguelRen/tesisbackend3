import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import secret from "../config/auth.config.js";
import { create, findAll, findOneUser, getRole} from "./../helpers/auth.helper.js";


const signup = (req, res) => {
  // Save User to Database
  console.log("authcontroller signup");
  create(req,res) 
    .then((user) => {
      // return res.end();
      return res.status(200).send({message: "Usuario registrado exitosamente!" });
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
    })
    .catch((err) => {
      console.log("porque entré aqui?");
      
      return res.status(501).send({ message: err.message });
    });
};

const signin = (req, res) => {
  
  findOneUser(req, res)
    .then((user) => {

      if (!user) {
        return res.status(404).send({ message: "Usuario no encontrado." });
      }
   

      var passwordIsValid = bcrypt.compareSync(
        req.body.password,
        user.use_userpassword
        );
        
        console.log(req.body.password,
          user.use_userpassword);
        
      if (!passwordIsValid) {
        
        return res.status(401).send({
          accessToken: null,
          message: "clave inválida!",
        });
      }
      console.log(user);
      var token = jwt.sign({ id: user.id }, secret, {
        expiresIn: 86400, // 24 hours
      });
      console.log(token);
      
      var authorities = [];
      getRole(user).then((roles) => {
        console.log(roles);
      
        for (let i = 0; i < roles.length; i++) {
          authorities.push( roles[i].roleName.toUpperCase());
        }   
        const objValues = {
          // id: user.id,
          username: user.userName,
          // email: user.userEmail,
          roles: authorities,
          accessToken: token,
        };
        console.log(objValues);
  
        return res.status(200).send(
         objValues);
      });
  
      // return res.status(200).send({message:`Se ha hecho login 'correctamente'\n~${user[0]}`,})
    })
    .catch((err) => {
      return console.log(err.message);
      // res.status(500).send({ message: err.message });
    });
};

export {
  signin,
  signup
}