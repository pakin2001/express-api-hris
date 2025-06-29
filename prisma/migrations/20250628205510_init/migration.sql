/*
  Warnings:

  - You are about to drop the column `passwordHash` on the `USR_MAIN` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `USR_MAIN` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[password]` on the table `USR_MAIN` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `password` to the `USR_MAIN` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `USR_MAIN_passwordHash_key` ON `USR_MAIN`;

-- AlterTable
ALTER TABLE `USR_MAIN` DROP COLUMN `passwordHash`,
    DROP COLUMN `role`,
    ADD COLUMN `password` VARCHAR(191) NOT NULL,
    ADD COLUMN `roleId` INTEGER NULL;

-- CreateIndex
CREATE UNIQUE INDEX `USR_MAIN_password_key` ON `USR_MAIN`(`password`);
