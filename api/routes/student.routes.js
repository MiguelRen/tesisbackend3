import express from "express";
import {createStudent,getStudent, getParticularStudent, getStudentBySection} from '../controllers/student.controller.js';

const router = express.Router();

router.post('/', createStudent);
router.get('/', getStudent);
router.get('/:id', getParticularStudent);
router.get('/section/:id',getStudentBySection);
export default router; 
