//importing
const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');
import cors from 'cors';

const userRoutes = require('./api/routes/users.routes.js')
app.use(cors());

require('./api/routes/auth.routes.js')(app);
require('./api/routes/users.routes.js')(app);
 
//pre-routing


//middleware
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use((req,res,next) => {
    res.header('Access-Control-Allow-Origin' , '*' );
    res.header('Access-Control-Allow-Headers' , 
    'Origin, X-Requested-With, Content-Type, Accept, Authorization');
    if(req.method ==='OPTIONS'){
        res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');
        return res.status(200).json({});
    };
    next();
});
app.use('/api/users', userRoutes);
app.use(express.json());





//error handling
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