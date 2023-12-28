import { Elysia } from "elysia";
import { plugins } from "./plugins";

export const app = new Elysia().use(plugins).listen(3000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`,
);
