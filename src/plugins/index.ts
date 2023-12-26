import { Elysia } from "elysia";
import { swagger } from "@elysiajs/swagger";
import { userRoute } from "./user/user.route";

export const plugin = new Elysia({ prefix: "/api" })
  .use(swagger())
  .use(userRoute)
  .onError(({ error }) => {
    return new Response(error.toString());
  });
