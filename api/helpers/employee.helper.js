import { getConnection } from "../database/database.js";

export const cre = async (req, res) => {
  try {
    const data = [
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
      "insert into tabemployee\
        (empEmployeeFirstName,empEmployeeSecondName,empEmployeeFirstLastName,empEmployeeSecondLastName,\
            empEmployeeBirthday,empEmployeeDirection,empEmployeePhoneNumber,empEmployType,empEmployStatus)\
        values\
        (?,?,?,?,?,?,?,?,?)";
    const connection = await getConnection();
    const result = await connection.query(sql,data);
    connection.release;
    // console.log(result);
    return result;
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
        " select * from  tabemployee;"
      const connection = await getConnection();
      const [result, meta] = await connection.query(sql);
      connection.release;
      // console.log(result);  
      return res.end(JSON.stringify(result));
    } catch (error) {
      console.log(error);
      return error;
    }
  }
;
