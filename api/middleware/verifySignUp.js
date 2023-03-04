import { findOneUser, findOneEmail } from '../helpers/auth.helper';

const ROLES = ["usuario","moderador","administrador"];

const checkDuplicateUsernameOrEmail =  (req, res, next) => {
        //username check
        findOneUser(req)
            .then(user => {
                if(user){
                    res.status(400).send({
                        message : "usuario ya existente"
                    });
                    return;
                }
            }
            

        );

        findOneEmail(req)
        .then(user => {
            if(user){
                res.status(200).send({
                    message: "email ya existente"
                });
            }
        })
       
        next();
        };

const checkRolesExisted = (req,res,next) =>{
            if(req.body.roles){
                for(let i=0; i <req.body.roles.lenght; i++){
                    if(!ROLES.includes(req.body.roles[i])){
                        res.status(400).send({
                            message:"rol no existente = "+ req.body.roles[i]
                        });
                        return;
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