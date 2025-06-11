import prisma from '../config/prisma';
import { filterDataTable } from '../utils/functionCustom';
import { schema } from "../schemas/profile.schema";
import { PerProfile } from '@prisma/client';
import { handlePrismaError } from '../middlewares/error.function';
import { z } from 'zod';
type ProfileInput = z.infer<typeof schema>;

  export const createData = async (body: ProfileInput) => {
    const newProfile = await prisma.perProfile.create({
      data: body,
    });
    return newProfile;
  };

  export const updateData = async (body: ProfileInput,id: number) => {
      try {
        const updated = await prisma.perProfile.update({
          where: { perId: Number(id) },data: body,
        });
        return(updated);
      } catch (err) {
        handlePrismaError(err, id)
      }
  };

  export const findAllData = async () => {
      const profiles = await prisma.perProfile.findMany(
        {
          where: { 
            deletedAt: null 
          },
          include: {
            position: true
          }
        }
      );
      return(await formatData(profiles));
  };

  export const findOneData = async (id: number) => {
      const profile = await prisma.perProfile.findUnique({
        where: { perId: id , deletedAt: null},
        include: {
          position: true
        },
      });

      if(!profile){
        return {};
      }

      const formatted = await formatData([profile]);
      return(formatted[0]);
  };

  export const deleteData = async (id:number) => {
      await prisma.perProfile.update({
        where: { perId: Number(id) },
          data: { deletedAt: new Date() }
      });

      return(
        {
          message: `deleted id ${id} success`
        }
      );
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
        prisma.perProfile.findMany({
          where: where,
          orderBy: sort,
          skip:skip,
          take:take,
          include: {
            position: true,
          }
        }),
        prisma.perProfile.count({
          where: where,
        }),
      ]);

      return(
        {
          data:await formatData(data),
          total:total,
          page: Number(page),
          perPage: Number(perPage),
          totalPages: Math.ceil(total / perPage),
        });
  };

  const formatData = (data:PerProfile[]) => {
    const newData = data.map(
    (data:any) => {
      const { position, ...rest } = data;
      const returnData = {
        ...rest,
        posTh: position?.posTh ?? null,
        posEn: position?.posEn ?? null,
      };
      return returnData;
    });
    return newData;
  }