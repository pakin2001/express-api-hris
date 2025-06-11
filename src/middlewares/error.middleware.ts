import { Request, Response, NextFunction } from 'express';
import { Prisma } from '@prisma/client';

const isProduction = process.env.NODE_ENV === 'production';

export function errorHandler(err: any, req: Request, res: Response, next: NextFunction) {

  let statusCode = 500;
  let response: any = {
    success: false,
    message: 'Internal Server Error',
  };

  if (err instanceof Prisma.PrismaClientValidationError) {
    console.log(err);
    ({ response, statusCode } = buildErrorResponse('Invalid input data', 400, err.message));

    if (!isProduction) {
      response.details = err.message;
    }
  } else if (err instanceof Prisma.PrismaClientKnownRequestError) {
    ({ response, statusCode } = buildErrorResponse('Database request error', 400, err.message));

    if (!isProduction) {
      response.details = {
        code: err.code,
        meta: err.meta,
      };
    }
  }
  else if(err.message === 'Validation failed' && err.fields){

    ({ response, statusCode } = buildErrorResponse('Validation failed', 400, err.fields));

  }else {
    ({ response, statusCode } = buildErrorResponse(err.message || 'Unexpected error occurred', err.status || 500, err.message));
  }

  res.status(statusCode).json(response);
}

function buildErrorResponse(message: string, statusCode: number, details?: any) {
  const response: any = {
    success: false,
    message,
  };
  if (!isProduction && details) {
    response.details = details;
  }
  return { response, statusCode };
}

