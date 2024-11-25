import { Request, Response } from "express";
import { database } from "../../../../database/prismaClient";

export class CreateBeneficiaryController {
  // Criar um novo beneficiário
  async handle(req: Request, res: Response) {
    const { name, cpf, address, contact, date_of_birth } = req.body;

    try {
      const beneficiary = await database.beneficiary.create({
        data: {
            address,
            contact,
            cpf,
            date_of_birth: new Date(date_of_birth), 
            name,
        },
      });

      res.status(201).json(beneficiary);
    } catch (error) {
      res.status(500).json({ error: "Erro ao criar beneficiário", details: error });
    }
  }

  // Atualizar um beneficiário existente
  async handleUpdate(req: Request, res: Response) {
    const { id } = req.params;
    const { name, cpf, address, contact, date_of_birth } = req.body;

    try {
      const beneficiary = await database.beneficiary.update({
        where: { id: parseInt(id) },
        data: {
          name,
          cpf,
          address,
          date_of_birth: new Date(date_of_birth), 
          contact,
        },
      });

      res.status(200).json(beneficiary);
    } catch (error) {
      res.status(500).json({ error: "Erro ao atualizar beneficiário", details: error });
    }
  }
}
