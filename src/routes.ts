import { Router } from "express";
import { CreateUserController } from "./modules/user/useCases/createUser/CreateUserController";
import { CreateSupplierController } from "./modules/supplier/useCases/createSupplier/CreateSupplierController";

const routes = Router()

const createUserController = new CreateUserController()
const createSupplierController = new CreateSupplierController();

routes.post("/user/", async (req, res) => {
  await createUserController.handle(req, res);
});

// Rota para criar fornecedor
routes.post("/suppliers", async (req, res) => {
  await createSupplierController.handleCreate(req, res); 
});

// Rota para atualizar fornecedor
routes.put("/suppliers/:id", async (req, res) => {
  await createSupplierController.handleUpdate(req, res);
});

export { routes }
