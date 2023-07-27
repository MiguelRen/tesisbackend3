import { verifySignUp } from "../middleware";
import {signin,signup} from "./../controllers/auth.controller";
import express from "express";

const router = express.Router();

router.post(
    "/signup",
    [
      verifySignUp.checkDuplicateUsernameOrEmail,
      // verifySignUp.checkRolesExisted
    ]
    ,
    signup
  );
    
  router.post("/signin", signin );
 

module.exports = router;

