
import { Request, Response, NextFunction } from 'express';
import { ZodSchema } from 'zod';

export const validateBody = (schema: ZodSchema) => {
  return (req: Request, res: Response, next: NextFunction) => {
    const result = schema.safeParse(req.body);

    if (!result.success) {
      const error = new Error('Validation failed');
      (error as any).status = 400;
      (error as any).fields = result.error.flatten().fieldErrors;
      return next(error);
    }

    // แทนค่า req.body ด้วยข้อมูลที่ validated แล้ว
    req.body = result.data;
    next();
  };
};
