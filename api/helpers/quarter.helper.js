import moment from "moment-timezone";

import {getConnection}  from "../database/database.js"

export const cre = async(req,res) => {
    try{
        
        // console.log(req.body);
        const sql = 
        "INSERT INTO tabquarter \
        (quaPeriodId,quaQuarterIni,quaQuarterEnd)\
        values \
        (?,?,?)"; 
        const data =[
            req.body.quarterPeriod,
            req.body.trimIni,
            req.body.trimEnd
        ];  
        // console.log(data);

        const connection =  await getConnection();
        const result = await connection.query(sql,data);
        connection.release;
    // console.log(result[0]);
        return Promise.resolve(result[0]);
    }catch(error){
        console.log(error);
        return Promise.reject(error);
    }
}
export const cur = async (req,res) =>{
    // console.log(req);
    try{
        const exist = await existed();

       if (!exist) {
            return exist
        }else{
            const data= [
                exist.quaQuarterIni,
                exist.quaQuarterEnd,
                
            ];
            data[0]= moment(data[0]);
            data[1]= moment(data[1]);
               
            
            data[0]= data[0].tz('America/New_York').format('YYYY-MM-DD');
            data[1]= data[1].tz('America/New_York').format('YYYY-MM-DD');
             
        //    console.log(data);
            const sql = 
            "SELECT * FROM tabquarter \
            inner join tabperiod \
            on tabquarter.quaPeriodId = tabperiod.perPeriodId \
            WHERE CURDATE() BETWEEN ? AND ? ;"
            const connection = await getConnection();
            const [result,metadata] = await  connection.query(sql,data);
            // console.log(result);
            connection.release;
            return res.end(JSON.stringify(result[0]))
        }
        
    }
    catch(error){
        console.log(error);
        return error
    }
 }

 export const existed = async (req,res) =>{
     try {
    
        const sql = "\
        select * from tabquarter \
        where quaQuarterIni = (select max (quaQuarterIni) from tabquarter) ;"
    
        const connection = await getConnection();
        const [result,metadata] = await connection.query( sql);
 
        connection.release;
        // console.log(result);
        // console.log(metadata);
        // for (let index = 0; index < result.length; index++) {
            
        //     console.log("eexisted? "+ result[index]);
        // }
            
        return result;
    
    } catch (error) {
console.log(error);
        return error;

    }
 }

