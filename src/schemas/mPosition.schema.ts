import { z } from 'zod';

export const schema = z.object({

  posTh          :z.string().optional(), // ตำแหน่ง Th
  posEn          :z.string().optional(), // ตำแหน่ง En

});