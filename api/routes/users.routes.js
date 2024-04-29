import { authJwt } from "../middleware/index.js";
import  {getUser,getUserAll,addUser,updUser,delUser} from "../controllers/users.controller.js";
import express from "express";

const router = express.Router();



router.get('/',getUser);

router.get('/all',getUserAll);

router.post('/',addUser);




 router.put('/',updUser);

 router.delete('/',delUser);
 
 export default  router;




