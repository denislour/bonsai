import { Elysia } from "elysia";
import { plugin } from "./plugins";

export const app = new Elysia()
  .get("/", () => "Hello Elysia")
  .use(plugin)
  .listen(3000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`,
);
