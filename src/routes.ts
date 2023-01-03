import { Request, Response, Router } from "express";

const router = Router();

router.get("/api/test", (req: Request, res: Response) => {
    return res.json({initial: "Hello World!"});
})

export {router};