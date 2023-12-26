import { Elysia } from "elysia";
import { userRoute } from "./user/user.route";

export const plugin = new Elysia({ prefix: "/api" })
  .use(userRoute)
  .onError(({ error }) => {
    return new Response(error.toString());
  });
