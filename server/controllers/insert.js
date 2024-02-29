import { connection } from "../data/database.js"
import ErrorHandler from "../middlewares/error.js";

export const addVisitor = async (req , res , next) => {
      const dateTime = new Date();
      const {name , email , phone , purpose } = req.body;


      try {
            await connection.promise().query("INSERT INTO Visitor(Name , Email , Phone_Number , Purpose_of_Visit , Date_Time_of_Visit) values( ? , ? , ? , ? , ? )", [name , email , phone , purpose , dateTime ]) , (err , result) => {
                  if (err) return next(new ErrorHandler("Couldn't insert the values for the visitor" , 400));
            }

            return res.status(200).json({
                  success: true,
                  message : "Visitor Added Successfully",
            });
            
      } catch (error) {
            next(error);
      }
}