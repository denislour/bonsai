import { Context } from "elysia";
import { CookieRequest } from "@elysiajs/cookie";

import { UserCreateInput, UserLoginInput } from "./user.schema";
import { UserNotFoundError, UserPasswordNotMatched } from "./user.error";
import { JWT } from "..";
import { UserService } from "./user.service";

export async function getUserHandler() {
  return "Get User Handler";
}

export async function userCreateHandler({
  body,
  set,
  userService,
}: {
  body: UserCreateInput;
  set: Context["set"];
  userService: UserService;
}) {
  set.status = 201;
  const user = await userService.createUser(body);
  const { password, ...resp } = user;
  return resp;
}

export async function userLoginHandler({
  body,
  userService,
  jwt,
  setCookie,
}: {
  body: UserLoginInput;
  userService: UserService;
  jwt: JWT;
  cookie: CookieRequest["cookie"];
  setCookie: CookieRequest["setCookie"];
}) {
  const user = await userService.findUserByEmail(body.email);
  if (!user) {
    throw new UserNotFoundError();
  }

  const isMatchedPassword = await userService.verifyPassword(
    body.password,
    user.password,
  );
  if (!isMatchedPassword) {
    throw new UserPasswordNotMatched();
  }

  const { password, ...rest } = user;
  setCookie("auth", await jwt.sign(rest), {
    httpOnly: true,
    maxAge: 7 * 60 * 60 * 24,
  });

  return { message: "Login sucessful!" };
}
