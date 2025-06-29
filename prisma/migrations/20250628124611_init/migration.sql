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
    `createDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createBy` INTEGER NULL,
    `updateBy` INTEGER NULL,
    `isActive` BOOLEAN NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`perId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `USR_MAIN` (
    `usrId` INTEGER NOT NULL AUTO_INCREMENT,
    `usrName` VARCHAR(191) NOT NULL,
    `passwordHash` VARCHAR(191) NOT NULL,
    `perId` INTEGER NULL,
    `role` INTEGER NULL,
    `createDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createBy` INTEGER NULL,
    `updateBy` INTEGER NULL,
    `isActive` BOOLEAN NULL,
    `deletedAt` DATETIME(3) NULL,

    UNIQUE INDEX `USR_MAIN_usrName_key`(`usrName`),
    UNIQUE INDEX `USR_MAIN_passwordHash_key`(`passwordHash`),
    PRIMARY KEY (`usrId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `M_POSITION` (
    `posId` INTEGER NOT NULL AUTO_INCREMENT,
    `posTh` VARCHAR(191) NULL,
    `posEn` VARCHAR(191) NULL,
    `createDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createBy` INTEGER NULL,
    `updateBy` INTEGER NULL,
    `isActive` BOOLEAN NULL DEFAULT true,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`posId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `M_POSITION_LEVEL` (
    `posLevelId` INTEGER NOT NULL AUTO_INCREMENT,
    `posLevelTh` VARCHAR(191) NULL,
    `posLevelEn` VARCHAR(191) NULL,
    `createDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createBy` INTEGER NULL,
    `updateBy` INTEGER NULL,
    `isActive` BOOLEAN NULL DEFAULT true,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`posLevelId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `PER_PROFILE` ADD CONSTRAINT `PER_PROFILE_posId_fkey` FOREIGN KEY (`posId`) REFERENCES `M_POSITION`(`posId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `USR_MAIN` ADD CONSTRAINT `USR_MAIN_perId_fkey` FOREIGN KEY (`perId`) REFERENCES `PER_PROFILE`(`perId`) ON DELETE SET NULL ON UPDATE CASCADE;
