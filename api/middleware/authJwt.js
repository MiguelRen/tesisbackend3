import jwt from "jsonwebtoken";
import config from "./../config/auth.config";

const verifyToken = (req, res, next) => {
    let token = req.headers["x-access-token"];
  
    if (!token) {
      return res.status(403).send({
        message: "No token provided!"
      });
    }
  
    jwt.verify(token, config.secret, (err, decoded) => {
      if (err) {
        return res.status(401).send({
          message: "Unauthorized!"
        });
      }
      req.userId = decoded.id;
      next();
    });
  };
  
 const  isAdmin = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
      user.getRoles().then(roles => {
        for (let i = 0; i < roles.length; i++) {
          if (roles[i].name === "administrador") {
            next();
            return;
          }
        }
  
        res.status(403).send({
          message: "Se requiere el rol de administrador!"
        });
        return;
      });
    });
  };
  
 const isModerator = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
      user.getRoles().then(roles => {
        for (let i = 0; i < roles.length; i++) {
          if (roles[i].name === "moderador") {
            next();
            return;
          }
        }
  
        res.status(403).send({
          message: "Se requiere el rol de moderador!"
        });
      });
    });
  };
  
 const isModeratorOrAdmin = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
      user.getRoles().then(roles => {
        for (let i = 0; i < roles.length; i++) {
          if (roles[i].name === "moderator") {
            next();
            return;
          }
  
          if (roles[i].name === "administrador") {
            next();
            return;
          }
        }
  
        res.status(403).send({
          message: "Se requiere rol de administrador o de moderador!"
        });
      });
    });
  };
  
  const authJwt = {
    verifyToken: verifyToken,
    isAdmin: isAdmin,
    isModerator: isModerator,
    isModeratorOrAdmin: isModeratorOrAdmin
  };
  module.exports = authJwt; 