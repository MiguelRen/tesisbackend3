
import {cre} from "../helpers/student.helper.js";


const createStudent = async (req,res) => {
    try {
        console.log(req.body);
        const result = await cre(req,res);
        return result;
    } catch (error) {
        console.log(error);
        return error;
        
    }

};

module.exports = createStudent;