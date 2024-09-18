
import {cre,get, getOneStudent, getList} from "../helpers/student.helper.js";


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

const getParticularStudent = async (req,res) =>{
    try {
        console.log(req.params.id);
        const result = await getOneStudent(req,res);
        // console.log(result);
        
    } catch (error) {
        console.log(error);
    }
};
const getStudentBySection = async(req,res)=>{
    try {
        const result = await getList(req,res);
        
        
        console.log(result);
        
    } catch (error) {
        console.log(error);
        
    }
};

export {

    createStudent,
    getStudent,
    getParticularStudent,
    getStudentBySection,
} 