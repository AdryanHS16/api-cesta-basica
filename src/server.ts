import express from "express";
import { routes } from "./routes";
import { config } from './utils/config';

const app = express()
const PORT = config.port;

app.use(express.json())

app.use(routes)

app.listen(PORT, () => {
  console.log(`The server is running on http://localhost:${PORT}`)
})