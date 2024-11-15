import { Request, Response } from "express";
import { CreateUserUseCase } from "./CreateUserUseCase";

export class CreateUserController {
  async handle(request: Request, response: Response) {
    const { user, password } = request.body

    const createUserUseCase = new CreateUserUseCase()
    const result = await createUserUseCase.execute({
      user,
      password,
    })

    return response.json(result)
  }
}