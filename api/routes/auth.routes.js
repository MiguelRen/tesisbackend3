import { verifySignUp } from "../middleware";
import {signin,signup} from "./../controllers/auth.controller";
import express from "express";

const router = express.Router();

router.post(
    "/signup",
    [
      verifySignUp.checkDuplicateUsernameOrEmail,
      verifySignUp.checkRolesExisted
    ]
    ,
    signup
  );
   
  router.post("/signin", signin );
 

module.exports = router;


    // module.exports = function(app) {
    //   app.use(function(req, res, next) {
    //     res.header(
    //       "Access-Control-Allow-Headers",
    //       "x-access-token, Origin, Content-Type, Accept"
    //     );
    //     next();
    //   });
    // };