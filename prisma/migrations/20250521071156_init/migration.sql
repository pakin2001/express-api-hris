/*
  Warnings:

  - The primary key for the `per_profile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `DEPARTMENT_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `EMAIL` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `GENDER_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `LINE` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `NATION_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_BIRTH_DATE` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_EMP_CODE` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_EMP_NUMBER` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_END_DATE` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_FNAME_EN` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_FNAME_TH` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_ID_CARD_NO` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_LNAME_EN` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_LNAME_TH` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_MNAME_EN` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_MNAME_TH` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_MOBILE_PHONE` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_START_DATE` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_STATUS_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PER_TYPE_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `POS_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `POS_LEVEL_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `PREFIX_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `RACE_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `RELIGION_ID` on the `per_profile` table. All the data in the column will be lost.
  - You are about to drop the column `TEAM_ID` on the `per_profile` table. All the data in the column will be lost.
  - Added the required column `perId` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `per_profile` DROP PRIMARY KEY,
    DROP COLUMN `DEPARTMENT_ID`,
    DROP COLUMN `EMAIL`,
    DROP COLUMN `GENDER_ID`,
    DROP COLUMN `LINE`,
    DROP COLUMN `NATION_ID`,
    DROP COLUMN `PER_BIRTH_DATE`,
    DROP COLUMN `PER_EMP_CODE`,
    DROP COLUMN `PER_EMP_NUMBER`,
    DROP COLUMN `PER_END_DATE`,
    DROP COLUMN `PER_FNAME_EN`,
    DROP COLUMN `PER_FNAME_TH`,
    DROP COLUMN `PER_ID`,
    DROP COLUMN `PER_ID_CARD_NO`,
    DROP COLUMN `PER_LNAME_EN`,
    DROP COLUMN `PER_LNAME_TH`,
    DROP COLUMN `PER_MNAME_EN`,
    DROP COLUMN `PER_MNAME_TH`,
    DROP COLUMN `PER_MOBILE_PHONE`,
    DROP COLUMN `PER_START_DATE`,
    DROP COLUMN `PER_STATUS_ID`,
    DROP COLUMN `PER_TYPE_ID`,
    DROP COLUMN `POS_ID`,
    DROP COLUMN `POS_LEVEL_ID`,
    DROP COLUMN `PREFIX_ID`,
    DROP COLUMN `RACE_ID`,
    DROP COLUMN `RELIGION_ID`,
    DROP COLUMN `TEAM_ID`,
    ADD COLUMN `departmentId` INTEGER NULL,
    ADD COLUMN `email` VARCHAR(191) NULL,
    ADD COLUMN `genderId` INTEGER NULL,
    ADD COLUMN `line` VARCHAR(191) NULL,
    ADD COLUMN `nationId` INTEGER NULL,
    ADD COLUMN `perBirthDate` DATETIME(3) NULL,
    ADD COLUMN `perEmpCode` VARCHAR(191) NULL,
    ADD COLUMN `perEmpNumber` VARCHAR(191) NULL,
    ADD COLUMN `perEndDate` DATETIME(3) NULL,
    ADD COLUMN `perFnameEn` VARCHAR(191) NULL,
    ADD COLUMN `perFnameTh` VARCHAR(191) NULL,
    ADD COLUMN `perId` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `perIdCardNo` VARCHAR(191) NULL,
    ADD COLUMN `perLnameEn` VARCHAR(191) NULL,
    ADD COLUMN `perLnameTh` VARCHAR(191) NULL,
    ADD COLUMN `perMnameEn` VARCHAR(191) NULL,
    ADD COLUMN `perMnameTh` VARCHAR(191) NULL,
    ADD COLUMN `perMobilePhone` VARCHAR(191) NULL,
    ADD COLUMN `perStartDate` DATETIME(3) NULL,
    ADD COLUMN `perStatusId` INTEGER NULL,
    ADD COLUMN `perTypeId` INTEGER NULL,
    ADD COLUMN `posId` INTEGER NULL,
    ADD COLUMN `posLevelId` INTEGER NULL,
    ADD COLUMN `prefixId` INTEGER NULL,
    ADD COLUMN `raceId` INTEGER NULL,
    ADD COLUMN `religionId` INTEGER NULL,
    ADD COLUMN `teamId` INTEGER NULL,
    ADD PRIMARY KEY (`perId`);
