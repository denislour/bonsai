import { Elysia } from "elysia";
import { plugin } from "./plugins";
import swagger from "@elysiajs/swagger";

export const app = new Elysia().use(swagger()).use(plugin).listen(3000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`,
);
