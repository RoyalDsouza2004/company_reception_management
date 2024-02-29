import express from 'express';
import { visitorDetails, staffDetails , appointmentDetails} from '../controllers/view.js';

const router = express.Router();

router.get("/visitorDetails" ,visitorDetails);

router.get("/staffDetails" , staffDetails);

router.get("/appointmentDetails",appointmentDetails);

export default router;