-- AlterTable
ALTER TABLE `per_profile` ADD COLUMN `createBy` INTEGER NULL,
    ADD COLUMN `createDate` DATETIME(3) NULL,
    ADD COLUMN `deletedAt` DATETIME(3) NULL,
    ADD COLUMN `isActive` BOOLEAN NULL,
    ADD COLUMN `updateBy` INTEGER NULL,
    ADD COLUMN `updateDate` DATETIME(3) NULL;
