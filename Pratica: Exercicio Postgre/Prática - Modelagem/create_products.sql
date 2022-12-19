CREATE TABLE "products" (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	price INTEGER NOT NULL,
	stock INTEGER NOT NULL,
	id_category INTEGER NOT NULL REFERENCES "categories"("id"),
	id_size INTEGER NOT NULL REFERENCES "sizes"("id")
);