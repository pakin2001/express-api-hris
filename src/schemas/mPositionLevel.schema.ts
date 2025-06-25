import { z } from 'zod';

export const schema = z.object({

  posLevelTh          :z.string().optional(), // ระดับตำแหน่ง Th
  posLevelEn          :z.string().optional(), // ระดับตำแหน่ง En

});