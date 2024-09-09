import { Connection } from "promise-mysql";
import  pool  from "../database/database.js"


export const cre = async (req,res) => {
    try {
        const data = [
            req.body.courseCreationSection,
            req.body.sectionCreationSection,
        ];  
        console.log(data);
        
        const sql = 
        "INSERT INTO tab_section \
        (sec_sectioncourseid_fk,sec_sectionname)\
        values\
        ($1,$2)";
        
        const result =  await pool.query(sql,data);
        console.table(result);
        return result;
        
    } catch (error) {
        console.log(error);
        
    }
};

export const getSection = async (req,res) => {
    try {
        const courseId = [req.params.id];
        console.log(courseId);
        
        const sql = "SELECT * FROM tab_section INNER JOIN tab_course ON tab_section.sec_sectioncourseid_fk = tab_course.cou_courseid   WHERE cou_courseid = $1";
        const result = await pool.query (sql,courseId)
        res.status(200).json(result.rows);
        return
        
    } catch (error) {
        console.log(error);
        
    }
};