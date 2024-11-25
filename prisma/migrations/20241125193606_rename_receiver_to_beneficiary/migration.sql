/*
  Warnings:

  - You are about to drop the `Receiver` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Basket` DROP FOREIGN KEY `Basket_receiverId_fkey`;

-- DropForeignKey
ALTER TABLE `Donation` DROP FOREIGN KEY `Donation_receiverId_fkey`;

-- DropTable
DROP TABLE `Receiver`;

-- CreateTable
CREATE TABLE `Beneficiary` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `contact` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `date_of_birth` DATETIME(3) NOT NULL,
    `observation` VARCHAR(191) NULL,
    `excluido` VARCHAR(191) NOT NULL DEFAULT 'N',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Basket` ADD CONSTRAINT `Basket_receiverId_fkey` FOREIGN KEY (`receiverId`) REFERENCES `Beneficiary`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Donation` ADD CONSTRAINT `Donation_receiverId_fkey` FOREIGN KEY (`receiverId`) REFERENCES `Beneficiary`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
