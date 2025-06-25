import prisma from '../config/prisma';
import { filterDataTable } from '../utils/functionCustom';
import { schema } from "../schemas/mPositionLevel.schema";
import { handlePrismaError } from '../middlewares/error.function';
import { z } from 'zod';
type mPositionLevel = z.infer<typeof schema>;

    export const createData = async (body: mPositionLevel) => {
        const newData = await prisma.mPositionLevel.create({
            data: body,
        });
        return newData;
    };

    export const updateData = async (body: mPositionLevel, id: number) => {
        try {
            const updated = await prisma.mPositionLevel.update({
                where: {
                    posLevelId: Number(id)
                },
                data: body,
            });
            return (updated);
        } catch (err) {
            handlePrismaError(err, id)
        }
    };

    export const findAllData = async () => {
        const data = await prisma.mPositionLevel.findMany({
            where: {
                deletedAt: null
            }
        });
        return data;
    };

    export const findOneData = async (id: number) => {
      const data = await prisma.mPositionLevel.findUnique({
        where: { posLevelId: id , deletedAt: null}
      });

      if(!data){
        return {};
      }

      return data;
    };

    export const deleteData = async (id:number) => {
      await prisma.mPositionLevel.update({
        where: { posLevelId: Number(id) },
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


