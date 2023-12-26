import prisma from "../../utils/prisma";
import { UserCreateInput } from "./user.schema";

export async function createUser(userCreateInput: UserCreateInput) {
  const { password, ...rest } = userCreateInput;
  const hashPassword = await Bun.password.hash(password);
  const user = await prisma.user.create({
    data: { ...rest, password: hashPassword },
  });

  return user;
}
