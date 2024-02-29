import mysql from "mysql2";
import { config } from "dotenv";

config({
      path: "./data/config.env",
});

const connection = mysql.createConnection({
      host: "127.0.0.1",
      user: "root",
      password: process.env.PASSWORD,
      database: "reception_management"
});

const connectDB =() => {
      connection.connect((err)=>{
            if(err){
                  console.log(err);
            }else{
                  console.log("Connected to the database");
            }
      })
}

export {connection , connectDB};
