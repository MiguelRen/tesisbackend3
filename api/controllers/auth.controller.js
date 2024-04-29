import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import secret from "../config/auth.config.js";
import { createUser, findByUser } from "../helpers/user.helper.js";
import { getRole } from "../helpers/role.helper.js";

const signup = (req, res) => {
  // Save User to Database
  // console.log("authcontroller signup");
  createUser(req, res)
    .then((user) => {
      // return res.end();
      return res
        .status(200)
        .send({ message: "Usuario registrado exitosamente!" });
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
      // console.log("porque entré aqui?");

      return res.status(501).send({ message: err.message });
    });
};

const signin = (req, res) => {

  const  {username,password} = req.body;

  findByUser(username)
    .then((user) => {
      // console.log(user);
      if (!user) {
        return res.status(404).send({ message: "User not found" });
      }else{
        
        var passwordIsValid = bcrypt.compareSync(
          password,
          user.use_userpassword
        );
  
        // console.log(req.body.password,
        //   user.use_userpassword);
  
        if (!passwordIsValid) {
          return res.status(401).send({
            accessToken: null,
            message: "Invalid key",
          });
        }
        // console.log(user);
        var token = jwt.sign({ id: user.id }, secret, {
          expiresIn: 10800, // 24 hours
        });
        // console.log(token);
  
        var authorities = [];
        getRole(user).then((roles) => {
          // console.log(roles);
  
          for (let i = 0; i < roles.length; i++) {
            authorities.push(roles[i].rol_rolename.toUpperCase());
          }
          const objValues = {
            // id: user.id,
            username: user.use_username,
            // email: user.use_useremail,
            roles: authorities,
            accessToken: token,
          };
          console.log(objValues);
  
          return res.status(200).send(objValues);
        });
      }
    }).catch((err) => {
      return console.log("signing controller ERROR ",err.message);
      res.status(500).send("server problems");
    });
};

export { signin, signup };
