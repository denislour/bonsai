import { t, Static } from "elysia";

const userBaseSchema = {
  email: t.String({
    format: "email",
    error: "Invalid email!",
    default: "example@example.com",
  }),
  name: t.Optional(t.String()),
};

export const userCreateRequestSchema = t.Object({
  ...userBaseSchema,
  password: t.String({ error: "Invalid password!" }),
});

export const userCreateResponseSchema = t.Object({
  id: t.Number({ default: 1 }),
  ...userBaseSchema,
});

export type UserCreateInput = Static<typeof userCreateRequestSchema>;
