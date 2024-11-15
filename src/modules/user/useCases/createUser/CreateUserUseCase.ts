import { database } from "../../../../database/prismaClient"
import { hash } from "bcrypt"

interface ICreateUser {
  user: string
  password: string
}

export class CreateUserUseCase {
  async execute({password, user}: ICreateUser) {
    const userExist = await database.user.findFirst({
      where: {
        user: user.toLowerCase()
      }
    })

    if (userExist) {
      throw new Error("User already exists")
    }

    const hashPassword = await hash(password, 10)
    const userProfile = await database.user.create({
      data: {
        user,
        password: hashPassword,
      }
    })

    return userProfile
  }
}