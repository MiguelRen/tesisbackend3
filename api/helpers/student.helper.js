import  getConnection  from "../database/database.js";
import pool from "../database/database.js";
const cre = async (req,res) => {
    try {
        const data = [
            req.body.studentId,
            req.body.student1Name,
            req.body.student2Name,
            req.body.student1LastName,
            req.body.student2LastName,
            req.body.studentBirthday,
            req.body.studentAddress,
            req.body.studentPhoneNumber,
            req.body.studentEmail,
            req.body.studentGender
            
        ];
        
        console.log(data);
        
        const sql =
        "INSERT INTO tab_student\
        (stu_studentid,stu_student1name ,stu_student2name,stu_student1lastname,stu_student2lastname ,stu_studentbirth,stu_studentadress,stu_studentphone,stu_studentemail,stu_studentgender)\
        VALUES\
        ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10);"
        ;
        
        const result = await pool.query(sql,data);
       
        return result;
    } catch (error) {
        console.log(error);
        return error;
    }



}

const get = async (req, res) =>{
    const sql= 'select * from tab_student '
    const result = await pool.query(sql);
    
    res.status(200).json(result.rows);
}

const getOneStudent = async (req,res) =>{
    try {
        const studentId = [(req.params.id)];
         
        if(studentId){
            console.log("studentId \n" + studentId);
            const sql = "select * from tab_student where tab_student.stu_studentid = $1"
            const result = await pool.query(sql,studentId);
            console.log(result.rows);
            res.status(200).json(result.rows[0]);
        }
        
    } catch (error) {
        console.log(error);
        
    }
}
const getList = async(req, res) =>{
    const sql = "SELECT * FROM tab_student \
    INNER JOIN link_sectionstudent ON link_sectionstudent.sectionstudent_student = tab_student.stu_studentid \
    INNER JOIN tab_section ON tab_section.sec_sectionid = link_sectionstudent.sectionstudent_section \
    WHERE tab_section.sec_sectionid = $1"
   
    const sectionId = [req.params.id];
   console.log(sectionId);
   
    const result = await pool.query(sql, sectionId )
    console.log(result.rows);
    
}

export{
    cre,
    get,
    getOneStudent,
    getList
};