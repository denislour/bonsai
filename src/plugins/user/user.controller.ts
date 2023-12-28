import { Context } from "elysia";
import { createUser } from "./user.service";
import { UserCreateInput, userCreateResponseSchema } from "./user.schema";

export async function getUserHandler() {
  return "Get User Handler";
}

export async function registerUserHandler(
  ctx: Context<{ body: UserCreateInput }>,
) {
  ctx.set.status = 201;
  const body = ctx.body;
  const user = await createUser(body);
  const { password, ...resp } = user;
  return resp;
}
