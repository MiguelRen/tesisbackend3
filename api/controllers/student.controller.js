
import {cre,get} from "../helpers/student.helper.js";


const createStudent = async (req,res) => {
    try {
     
        const result = await cre(req,res);
        return result;
    } catch (error) {
        console.log(error);
        return error;
        
    }

};
const getStudent = async(req,res) => {
    try {
        const result = await get(req,res)
        return result;
    } catch (error) {
        console.log(error);
    }
};

export {

    createStudent,
    getStudent,
} 