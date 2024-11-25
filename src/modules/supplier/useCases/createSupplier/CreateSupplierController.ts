import { Request, Response } from "express";
import { database } from "../../../../database/prismaClient";

export class CreateSupplierController {
  // Criar um novo fornecedor
  async handleCreate(req: Request, res: Response) {
    const { company_name, cnpj, address, contact } = req.body;

    try {
      const supplier = await database.supplier.create({
        data: {
          company_name,
          cnpj,
          address,
          contact,
        },
      });

      res.status(201).json(supplier);
    } catch (error) {
      res.status(500).json({ error: "Erro ao criar fornecedor", details: error });
    }
  }

  // Atualizar um fornecedor existente
  async handleUpdate(req: Request, res: Response) {
    const { id } = req.params;
    const { company_name, cnpj, address, contact } = req.body;

    try {
      const supplier = await database.supplier.update({
        where: { id: parseInt(id) },
        data: {
          company_name,
          cnpj,
          address,
          contact,
        },
      });

      res.status(200).json(supplier);
    } catch (error) {
      res.status(500).json({ error: "Erro ao atualizar fornecedor", details: error });
    }
  }
}
