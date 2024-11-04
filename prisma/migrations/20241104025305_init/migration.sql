-- CreateTable
CREATE TABLE `Cadastrados` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeCompleto` VARCHAR(191) NOT NULL,
    `dataNascimento` DATETIME(3) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `contato` VARCHAR(191) NOT NULL,
    `justificativa` ENUM('VIVIDA', 'ORFAO', 'PROBLEMAS_FINANCEIROS') NOT NULL,
    `observacao` VARCHAR(191) NULL,

    UNIQUE INDEX `Cadastrados_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Registros` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dataCompra` DATETIME(3) NOT NULL,
    `fornecedor` VARCHAR(191) NOT NULL,
    `quantidade` INTEGER NOT NULL,
    `valorUnitario` DOUBLE NOT NULL,
    `valorTotal` DOUBLE NOT NULL DEFAULT 0.0,
    `comprovante` VARCHAR(191) NOT NULL,
    `cadastradoId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cestas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeCompleto` VARCHAR(191) NOT NULL,
    `justificativa` ENUM('VIVIDA', 'ORFAO', 'PROBLEMAS_FINANCEIROS') NOT NULL,
    `dataInicio` DATETIME(3) NOT NULL,
    `dataVencimentoProtocolo` DATETIME(3) NOT NULL DEFAULT (DATE_ADD(dataInicio, INTERVAL 3 MONTH)),
    `statusColetaMes` VARCHAR(191) NOT NULL,
    `cadastradoId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Registros` ADD CONSTRAINT `Registros_cadastradoId_fkey` FOREIGN KEY (`cadastradoId`) REFERENCES `Cadastrados`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cestas` ADD CONSTRAINT `Cestas_cadastradoId_fkey` FOREIGN KEY (`cadastradoId`) REFERENCES `Cadastrados`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
