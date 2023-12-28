import { Elysia } from "elysia";
import { getUserHandler, registerUserHandler } from "./user.controller";
import { userCreateHook } from "./user.hook";

export const userRoute = new Elysia({ prefix: "/users" })
  .get("/", () => getUserHandler, { detail: { tags: ["Users"] } })
  .post("/", registerUserHandler, userCreateHook);
