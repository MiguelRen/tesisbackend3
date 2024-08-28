import { cre , getPeriods , cur } from "./../helpers/course.helper.js";

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
 const getCoursePeriods = async (req,res) =>{
    try {
        console.log("jejejje");
        
        const result = await getPeriods(req,res);
    
        return 
    } catch (error) {
        console.log(error);
        
    }
 }

 const getParticularCourses = async (req,res)=>{
    console.log(req.params.id);
    
    const result = await cur(req.params.id);
    // console.log(result);
    
 }
 
export {
    createCourse,
    getCoursePeriods,
    getParticularCourses,
};