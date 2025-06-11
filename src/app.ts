import express from 'express';
import cors from 'cors';
import profileRoutes from './routes/profile.routes';
import {errorHandler} from './middlewares/error.middleware';

const app = express();

app.use(cors());
app.use(express.json());

app.use('/profile', profileRoutes);

app.use(errorHandler);

export default app;
