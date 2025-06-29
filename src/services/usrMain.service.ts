import bcrypt from 'bcrypt';
import prisma from '../config/prisma';
import { filterDataTable } from '../utils/functionCustom';
import { schema,schemaLog } from "../schemas/usrMain.schema";
import { handlePrismaError } from '../middlewares/error.function';
import { z } from 'zod';
type usrMain = z.infer<typeof schema>;
type schemaLog = z.infer<typeof schemaLog>;

const SALT_ROUNDS = 10;
  
    export const createData = async (body: usrMain) => {
        body.password = await hashPassword(body.password);
        const newData = await prisma.usrMain.create({
            data: body,
        });
        return newData; 
    };

    export const updateData = async (body: usrMain, id: number) => {
        try {
            const updated = await prisma.usrMain.update({
                where: {
                    usrId: Number(id)
                },
                data: body,
            });
            return (updated);
        } catch (err) {
            handlePrismaError(err, id)
        }
    };

    export const findAllData = async () => {
        const data = await prisma.usrMain.findMany({
            where: {
                deletedAt: null
            }
        });
        return data;
    };

    export const findOneData = async (id: number) => {
      const data = await prisma.usrMain.findUnique({
        where: { usrId: id , deletedAt: null}
      });

      if(!data){
        return {};
      }

      return data;
    };

    export const deleteData = async (id:number) => {
      await prisma.usrMain.update({
        where: { usrId: Number(id) },
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
        prisma.usrMain.findMany({
          where: where,
          orderBy: sort,
          skip:skip,
          take:take
        }),
        prisma.usrMain.count({
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

    export const loginData = async(body:schemaLog) => {

      const dataUsr = await prisma.usrMain.findUnique({
        where: { usrName: body.usrName , deletedAt: null}
      });

      if(await comparePassword(body.password,dataUsr?.password ?? '')){

        return {
          token:"xxxx"
        };

      }
      else{

        throw { status: 401, message: 'Unauthorized' };

      }

    }

    const hashPassword = async (password: string): Promise<string> => {
        const hashed = await bcrypt.hash(password, SALT_ROUNDS);
        return hashed;
    };

    const comparePassword = async (password: string, hash: string): Promise<boolean> => {
        return await bcrypt.compare(password, hash);;
    };