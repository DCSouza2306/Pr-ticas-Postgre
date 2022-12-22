CREATE TABLE "companies"(
	id SERIAL PRIMARY KEY,
	acronym TEXT NOT NULL UNIQUE,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE "airports" (
	id SERIAL PRIMARY KEY,
	acronym TEXT NOT NULL UNIQUE,
	name TEXT NOT NULL
);

CREATE TABLE "departures" (
	id SERIAL PRIMARY KEY,
	data DATE NOT NULL,
	time TIME WITHOUT TIME ZONE
);


CREATE TABLE "arrivals" (
	id SERIAL PRIMARY KEY,
	data DATE NOT NULL,
	time TIME WITHOUT TIME ZONE
);

CREATE TABLE "flights" (
	id SERIAL PRIMARY KEY,
	id_company INTEGER NOT NULL REFERENCES "companies"("id"),
	acronym TEXT NOT NULL UNIQUE,
	id_from INTEGER NOT NULL REFERENCES "companies"("id"),
	id_destination INTEGER NOT NULL REFERENCES "companies"("id"),
	id_departure INTEGER NOT NULL REFERENCES "departures"("id"),
	id_arrival INTEGER NOT NULL REFERENCES "arrivals"("id")	
)