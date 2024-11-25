import { Request, Response } from "express";
import { database } from "../../../../database/prismaClient";

export class CreateBasketController {
  // Criar uma nova cesta
  async handle(req: Request, res: Response) {
    const { description, quantity, distribution_date } = req.body;

    try {
      const basket = await database.basket.create({
        data: {
          description,
          quantity,
          distribution_date,
        },
      });

      res.status(201).json(basket);
    } catch (error) {
      res.status(500).json({ error: "Erro ao criar cesta", details: error });
    }
  }

  // Atualizar uma cesta existente
  async handleUpdate(req: Request, res: Response) {
    const { id } = req.params;
    const { description, quantity, distribution_date } = req.body;

    try {
      const basket = await database.basket.update({
        where: { id: parseInt(id) },
        data: {
          description,
          quantity,
          distribution_date,
        },
      });

      res.status(200).json(basket);
    } catch (error) {
      res.status(500).json({ error: "Erro ao atualizar cesta", details: error });
    }
  }
}
