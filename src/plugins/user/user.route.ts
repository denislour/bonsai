import { Elysia } from "elysia";
import { registerUserHandler } from "./user.controller";
import { userCreateSchema } from "./user.schema";

export const userRoute = new Elysia({ prefix: "/users" })
  .get("/", () => "hi")
  .post("/", registerUserHandler, {
    body: userCreateSchema,
  });
