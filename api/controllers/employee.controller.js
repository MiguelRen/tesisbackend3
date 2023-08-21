import {cre,get} from "../helpers/employee.helper.js";

const createEmployee = async (req,res)=>{
    try {
        console.log(req.body);
        const result = await cre(req,res);
        return result;
    } catch (error) {
        console.log(error);
        return error;
    }
};

const fetchEmployee = async (req,res)=>{
    // console.log("im in the controller");
    try {
        // console.log(req.body);
        const result = await get(req,res);
        // console.log(result);
        return result;
    } catch (error) {
        console.log(error);
        return error;
    }
};

export {
  createEmployee,
  fetchEmployee,  
};