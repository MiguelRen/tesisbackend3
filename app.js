//importing
import express from 'express';
import morgan from 'morgan';
import bodyParser from 'body-parser';
import cors from 'cors';


import userRoutes from './api/routes/users.routes.js';
import authRoutes from './api/routes/auth.routes.js';

//storind express into the app
const app = express();
//pre-routing
// import {auth.routes.js} from './api/routes/auth.routes.js';
// import {auth.routes.js} from './api/routes/users.routes.js';


//middleware
// app.use(express.json()); este eslo mismo que bodyParser
app.use(cors());
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

// app.use((req,res,next) => {
//     res.header('Access-Control-Allow-Origin' , '*' );
//     res.header('Access-Control-Allow-Headers' , 
//     'Origin, X-Requested-With, Content-Type, Accept, Authorization');
//     if(req.method ==='OPTIONS'){
//         res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');
//         return res.status(200).json({});
//     };
//     next();
// });
app.use('/api/users', userRoutes);
app.use('/api/auth' , authRoutes);




// error handling
app.use((req,res, next) => {
    const error = newError('Not Found');
    
    error.status= 404;
    next(error);

});

app.use((error,req,res,next) => {
    res.status(error.status || 500);
    res.json({
        error:{
            
            message: error.message
        }
    })
});

module.exports = app ;