
import express from "express";
import {createPeriod, getPeriod,getCurrentPeriod, updatePeriod, deletePeriod} from '../controllers/period.controller.js';

const router = express.Router();
// function data(req,res,next){
//     console.log(req);
//     next();
// }

// // router.post('*',data);

// router.post("/",data);

router.post('/',createPeriod);
router.get('/', getPeriod); 
router.get('/current',getCurrentPeriod);
router.put('/',updatePeriod);
router.delete('/:id',deletePeriod);

export default  router;