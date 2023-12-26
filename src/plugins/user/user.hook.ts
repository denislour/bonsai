import {
  userCreateRequestSchema,
  userCreateResponseSchema,
} from "./user.schema";

const tags = {
  detail: {
    tags: ["Users"],
  },
};

export const userCreateHook = {
  body: userCreateRequestSchema,
  // response: {
  //   201: userCreateResponseSchema,
  // },
  ...tags,
};
