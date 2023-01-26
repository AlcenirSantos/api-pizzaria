import { Router } from "express";
import { UserController } from "./controllers/user/UserController";
import { IsAuthenticated } from "./middlewares/isAuthenticated";

const router = Router();

router.post('/api/users', new UserController().create);
router.post('/api/users/auth', new UserController().auth);
router.get('/api/users/me', IsAuthenticated, new UserController().detailsUser);

export {router};