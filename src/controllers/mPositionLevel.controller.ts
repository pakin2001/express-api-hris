import { Request, Response } from 'express';
import { 
  createData, 
  updateData,
  findOneData,
  findAllData,
  deleteData,
  dataTableData
} from '../services/mPositionLevel.service';
import { catchAsync } from '../utils/catchAsync';

export const findAll = catchAsync(async (req: Request, res: Response) => {
  const data = await findAllData();
  res.json(data);
});

export const findOne = catchAsync(async (req: Request, res: Response) => {
  const data = await findOneData(+req.params.id);
  res.json(data);
});

export const create = catchAsync(async (req: Request, res: Response) => {
  const data = await createData(req.body);
  res.json(data);
});

export const update = catchAsync(async (req: Request, res: Response ) => {
  const data = await updateData(req.body,+req.params.id);
  res.json(data);
});

export const del = catchAsync(async (req: Request, res: Response) => {
  const data = await deleteData(+req.params.id);
  res.json(data);
});

export const dataTable = catchAsync(async (req: Request, res: Response) => {
  const data = await dataTableData(req.body);
  res.json(data);
});
