import { findOneUser, findOneEmail } from '../helpers/auth.helper';

const ROLES = ["usuario","moderador","administrador"];

const checkDuplicateUsernameOrEmail =  (req, res, next) => {
        //username check
        console.log("check dulicate");
        findOneUser(req,res)
            .then(user => {
                console.log( user);
                if(user){
                    return res.status(400).send({
                        message : "usuario ya existente"
                    });
                    
                }
            }
           

        );

        findOneEmail(req,res)
        .then(user => {
            // console.log(user.body);
            console.log(user);
            if(user){
               return res.status(400).send({
                    message: "email ya existente"
                });
            }
        })
       
        next();
        };

const checkRolesExisted = (req,res,next) =>{
    console.log("check roles");
            if(req.body.roles){
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
module.exports = verifySighnUp;