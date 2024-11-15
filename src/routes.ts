import { Router } from "express";
import { CreateUserController } from "./modules/user/useCases/createUser/CreateUserController";

const routes = Router()

const createUserController = new CreateUserController()

routes.post("/user/", async (req, res) => {
  await createUserController.handle(req, res);
});

export {routes}