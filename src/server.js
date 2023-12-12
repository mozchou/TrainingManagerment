import express from 'express';
import configViewEngine from './config/viewEngine';
import initWebRoute from './route/web';
// import dbConfig from './config/connectDB';

require('dotenv').config();

const app = express()
const port = process.env.PORT || 8080;

// app.get('/', (req, res) => {
//     res.send('Hello World!')
// })
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

configViewEngine(app);

initWebRoute(app);

// connection(app)


app.listen(port, () => {
    console.log(`http://localhost:${port}/login`)
    // console.log(`http://localhost:${port}`)
})