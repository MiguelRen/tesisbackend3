import { verifySignUp } from "../middleware/index.js";
import {signin,signup} from "./../controllers/auth.controller.js";
import express, { request } from "express";

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
    
  router.post("/signin",signin );
 

export default router;

