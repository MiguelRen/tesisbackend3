import  express from "express";
import  {createQuarter, findCurrentQuarter}  from "../controllers/quarter.controller.js"

const router = express.Router();
// const middle = (req,res)=>{ console.log("buajajaj");console.log(req.body);  next()}

router.post('/',  createQuarter);
router.get('/current',findCurrentQuarter)

export default router;