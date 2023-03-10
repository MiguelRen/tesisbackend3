import { authJwt } from "../middleware";
import { allAccess, userBoard, adminBoard, moderatorBoard,} from "../controllers/users.controller.js";

module.exports = function(app) {
  app.use(function(req, res, next) {

    
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    
    next();
  });
try {
  
  app.get("/api/users", allAccess);
} catch (error) {
  console.log(error + " " +error.message);
}

  app.get(
    "/api/users/user",
    [authJwt.verifyToken],
    userBoard
  );

  app.get(
    "/api/test/mod",
    [authJwt.verifyToken, authJwt.isModerator],
    moderatorBoard
  );

  app.get(
    "/api/test/admin",
    [authJwt.verifyToken, authJwt.isAdmin],
    adminBoard
  );
};

/* // Importing
const express = require("express");
const router = express.Router();
import {method as userController} from '../controllers/users.controller.js';


// GET REQUESTS

router.get('/', userController.getUsers );    


router.get('/:userId', userController.getOneUser );



//POST REQUESTS

router.post('/',userController.logUser );    







//PATCH REQUESTS

router.patch('/users', userController.updateUser);




//DELETE REQUESTS

router.delete('/:usersId',(req,res,next) => {
    const id = req.params.usersId;

    if(id === 'special')
    {
        res.status(200).json({
            message : "hey  you have sent an special to delete"
        })
    }
    else{

        res.status(200).json({
            message : "your are trying to delete this:",
            id: id
        })
    }
});                                                                                                                                                                                                                                         


// Exporting

module.exports = router; */