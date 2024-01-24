import moment from "moment-timezone";
import pool from "../database/database.js"


 export const cre= async (req,res) => {
    try {
    //    console.log("bleble");
       const dates = [
        req.body.dateStart,
        req.body.dateEnd,

        ];

        console.log(req.body.dateStart,
        req.body.dateEnd,);

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
        // connection.release;
        console.log(result.rows);
        res.status(200).json(result.rows);
        return Promise.resolve(result);
    } catch (error) {
        return error;
    }
 };

 export const cur = async (req,res) => {

// console.log(req.body);
    try {
        // // console.log(req);
        const subresult = await exist();
        const periodStart = subresult.peryearstart;
        const periodEnd = subresult.peryearend;
            // console.log(period);
            const sql =
            "SELECT * FROM tabperiod WHERE current_date BETWEEN $1 AND $2 ;";
            // const connection = await getConnection();
            const result = await pool.query(sql,[periodStart,periodEnd]);
            const toSend = result.rows[0];
            // connection.release;
            res.status(200).json(toSend);
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
 const exist = async ()=>{
    try {

        const sql =
        "Select  * from tabperiod where peryearend = (Select MAX(peryearend) from tabperiod); "
        // const connection = await getConnection();
        const  result= await pool.query(sql);
    //    console.log(result.rows);
        // connection.release;
        if (result){
            // console.log("im here");
            // console.log(result.rows[0]);
            return result.rows[0];
        }else{
            return false;
        }

    } catch (error) {
        console.log(error);
        return error
    }
 };
//  exist();

// cur();