//importing
import express from 'express';
import morgan from 'morgan';
import bodyParser from 'body-parser';
import cors from 'cors';


import userRoutes from './api/routes/users.routes.js';
import authRoutes from './api/routes/auth.routes.js';
import periodRoutes from './api/routes/period.routes.js';
// import periodCurrentRoutes from "./api/routes/period.routes.js"
import courseRoutes from './api/routes/course.routes.js';
import sectionRoutes from './api/routes/section.routes.js';
import studentRoutes from './api/routes/student.routes.js';
import employeeRoutes from './api/routes/employee.routes.js';
import quarterRoutes from './api/routes/quarter.routes.js';


//storind express into the app
export const app = express();
//pre-routing
// import {auth.routes.js} from './api/routes/auth.routes.js';
// import {auth.routes.js} from './api/routes/users.routes.js';


//middleware
// app.use(express.json()); este eslo mismo que bodyParser
app.use(cors());
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());


app.use('/api/user', userRoutes);
app.use('/api/auth' , authRoutes);
app.use('/api/period',periodRoutes);
app.use('/api/course',courseRoutes);
app.use('/api/section', sectionRoutes);
app.use('/api/student',studentRoutes);
app.use('/api/employee',employeeRoutes);
app.use('/api/quarter',quarterRoutes);
// app.use('/api/quarter/current',quarterRoutes);


// error handling
app.use((req,res, next) => {
    // console.log("error1");
    const error = newError('Not Found');
    error.status= 404;
    next(error);

});

app.use((error,req,res,next) => {

    res.status(error.status || 500);
    res.json({
        error:{
            message:error,
            message: error.message
        }
    })
});

export default  app;
