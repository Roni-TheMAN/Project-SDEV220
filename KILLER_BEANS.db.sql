BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "items" (
	"item_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"description"	TEXT,
	"quantity"	INTEGER NOT NULL,
	"price"	REAL NOT NULL,
	"reorder_level"	INTEGER NOT NULL,
	PRIMARY KEY("item_id")
);
CREATE TABLE IF NOT EXISTS "customers" (
	"customer_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"email"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("customer_id")
);
CREATE TABLE IF NOT EXISTS "orders" (
	"order_id"	INTEGER,
	"customer_id"	INTEGER,
	"order_date"	TEXT NOT NULL,
	"total_amount"	REAL NOT NULL,
	FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id"),
	PRIMARY KEY("order_id")
);
CREATE TABLE IF NOT EXISTS "order_items" (
	"order_item_id"	INTEGER,
	"order_id"	INTEGER,
	"item_id"	INTEGER,
	"quantity"	INTEGER NOT NULL,
	"price"	REAL NOT NULL,
	FOREIGN KEY("order_id") REFERENCES "orders"("order_id"),
	FOREIGN KEY("item_id") REFERENCES "items"("item_id"),
	PRIMARY KEY("order_item_id")
);
INSERT INTO "items" VALUES (1,'Coffee Beans','Arabica beans',100,10.99,20);
INSERT INTO "items" VALUES (2,'Milk','Whole Milk',50,3.99,10);
INSERT INTO "items" VALUES (3,'Syrups','Vanilla Syrup',20,5.99,5);
INSERT INTO "items" VALUES (4,'Cups','12 oz paper cups',200,0.25,50);
INSERT INTO "items" VALUES (5,'Other Supplies','Strirrers',1000,0.05,200);
INSERT INTO "items" VALUES (6,'Milk','Almond Milk',50,4.99,10);
INSERT INTO "items" VALUES (7,'Syrups','Caramel Syrup',20,5.99,5);
COMMIT;
