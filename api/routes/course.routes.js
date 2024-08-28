
import  express from "express";
import  {createCourse , getCoursePeriods , getParticularCourses}  from "../controllers/course.controller.js"


const router = express.Router();
// const middle = (req,res)=>{ console.log("buajajaj");console.log(req.body);  next()}

router.post('/',  createCourse );
router.get('/', getCoursePeriods );
router.get('/:id' , getParticularCourses);


export default  router;