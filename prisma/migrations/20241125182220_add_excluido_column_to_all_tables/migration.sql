-- AlterTable
ALTER TABLE `Basket` ADD COLUMN `excluido` VARCHAR(191) NOT NULL DEFAULT 'N';

-- AlterTable
ALTER TABLE `Buy` ADD COLUMN `excluido` VARCHAR(191) NOT NULL DEFAULT 'N';

-- AlterTable
ALTER TABLE `Donation` ADD COLUMN `excluido` VARCHAR(191) NOT NULL DEFAULT 'N';

-- AlterTable
ALTER TABLE `Receiver` ADD COLUMN `excluido` VARCHAR(191) NOT NULL DEFAULT 'N';

-- AlterTable
ALTER TABLE `Supplier` ADD COLUMN `excluido` VARCHAR(191) NOT NULL DEFAULT 'N';

-- AlterTable
ALTER TABLE `User` ADD COLUMN `excluido` VARCHAR(191) NOT NULL DEFAULT 'N';
