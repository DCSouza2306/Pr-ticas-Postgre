CREATE TABLE "pictures"(
	id SERIAL PRIMARY KEY,
	url TEXT NOT NULL,
	id_product INTEGER NOT NULL REFERENCES "products"("id")
);