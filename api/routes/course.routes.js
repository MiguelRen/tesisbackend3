
import  express from "express";
import  {createCourse}  from "../controllers/course.controller.js"

const router = express.Router();
// const middle = (req,res)=>{ console.log("buajajaj");console.log(req.body);  next()}

router.post('/',  createCourse);


module.exports = router;