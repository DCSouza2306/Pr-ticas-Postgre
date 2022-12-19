CREATE TABLE "purchases"(
	id SERIAL PRIMARY KEY,
	id_product INTEGER NOT NULL REFERENCES "products"("id"),
	qtd INTEGER NOT NULL,
	total_price INTEGER NOT NULL,
	id_shopping INTEGER NOT NULL REFERENCES "shopping"(id)
);