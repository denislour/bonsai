import prisma from "../../utils/prisma";
import { UserCreateInput } from "./user.schema";

export class UserService {
  async createUser(userCreateInput: UserCreateInput) {
    const { password, ...rest } = userCreateInput;
    const hashPassword = await Bun.password.hash(password);
    const user = await prisma.user.create({
      data: { ...rest, password: hashPassword },
    });

    return user;
  }

  async findUserByEmail(email: string) {
    return prisma.user.findUnique({ where: { email } });
  }

  async verifyPassword(password: string, hashPassword: string) {
    return Bun.password.verify(password, hashPassword);
  }
}
