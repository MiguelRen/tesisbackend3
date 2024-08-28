import getConnection  from "../database/database.js"
import pool from "../database/database.js";
import moment from "moment-timezone";

export const cre = async(req,res) => {
    try{
        // console.log(req.body);
        
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

export const getPeriods = async (req,res) =>{
    try {
        const sql = 
        "select * from tab_period inner join tab_course on tab_period.perperiodid = tab_course.cou_courseperiodid_fk;";

        const result = await pool.query(sql);
        
        
       console.log(result);
       
        const convertedResult = result.rows.map( item =>{
            return{
                ...item,
                peryearstart : new Date(item.peryearstart).toLocaleDateString(),
                peryearend : new Date(item.peryearend).toLocaleDateString()
            }

        });
console.log(convertedResult);

        res.status(200).json(convertedResult);
        // return Promise.resolve(result)

    } catch (error) {
        console.log(error);
        
    }
}
export const cur = async (periodId)=>{
    try{
        const sql= "\
        select * from tab_course where cou_courseperiodid_fk = $1 \
        "
        const result = await pool.query(sql,[periodId]);
        console.log(result.rows);
        
    }
    catch(error){
        console.log(error);
    }

    return periodId;
    
}