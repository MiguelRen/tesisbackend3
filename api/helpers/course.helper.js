import getConnection  from "../database/database.js"
import pool from "../database/database.js";

export const cre = async(req,res) => {
    try{
        console.log(req.body);
        
        const newCourseName = req.body.courseName;
        const newCourseType = req.body.courseType;
        const newCoursePeriod = req.body.coursePeriod;

        const sql = 
        "INSERT INTO tab_course \
        (cou_coursename, cou_coursetype, cou_courseperiodid_fk)\
        values \
        ($1,$2,$3)"; 
        

        const result = await pool.query(sql,[newCourseName,newCourseType, newCoursePeriod]);
     
        console.log(result);
        
    }catch(error){
        console.log(error);
        
    }
}