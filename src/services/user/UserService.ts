import { IUser } from "../../models/user";
import prismaClient from "../../prisma";
import { compare, hash } from 'bcryptjs';
import { IAuth } from "../../models/auth";
import { sign } from "jsonwebtoken";

class UserService {
  async create({ name, email, password }: IUser) {
    if (!email) throw new Error("E-mail Invalido");
    const userExists = await prismaClient.user.findFirst({
      where: { email: email },
    });
    if (userExists) throw new Error("E-mail ja Existe!");

    const passHash = await hash(password, 8);

    const user = await prismaClient.user.create({
      data: {
        name,
        email,
        password: passHash
      },
      select:{
        id: true,
        name: true,
        email: true
      }
    });
    return user;
  }
  async auth({email, password}: IAuth) {
    const user  = await prismaClient.user.findFirst({
      where:{
        email: email
      }
    });
    if (!user) {
      throw new Error('Usuario/senha não existe.')
    }

    const passwordMatch = await compare(password, user.password);
    
    if (!passwordMatch) {
      throw new Error('Usuario/senha não existe.');
    }

    const token = sign({
      name: user.name,
      email: user.email
    },
    process.env.JWT_SECRET,
    {
      subject: user.id,
      expiresIn: '1d'
    }
    )

    return {
      id: user.id,
      name: user.name,
      email: user.email,
      token: token
    }
  }
  async detailsUser(){
    return {ok:true}
  }
}

export { UserService };
