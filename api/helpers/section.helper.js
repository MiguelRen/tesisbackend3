import { Connection } from "promise-mysql";
import  getConnection  from "../database/database.js"


export const cre = async (req,res) => {
    try {
        const data = [
            req.body.sectionName,
            req.body.courseFrom
        ];  
        const sql = 
        "INSERT INTO  tabsection \
        (secSectionName,secCourseId)\
        values\
        (?,?)";
        const connection = await getConnection();
        const result =  await connection.query(sql,data);
        connection.release;
        console.table(result);
        return result;
        
    } catch (error) {
        return error;
    }
};