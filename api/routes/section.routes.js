import express  from "express";
import {createSection, findParticularSection} from "../controllers/section.controller.js"

const router = express.Router();
router.post("/",createSection)
router.get("/:id",findParticularSection)

export default router;