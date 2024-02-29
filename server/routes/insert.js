import express from 'express';
import { addVisitor } from '../controllers/insert.js';

const router = express.Router();


router.post('/add-visitor' , addVisitor);


export default router;