CREATE TABLE "shopping" (
	id SERIAL PRIMARY KEY,
	id_user INTEGER NOT NULL REFERENCES "users"("id"),
	adress TEXT NOT NULL,
	purchase_date DATE NOT NULL,
	status TEXT NOT NULL 
	CHECK(
		status = 'criado' OR
		status = 'pago' OR
		status = 'entregue' OR
		status = 'cancelado')
);