-- CreateTable
CREATE TABLE "t_categories" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "t_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_products" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "banner" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "categoryId" TEXT NOT NULL,

    CONSTRAINT "t_products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_orders" (
    "id" TEXT NOT NULL,
    "table" INTEGER NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "draft" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "t_orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_order_items" (
    "id" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "orderId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "t_order_items_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "t_products" ADD CONSTRAINT "t_products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "t_categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "t_order_items" ADD CONSTRAINT "t_order_items_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "t_orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "t_order_items" ADD CONSTRAINT "t_order_items_productId_fkey" FOREIGN KEY ("productId") REFERENCES "t_products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
