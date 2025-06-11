import { Prisma } from '@prisma/client';

export function handlePrismaError(err: any, id?: number) {
  if (err instanceof Prisma.PrismaClientKnownRequestError) {
    if (err.code === 'P2025') {
      const error = new Error(`id ${id} not found`);
      (error as any).status = 404;
      throw error;
    }
  }
  throw err;
}
