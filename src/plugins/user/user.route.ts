import { Elysia } from "elysia";
import { registerUserHandler } from "./user.controller";
import { userCreateHook } from "./user.hook";

export const userRoute = new Elysia({ prefix: "/users" })
  .get("/", () => "hi", { detail: { tags: ["Users"] } })
  .post("/", registerUserHandler, userCreateHook);
