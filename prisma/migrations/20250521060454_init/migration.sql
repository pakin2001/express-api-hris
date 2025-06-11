/*
  Warnings:

  - Added the required column `PER_BIRTH_DATE` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PER_EMP_CODE` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PER_END_DATE` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PER_ID_CARD_NO` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PER_MOBILE_PHONE` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PER_START_DATE` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PER_STATUS_ID` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `TEAM_ID` to the `PER_PROFILE` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `per_profile` ADD COLUMN `PER_BIRTH_DATE` DATETIME(3) NOT NULL,
    ADD COLUMN `PER_EMP_CODE` VARCHAR(191) NOT NULL,
    ADD COLUMN `PER_END_DATE` DATETIME(3) NOT NULL,
    ADD COLUMN `PER_ID_CARD_NO` VARCHAR(191) NOT NULL,
    ADD COLUMN `PER_MOBILE_PHONE` VARCHAR(191) NOT NULL,
    ADD COLUMN `PER_START_DATE` DATETIME(3) NOT NULL,
    ADD COLUMN `PER_STATUS_ID` INTEGER NOT NULL,
    ADD COLUMN `TEAM_ID` INTEGER NOT NULL;
