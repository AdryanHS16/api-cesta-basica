import { Router } from "express";
import { CreateUserController } from "./modules/user/useCases/createUser/CreateUserController";
import { CreateSupplierController } from "./modules/supplier/useCases/createSupplier/CreateSupplierController";
import { CreateBeneficiaryController } from "./modules/beneficiaries/useCases/createBeneficiary/CreateBeneficiaryController"; 
import { CreateBasketController } from "./modules/basket/useCases/createBasket/CreateBasketController";

const routes = Router();

const createUserController = new CreateUserController();
const createSupplierController = new CreateSupplierController();
const createBeneficiaryController = new CreateBeneficiaryController();
const createBasketController = new CreateBasketController();

// Rota para criar usuário
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

// Rotas para beneficiários
routes.post("/beneficiaries", async (req, res) => {
  await createBeneficiaryController.handle(req, res);
});

routes.put("/beneficiaries/:id", async (req, res) => {
  await createBeneficiaryController.handleUpdate(req, res);
});

// Rotas para cestas
routes.post("/baskets", async (req, res) => {
  await createBasketController.handle(req, res);
});

routes.put("/baskets/:id", async (req, res) => {
  await createBasketController.handleUpdate(req, res);
});

export { routes };
