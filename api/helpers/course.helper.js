import getConnection  from "../database/database.js"

export const cre = async(req,res) => {
    try{
        console.log(req.body);
        const sql = 
        "INSERT INTO tabcourse \
        (couCourseName,couCoursePeriod)\
        values \
        (?,4)"; 
        const data = req.body.courseName;
        const connection =  await getConnection();
        const result = connection.query(sql,data);
        connection.release;
        console.log(result);
        return Promise.resolve(result)
    }catch(error){
        return Promise.reject(error);
    }
}