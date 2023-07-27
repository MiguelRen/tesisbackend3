import {cre} from "../helpers/section.helper.js"

exports.createSection = async (req,res)=>{
    try{
        console.log(req.body);
        const result = await cre(req,res);
        console.log(result);
        return result
    }catch(error){
        return error;
    }
}