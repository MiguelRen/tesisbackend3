const allAccess = (req, res) => {
    try {
        
        res.status(200).send("Contenido Público.");
        
    } catch (error) {
        console.log(error+ "  "+ error.message);    
    }
  };
  
   
  const userBoard = (req, res) => {
    try {
        res.status(200).send("Contenido de Usuario.");
    
  } catch (error) {
    console.log(error);
  }
  };
  
 const adminBoard = (req, res) => {
    res.status(200).send("Contenido de Administracion.");
  };
  
 const moderatorBoard = (req, res) => {
    res.status(200).send("Contenido de Moderador.");
  };
 
 
module.exports = {
    allAccess,
    userBoard,
    adminBoard,
    moderatorBoard,

};

/* import {getConnection} from "./../database/database.js" 



// GET
 
    //GET ALL USERS
    const getUsers = async (req,res) =>{
        try{
                
                const connection = await getConnection();
                const result = await connection.query("SELECT * FROM usuarios;"); 
                console.log(result);
                res.status(200).json(result);
        }
        catch( error ){
                
                res.status(500);
                res.send(error.message);
        }
       
    };
 
    //GET AN SPECIFIC USER
    const getOneUser = async ( req , res ) => {
        try{

            const { userId } = req.params;
            const connection = await getConnection();
            const result = await connection.query("SELECT * FROM usuarios WHERE nombre = ?", userId );
            console.log(result);
            res.status(200).json(result);
        }
        catch( error ){
            res.status(500);
            res.send(error.message)
        }
    };


//POST
    const logUser = async ( req , res ) => {
        try{

            console.log( req.body);
            const { nombre, clave } = req.body;
            
            if (nombre === undefined || clave === undefined) {
                res.send(body);
                console.log(nombre,clave);
                res.status(400).json({message:"bad request"})
            }
            else{
                
                            const user =  { nombre , clave } ; 
                            console.log(user);
                            const connection = await getConnection();
                            const result = await connection.query("INSERT INTO usuarios SET ?", user );
                            res.status(200).json(result);
            }
           
        }
        catch( error ){
            res.status(500);
            res.json(error.message);
            }

        };

//PATCH

const updateUser = async ( req , res ) => {
    try{

    }
    catch( error ){
        
    }
    console.log("watagatapitusberry");
    const connection = await getConnection();
    const result  = await connection.query("");
    console.log(result);
    res.status(200).json(result);
};

//DELETE

const deleteUser = async ( req , res ) => {
    try{

    }
    catch( error ){
        
    }
    const connection = await getConnection();
    const  result = await connection.query("DELETE user WHERE user = 'req' ");
    console.log(result);
    res.status(200).json(result);
};

export const method={
    getUsers,
    getOneUser,
    logUser,
    updateUser,
    deleteUser
};

 */