import express from "express";
import {createStudent,getStudent} from '../controllers/student.controller.js';

const router = express.Router();

router.post('/', createStudent);
router.get('/', getStudent);
export default router; 
