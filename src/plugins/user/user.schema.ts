import { t, Static } from "elysia";

export const userCreateSchema = t.Object({
  email: t.String({
    format: "email",
    error: "Invalid email!",
  }),
  name: t.Optional(t.String()),
  password: t.String({ error: "Invalid password!" }),
});

export const userLoginSchema = t.Object({
  email: t.String({
    format: "email",
    error: "Invalid email!",
  }),
  password: t.String({ error: "Invalid password" }),
});

export type UserCreateInput = Static<typeof userCreateSchema>;
export type UserLoginInput = Static<typeof userLoginSchema>;
