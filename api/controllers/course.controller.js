import { cre } from "./../helpers/course.helper.js";

 const createCourse = async (req, res) => {
   
    try{
        console.log(req.body);
        const result = await cre(req,res);
        return result;
    }catch(error){
        console.log("doble rrror");
        return error;
    }
}

export {
    createCourse,
};