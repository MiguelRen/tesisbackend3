import { authJwt } from "../middleware/index.js";
import  {getUser,getUserAll,addUser,updUser,delUser} from "../controllers/users.controller.js";
import express from "express";

const router = express.Router();


//getting info
router.post('/user',getUser);

router.get('/all',getUserAll);



// adding info
router.post('/',addUser);



//updating info
 router.patch('/',updUser);


//deleting info
 router.delete('/',delUser);
 


 export default  router;




