import express from "express";
import {createEmployee, getEmployee} from "../controllers/employee.controller.js"


const router = express.Router();

router.post("/", createEmployee);
router.get ("/",  getEmployee);

export default router;