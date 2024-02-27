import  pool from "../database/database.js";

export const cre = async (req, res) => {
  try {
    const data = [
      req.body.employeeid,
      req.body.employee1LastName,
      req.body.employee1Name,
      req.body.employee2LastName,
      req.body.employee2Name,
      req.body.employeeBirthday,
      req.body.employeeDirection,
      req.body.employeePhone,
      req.body.employeeStatus,
      req.body.employeeType,
    ];
    console.log(data);
    const sql =
      "insert into tab_employee\
        (emp_employeeid, \
          emp_employee1name,\
          emp_employee2name,\
          emp_employee1lastname,\
          emp_employee2lastname,\
          emp_employeebirth,\
          emp_employeeadress,\
          emp_employeephone,\
          emp_employeestatus,\
          emp_employeetype)\
        values\
        ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)";

    const result = await pool.query(sql,data);
    // connection.release;
    // console.log(result);
    return result.rows;
  } catch (error) {
    console.log(error);
    return error;
  }
};

export const get = async (req, res) => {
    // console.log(req.body);
    try {
      
      // console.log(data);
      const sql =
        " select * from  tab_employee;"
     
      const result = await pool.query(sql);
   
      // console.log(result.rows);  
      return res.status(200).json(result.rows);
    } catch (error) {
      console.log(error);
      return error;
    }
  }
;
