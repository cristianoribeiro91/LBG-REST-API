const app = require('./app').app;

//CR: This allows us to declare what port we want the application to run in 
//CR: It sets the port to the environment variable or (||) 8080. 
const PORT = process.env.PORT || 8080;

// app listener
app.listen(PORT, () => {
    console.log(`API Listening on http://localhost:${PORT}`);
});
