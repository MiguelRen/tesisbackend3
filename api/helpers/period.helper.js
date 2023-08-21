import moment from "moment-timezone";
import getConnection from "../database/database.js"


 export const cre= async (req,res) => {
    try {
       console.log(req.body);
       const dates = [
        req.body.yearIni,
        req.body.yearEnd,
        
        ];

        const sql = 
        "INSERT INTO tabperiod\
         (perYearIni,perYearEnd)\
         VALUES \
         (?,?)";
        const connection = await getConnection();
        const result = await connection.query(sql,dates);
        connection.realease;
        return Promise.resolve(result);
    } catch (error) {
        console.log(error);
        return Promise.reject(error);
    }
 };
  
 export const get = async (req,res) => {
    try {
        const sql = "SELECT * FROM tabperiod"
        const connection = await getConnection();
        const [data, metadata] = await  connection.query(sql);
        connection.release;
        return data;
    } catch (error) {
        return error;
    }
 };
 export const cur = async (req,res) => {
   
    try {
        // console.log("im inside period helper");

        const existed = await exist();
       console.log(existed);
        if(existed){
            const data= [
                existed.quaQuarterIni,
                existed.quaQuarterEnd,
                
            ];
            data[0]= moment(data[0]);
            data[1]= moment(data[1]);
               
            
            data[0]= data[0].tz('America/New_York').format('YYYY-MM-DD');
            data[1]= data[1].tz('America/New_York').format('YYYY-MM-DD');
            console.log(data);
             
           
            
            
            
            const sql = 
            "SELECT * FROM tabquarter WHERE CURDATE() BETWEEN ? AND ? ;"
            const connection = await getConnection();
            const [result] = await  connection.query(sql,data);
            console.log(result[0]);
            connection.release;
            return res.status(200).send(result[0]);
        }else{ 
            console.log( "there is no Period in there");
            return res.status(500).send("there is no Period in there");
        }
    } catch (error) {
        console.log(error);
        return error;
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
        "Select * from tabperiod where quaQuarterIni = \
        (select MAX(quaQuarterIni) from tabquarter) ; "
        const connection = await getConnection();
        const  [result, metadata ]= await connection.query(sql);
    //    console.log(result[0]);
        connection.release;
        if (result[0]){
            console.log("im here");
            return result[0];
        }else{
            return false;
        }
        
    } catch (error) {
        console.log(error);
        return error
    }
 };


