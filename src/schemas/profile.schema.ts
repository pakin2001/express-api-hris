import { z } from 'zod';

export const schema = z.object({
  perEmpNumber :z.string().optional(), // เลขประจำตัวบุคลากร
  perEmpCode   :z.string().optional(), // ชื่อย่อพนักงาน
  perIdCardNo  :z.string().optional(), // หมายเลขบัตรประชาชน
  posId        :z.number().optional(), // ตำแหน่ง
  posLevelId   :z.number().optional(), // ระดับตำแหน่ง
  departmentId :z.number().optional(), // แผนก
  prefixId     :z.number().optional(), // คำนำหน้าชื่อ
  perFnameTh   :z.string().optional(), // ชื่อไทย
  perMnameTh   :z.string().optional(), // ชื่อกลางไทย
  perLnameTh   :z.string().optional(), // นามสกุลไทย
  perFnameEn   :z.string().optional(), // ชื่ออังกฤษ
  perMnameEn   :z.string().optional(), // ชื่อกลางอังกฤษ
  perLnameEn   :z.string().optional(), // นามสกุลอังกฤษ
  perBirthDate :z.coerce.date().optional(), // วันเกิด
  genderId     :z.number().optional(), // เพศ
  perTypeId    :z.number().optional(), // ประเภทบุคลากร
  perStatusId  :z.number().optional(), // สถานะบุคลากรจาก
  raceId       :z.number().optional(), // เชื้อชาติ
  nationId     :z.number().optional(), // สัญชาติ
  religionId   :z.number().optional(), // ศาสนา
  perStartDate :z.coerce.date().optional(), // วันที่เริ่มงาน
  perEndDate   :z.coerce.date().optional(), // วันที่สิ้นสุดงาน
  perMobilePho :z.string().optional(), // หมายเลขโทรศัพท์
  teamId       :z.number().optional(), // ทีม
  email        :z.string().optional(),
  line         :z.string().optional()
});