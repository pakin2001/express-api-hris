import { z } from 'zod';

export const schema = z.object({

  usrName          :z.string(), // ชื่อผู้ใช้
  password         :z.string(), // รหัสผ่าน
  perId            :z.number().optional(), // รหัสผู้ใช้
  roleId           :z.number().optional(), // 

});

export const schemaLog = z.object({

  usrName          :z.string(), // ชื่อผู้ใช้
  password         :z.string(), // รหัสผ่าน

});