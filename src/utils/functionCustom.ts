import { Request, Response } from 'express';

  export const filterDataTable = async (filters: object,search: string,searchFields:any ) => {

    const filterCondition: Record<string, any> = {};
    for (const [key, value] of Object.entries(filters)) {
      if (value !== undefined && value !== '') {
        filterCondition[key] = value;
      }
    }
    filterCondition["deletedAt"] = null;

    const searchCondition = search && searchFields.length > 0 ? 
    {
      OR: searchFields.map((data: string) => ({
        [data]:{
          contains: search
        }
      })),
    }: {};

    const where = {
      AND: [filterCondition,searchCondition],
    };

    return where;

  }