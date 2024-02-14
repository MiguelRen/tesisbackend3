import moment from "moment-timezone";
import pool from "../database/database.js"




 export const cre= async (req,res) => {
    try {
    //    console.log("bleble");
       const dates = [
        req.body.dateStart,
        req.body.dateEnd,

        ];

       
        

        const sql =
        "INSERT INTO tabperiod\
         (peryearstart,peryearend)\
         VALUES \
         ($1,$2)";
        // const connection = await getConnection();
        const result = await pool.query(sql,dates);
        // connection.realease;
        return Promise.resolve(result);
    } catch (error) {
        console.log(error);
        return Promise.reject(error);
    }
 };

 export const get = async (req,res) => {
    try {
       
        // console.log("kgjsdfhgdfjkgh");
        const sql = "SELECT * FROM tabperiod"
        // const connection = await getConnection();
        const result = await pool.query(sql);
        // console.log(result.rows);

       const convertedDates = result.rows.map(item =>{
        return{
        ...item,
        peryearstart :  new Date(item.peryearstart).toLocaleDateString(),
        peryearend : new Date(item.peryearend).toLocaleDateString()
     }
    });
    //    console.log(convertedDates);

        // console.log(perperiodid,peryearstart, peryearend);
        res.status(200).json(convertedDates);
        return Promise.resolve(result);
    } catch (error) {
        return error;
    }
 };

 export const cur = async (req,res) => {

     try {
         const subresult = await maxPeriod();
        //  console.log(subresult);
  
        const periodStart = subresult.peryearstart;
        const periodEnd = subresult.peryearend;
            // console.log(periodStart,periodEnd);
            const sql =
            "SELECT * FROM tabperiod WHERE current_date BETWEEN $1 AND $2 ;";
            // const connection = await getConnection();
            const result = await pool.query(sql,[periodStart,periodEnd]);
            // const toSend = result.rows[0];
            // const perperiodid =  result.rows[0].perperiodid; 
            // const peryearstart = result.rows[0].peryearstart.toLocaleDateString();
            // const peryearend = result.rows[0].peryearend.toLocaleDateString();
            // connection.release;
            // const resultToSend = {perperi    odid,peryearstart,peryearend};
            // console.log(result.rows);
            const convertedDates = result.rows.map(item =>{
                return{
                    ...item,
                    peryearstart : new Date(item.peryearstart).toLocaleDateString(),
                    peryearend : new Date(item.peryearend).toLocaleDateString(),
                }
            });
            // console.log(convertedDates);
            res.status(200).json(convertedDates);
            
            // res.send('yoo hooo');
            // return Promise.resolve(result);

            // console.log( "there is no Period in there");

    } catch (error) {
        console.log(error);
            //  res.status(500).json({error : error.message});

    }
 };

 export const upd = async (req,res) => {
    try {
        console.log("im in the upd");
    } catch (error) {

    }
 };

 export const del = async (req,res) => {
    try {
        console.log("im in the del");
    } catch (error) {

    }
 };
 const maxPeriod = async ()=>{
    try {
 
        const sql =
        "Select * from tabperiod where peryearend = (Select MAX(peryearend) from tabperiod); "
        // "Select * from tabperiod ; ";
        // const connection = await getConnection();
        const  result= await pool.query(sql);
       
   
        // connection.release;
     
            return result.rows[0];
        

    } catch (error) {
        console.log(error);
        return error
    }
 };
//  exist();

// cur();