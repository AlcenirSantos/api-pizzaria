import { Request, response, Response } from "express";
import { UserService } from "../../services/user/UserService";

class UserController {
  
  async auth(req: Request, res: Response) {
    const { email, password } = req.body;

    const userService = new UserService();
    const user = await userService.auth({
      email: email,
      password: password
    });
    return res.json(user);
  }

  async create(req: Request, res: Response) {
    const { name, email, password } = req.body;

    const userService = new UserService();

    const user = await userService.create({
      name: name,
      email: email,
      password: password,
    });
    return res.json(user);
  }
  async detailsUser(req: Request, res: Response) {
    const userService = new UserService();
    const user = await userService.detailsUser();
    return res.json(user);
  }
}

export { UserController };
