import { cre, get,cur, upd, del } from "./../helpers/period.helper.js";

const createPeriod = async (req, res) => {
  try {
    const result = await cre(req, res);
    return result;
  } catch (error) {
    console.log(error);
  }
};

const getPeriod = async (req,res)=>{
   try {
   const result =  await get(req,res);
   // console.log(result);
   return Promise.resolve(result);
   } catch (error) {
      return error;
   }
};
const getCurrentPeriod = async (req,res)=>{
   try {
      // console.log(req);
      // console.log("im inside period controller");
   const result =  await cur(req,res);
   // console.log(result);
   return Promise.resolve(result);
   } catch (error) {
      return error;
   }
};
const updatePeriod = async (req,res) => {
   try {
      const result = await upd(req,res);
      return result;
   } catch (error) {
      return error;
   }
};

const deletePeriod = async (req,res) => {
   try {
      const id = req.params.id;
      
      const result = await del(req,res);
      return result;
   } catch (error) {
      return error;
   }
}; 

export {
 createPeriod,
 getPeriod,
 getCurrentPeriod,
 updatePeriod,
 deletePeriod
}