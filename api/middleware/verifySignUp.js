import { findOneUser, findOneEmail } from '../helpers/auth.helper.js';

const ROLES = ["usuario","moderador","administrador"];

const checkDuplicateUsernameOrEmail = async (req, res, next) => {
        //username check
        const user = await findOneUser(req,res);
        const email = await findOneEmail(req,res)
           
    
                if(user){
                    return res.status(400).send({
                        message : "usuario ya existente"
                    });
                    
                }
            
 
            if(email){
               return res.status(400).send({
                    message: "email ya existente"
                });
            }
       
       
        next();
        };

const checkRolesExisted = (req,res,next) =>{
        console.log("im in the role checking");
            if(req.body.roles){
                console.log("im more in the role checking");
                for(let i=0; i <req.body.roles.lenght; i++){
                    if(!ROLES.includes(req.body.roles[i])){
                       return  res.status(400).send({
                            message:"rol no existente = "+ req.body.roles[i]
                        });
                        
                    }
                }
            }
            next();
        };
       
const verifySighnUp ={
    checkDuplicateUsernameOrEmail : checkDuplicateUsernameOrEmail,
    checkRolesExisted : checkRolesExisted
}
export default verifySighnUp;