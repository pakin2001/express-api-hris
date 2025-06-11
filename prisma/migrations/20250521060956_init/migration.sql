/*
  Warnings:

  - Added the required column `DEPARTMENT_ID` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `EMAIL` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `LINE` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `POS_LEVEL_ID` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `per_profile` ADD COLUMN `DEPARTMENT_ID` INTEGER NOT NULL,
    ADD COLUMN `EMAIL` VARCHAR(191) NOT NULL,
    ADD COLUMN `LINE` VARCHAR(191) NOT NULL,
    ADD COLUMN `POS_LEVEL_ID` INTEGER NOT NULL;
