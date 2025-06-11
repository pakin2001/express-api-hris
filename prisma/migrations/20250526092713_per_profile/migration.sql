/*
  Warnings:

  - You are about to drop the `perprofile` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `perprofile`;

-- CreateTable
CREATE TABLE `PER_PROFILE` (
    `perId` INTEGER NOT NULL AUTO_INCREMENT,
    `perEmpNumber` VARCHAR(191) NULL,
    `perEmpCode` VARCHAR(191) NULL,
    `perIdCardNo` VARCHAR(191) NULL,
    `posId` INTEGER NULL,
    `posLevelId` INTEGER NULL,
    `departmentId` INTEGER NULL,
    `prefixId` INTEGER NULL,
    `perFnameTh` VARCHAR(191) NULL,
    `perMnameTh` VARCHAR(191) NULL,
    `perLnameTh` VARCHAR(191) NULL,
    `perFnameEn` VARCHAR(191) NULL,
    `perMnameEn` VARCHAR(191) NULL,
    `perLnameEn` VARCHAR(191) NULL,
    `perBirthDate` DATETIME(3) NULL,
    `genderId` INTEGER NULL,
    `perTypeId` INTEGER NULL,
    `perStatusId` INTEGER NULL,
    `raceId` INTEGER NULL,
    `nationId` INTEGER NULL,
    `religionId` INTEGER NULL,
    `perStartDate` DATETIME(3) NULL,
    `perEndDate` DATETIME(3) NULL,
    `perMobilePhone` VARCHAR(191) NULL,
    `teamId` INTEGER NULL,
    `email` VARCHAR(191) NULL,
    `line` VARCHAR(191) NULL,
    `createDate` DATETIME(3) NULL,
    `updateDate` DATETIME(3) NULL,
    `createBy` INTEGER NULL,
    `updateBy` INTEGER NULL,
    `isActive` BOOLEAN NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`perId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
