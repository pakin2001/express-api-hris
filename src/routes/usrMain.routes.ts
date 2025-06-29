import { Router } from 'express';
import express from 'express';
import { findAll,findOne,create,update,del,dataTable,login } from '../controllers/usrMain.controller';
import { validateBody } from '../middlewares/validate';
import { schema } from "../schemas/usrMain.schema";

const router = express.Router();

router.get('/', findAll);
router.get('/:id', findOne);
router.post('/',validateBody(schema), create);
router.post('/dataTable', dataTable);
router.post('/login', login);
router.patch('/:id',validateBody(schema), update);
router.delete('/:id', del);


export default router;
