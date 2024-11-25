import express from "express";
import { routes } from "./routes";
import { config } from './utils/config';
import cors from "cors"; 

const app = express()
const PORT = config.port;

// Middleware para habilitar o CORS
app.use(
  cors({
    origin: "http://localhost:4001",
    methods: ["GET", "POST", "PUT", "DELETE"], // Métodos permitidos
    allowedHeaders: ["Content-Type"], // Cabeçalhos permitidos
  })
);

app.use(express.json())

app.use(routes)

app.listen(PORT, () => {
  console.log(`The server is running on http://localhost:${PORT}`)
})