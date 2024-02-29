import express from 'express';
import { addNewStaff, addVisitor, appointment } from '../controllers/insert.js';

const router = express.Router();


router.post('/add-visitor' , addVisitor);

router.post('/add-new-staff' , addNewStaff);

router.post("/new-appointment", appointment);


export default router;