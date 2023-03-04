import { createServer } from 'http';

import app from './app';

 const port = process.env.PORT || 4500;
 
 const server = createServer(app);
 server.listen(port);

 console.log("Server running on port: " + port);
