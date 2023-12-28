import { Elysia } from "elysia";
import {
  getUserHandler,
  userCreateHandler,
  userLoginHandler,
} from "./user.handler";
import { UserService } from "./user.service";
import { userCreateSchema, userLoginSchema } from "./user.schema";

export const userRoute = new Elysia({ prefix: "/users" })
  .decorate({ userService: new UserService() })

  .get("/", () => getUserHandler, { detail: { tags: ["Users"] } })

  .post("/", userCreateHandler, {
    body: userCreateSchema,
    detail: { tags: ["Users"] },
  })

  .post("/login", userLoginHandler, {
    body: userLoginSchema,
    detail: { tags: ["Users"] },
  });
