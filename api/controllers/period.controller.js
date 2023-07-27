import { cre, get,cur, upd, del } from "./../helpers/period.helper";

exports.createPeriod = async (req, res) => {
  try {
    const result = await cre(req, res);
    return result;
  } catch (error) {
    console.log(error);
  }
};

exports.getPeriod = async (req,res)=>{
   try {
   const result =  await get(req,res);
   return result;
   } catch (error) {
      return error;
   }
};
exports.getCurrentPeriod = async (req,res)=>{
   try {
      // console.log(req);
      // console.log("im inside period controller");
   const result =  await cur(req,res);
   // console.log(result);
   return result;
   } catch (error) {
      return error;
   }
};
exports.updatePeriod = async (req,res) => {
   try {
      const result = await upd(req,res);
      return result;
   } catch (error) {
      return error;
   }
};

exports.deletePeriod = async (req,res) => {
   try {
      const result = await del(req,res);
      return result;
   } catch (error) {
      return error;
   }
}; 