/*
  Warnings:

  - You are about to drop the column `providerId` on the `Basket` table. All the data in the column will be lost.
  - You are about to drop the column `providerId` on the `Buy` table. All the data in the column will be lost.
  - You are about to drop the `Provider` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `supplierId` to the `Buy` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Basket` DROP FOREIGN KEY `Basket_providerId_fkey`;

-- DropForeignKey
ALTER TABLE `Buy` DROP FOREIGN KEY `Buy_providerId_fkey`;

-- AlterTable
ALTER TABLE `Basket` DROP COLUMN `providerId`,
    ADD COLUMN `supplierId` INTEGER NULL;

-- AlterTable
ALTER TABLE `Buy` DROP COLUMN `providerId`,
    ADD COLUMN `supplierId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `Provider`;

-- CreateTable
CREATE TABLE `Supplier` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `company_name` VARCHAR(191) NOT NULL,
    `cnpj` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `contact` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Buy` ADD CONSTRAINT `Buy_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `Supplier`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Basket` ADD CONSTRAINT `Basket_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `Supplier`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
