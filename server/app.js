import express from 'express';
import { config } from 'dotenv';
import cookieParser from 'cookie-parser';
import adminRouter from "./routes/admin.js";
import viewRouter from "./routes/view.js";
import insertRouter from "./routes/insert.js";

config({
      path: './data/config.env'
});

export const app = express();


app.use(express.json());
app.use(cookieParser());

app.use('/api/v1/admin' , adminRouter);
app.use('/api/v1/view', viewRouter);
app.use('/api/v1/insert', insertRouter);


app.get('/', (req, res) => {
      res.send("working");
});



