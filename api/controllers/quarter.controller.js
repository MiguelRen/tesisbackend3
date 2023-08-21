import {cre,cur} from "../helpers/quarter.helper.js"

const createQuarter = async (req,res)=>{
    console.log(

        "quartecontroller create"
    );
    try{
        console.log(req.body);
        const result = await cre(req,res);
        // console.log(result);
        return result
    }catch(error){
        return error;
    }
}

const findCurrentQuarter = async (req,res)=>{
    // console.log(req.body);
    // console.log(res.body);
    console.log(

        "quartecontroller findcurrent"
    );
    try{ 

        // console.log(req.body);
        const result = await cur(req,res);
        // console.log(result);
        return result
    }catch(error){
        console.log(error);
        return error;
    }
};

export {
    createQuarter,
    findCurrentQuarter,  
};