import {cre, getSection} from "../helpers/section.helper.js"

const createSection = async (req,res)=>{
    try{
        console.log(req.body);
        const result = await cre(req,res);
        console.log(result);
        return result
    }catch(error){
        console.log(error);
        
    }
}
const findParticularSection = async(req,res) => {
    try {


    const result = await getSection(req,res);

    } catch (error) {
        console.log(error);
        
    }
};

export {
    createSection,
    findParticularSection,
};