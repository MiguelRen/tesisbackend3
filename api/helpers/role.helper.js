import pool from "../database/database.js"

export const getRole = async (user) => {
    try {
      
  
      const sql =
      " select \
        list_role.rol_rolename \
        from \
        list_role \
        inner join \
        link_userrole \
        on \
        list_role.rol_roleid = link_userrole.userrole_listroleid_fk \
        inner join \
        tab_user \
        on \
        link_userrole.userrole_tabuserid_fk = tab_user.use_userid \
        where \
        tab_user.use_userid = \$1";
      // const connection = await getConnection();
      const dbresponse = await pool.query(sql, [user.use_userid]);
      // connection.release;
      const result = dbresponse.rows;
      // console.log(result);
      return result;
    } catch (error) {
      console.error(error);
    }
  };
  
  // export const findByPk = async (userId) => {
  //   try {
  //     // const connection = await getConnection();
  //     const dbresponse = pool.query(
  //       "SELECT * FROM tab_user WHERE use_userid = \$1",
  //       userId
  //     );
  //     // connection.release;
  
  //     return res.status(200).json(result);
  //   } catch (error) {
  //     res.status(500);
  //     res.send(error.message);
  //   }
  // };
  