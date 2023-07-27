import express from "express";
import {createEmployee, fetchEmployee} from "../controllers/employee.controller.js"


const router = express.Router();

router.post("/", createEmployee);
router.get ("/",  fetchEmployee);

module.exports = router;