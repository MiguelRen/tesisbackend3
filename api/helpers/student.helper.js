import  getConnection  from "../database/database.js";

const cre = async (req,res) => {
    console.log(req.body);
    try {
        const data = [
            req.body.stu1Name,
            req.body.student2Name,
            req.body.student1LastName,
            req.body.student2LastName,
            req.body.studentBirthday,
            req.body.studentAddress,
            req.body.studentPhoneNumber,
 
        ];
        const sql =
        "INSERT INTO tabstudent\
        (stuFirstName,stuSecondName,stuFirstLastName,stuSecondlastName,stuBirthday,stuAddress,stuPhoneNumber)\
        VALUES\
        (?,?,?,?,?,?,?)"
        ;
        const connection = await getConnection();
        const result = await connection.query(sql,data);
        connection.release;
        return result;
    } catch (error) {
        console.log(error);
        return error;
    }

}
export{
    cre,
};