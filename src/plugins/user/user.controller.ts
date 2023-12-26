import { Context } from "elysia";
import { createUser } from "./user.service";
import { UserCreateInput } from "./user.schema";

export async function registerUserHandler(
  ctx: Context<{ body: UserCreateInput }>,
) {
  const body = ctx.body;
  const user = await createUser(body);
  return user;
}
