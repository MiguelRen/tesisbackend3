import express  from "express";
import {createSection} from "../controllers/section.controller.js"

const router = express.Router();
router.post("/",createSection)

export default router;