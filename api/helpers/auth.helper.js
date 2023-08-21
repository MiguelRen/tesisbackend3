import  json  from "body-parser";
import  getConnection  from "./../database/database.js";
import bcrypt from "bcryptjs";

export const findOneUser = async (req, res) => {
  try {
    const username = req.body.username;
    const connection = await getConnection();
    const sql = "SELECT * FROM tabuser WHERE username = ?";
    const [result, metadata] = await connection.query(sql, username);
    connection.release;
    return new Promise((resolve) => resolve(result[0]));
  } catch (error) {
    console.log("findoneuser");
    return new Promise((resolve) =>
      resolve(res.status(401).send({ message: error.message }))
    );
  } finally {
  }
};

export const findOneEmail = async (req, res) => {
  try {
    const email = req.body.email;
     
    const connection = await getConnection();
    const [result, metadata] = await connection.query(
      "SELECT username FROM tabuser WHERE userEmail = ?",
      email
    );
    connection.release;

    return result[0];
  } catch (error) {
     return res.status(401).send(error.message);
  }
};
export const findByPk = async (userId) => {
  try {
    const connection = await getConnection();
    const result = connection.query(
      "SELECT * FROM tabuser WHERE id = ?",
      userId
    );
    connection.release;

    return res.status(200).json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

// create new user
export const create = async (req, res) => {
  const username = req.body.username;
  const email = req.body.email;
  const password = bcrypt.hashSync(req.body.password, 8);
  // const dateTime = new Date();
  // console.log(username,email,password);
  try {
    const connection = await getConnection();
    const sql1 =
      "INSERT INTO tabuser (username,userEmail,userPassword) VALUES (?,?,?)"; 
      const result1 = await connection.query(sql1, [username, email, password]);

      const sql2 =
        "INSERT INTO linkuserrole (userroleUserId) VALUES (?)";

      const result2= await connection.query(sql2, [result1[0].insertId]);


    connection.release;
 
    return result2;
    // return res.status(200).send("usuario registrado");
  } catch (error) {
    
    return res.status(418).send(error.message);
  }
};
// find all users

export const findAll = async (req) => {
  try {
    const role = req.body.role;

    const connection = await getConnection();
    const result = await connection.query(
      "SELECT * FROM listRoles WHERE name = ?",
      role
    );
    res.status(200).send("rol encontrado");
    connection.release;
    return result;
  } catch (error) {
    return res.status(500).send(error.message);
  }
};

export const getRole = async (user) => {
  try {
    

    const sql =
    " select \
      listrole.roleName \
      from \
      listrole \
      inner join \
      linkuserrole \
      on \
      listrole.roleId = linkuserrole.userroleRoleId \
      inner join \
      tabuser \
      on \
      linkuserrole.userRoleUserId = tabuser.userId \
      where \
      tabuser.userId = ? ;";
    const connection = await getConnection();
    const [result, metadata] = await connection.query(sql, user.userId);
    connection.release;
    console.log("get role");
    console.log(result);
    return result;
  } catch (error) {
    console.error(error);
  }
};
