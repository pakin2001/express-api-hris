import prisma from '../config/prisma';
import { filterDataTable } from '../utils/functionCustom';
import { schema } from "../schemas/mPosition.schema";
import { handlePrismaError } from '../middlewares/error.function';
import { z } from 'zod';
type position = z.infer<typeof schema>;

    export const createData = async (body: position) => {
        const newData = await prisma.mPosition.create({
            data: body,
        });
        return newData;
    };

    export const updateData = async (body: position, id: number) => {
        try {
            const updated = await prisma.mPosition.update({
                where: {
                    posId: Number(id)
                },
                data: body,
            });
            return (updated);
        } catch (err) {
            handlePrismaError(err, id)
        }
    };

    export const findAllData = async () => {
        const data = await prisma.mPosition.findMany({
            where: {
                deletedAt: null
            }
        });
        return data;
    };

    export const findOneData = async (id: number) => {
      const data = await prisma.mPosition.findUnique({
        where: { posId: id , deletedAt: null}
      });

      if(!data){
        return {};
      }

      return data;
    };

    export const deleteData = async (id:number) => {
      await prisma.mPosition.update({
        where: { posId: Number(id) },
          data: { deletedAt: new Date() }
      });

      return({message: `deleted id ${id} success`});
    };

    export const dataTableData = async (req: any) => {
      const {
        page = 1,
        perPage = 10,
        search = '',
        searchFields = [],
        filters = {},
        sort = [{ field: 'createdAt', direction: 'desc' }]
      } = req;

      const skip = (parseInt(page) - 1) * parseInt(perPage);
      const take = parseInt(perPage);
      const where = await filterDataTable(filters,search,searchFields);

      const [data, total] = await Promise.all([
        prisma.mPosition.findMany({
          where: where,
          orderBy: sort,
          skip:skip,
          take:take
        }),
        prisma.mPosition.count({
          where: where,
        }),
      ]);

      return(
        {
          data:data,
          total:total,
          page: Number(page),
          perPage: Number(perPage),
          totalPages: Math.ceil(total / perPage),
        });
    };