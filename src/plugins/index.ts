import { Elysia } from "elysia";
import { userRoute } from "./user/user.router";
import swagger from "@elysiajs/swagger";
import { jwt } from "@elysiajs/jwt";
import { cookie } from "@elysiajs/cookie";

export type JWT = typeof plugins.jwt;

export const plugins = new Elysia({ prefix: "/api" })
  // swagger register
  .use(swagger())

  // jwt register
  .use(
    jwt({
      name: "jwt",
      secret: process.env.SECRET!,
    }),
  )

  // cookie register
  .use(cookie())

  // Routes
  .use(userRoute)
  .onError(({ error }) => {
    console.log(error);
    return new Response(error.toString());
  });
