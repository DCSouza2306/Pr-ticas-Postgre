CREATE TABLE "customers" (
	id SERIAL PRIMARY KEY,
	"complete_name" TEXT NOT NULL,
	"cpf" VARCHAR(11) NOT NULL UNIQUE,
	"id_adress" INTEGER NOT NULL,
	"id_phone" INTEGER NOT NULL
);

CREATE TABLE "phones_numbers" (
	id SERIAL PRIMARY KEY,
	"number" VARCHAR(11)
);

CREATE TABLE "adresses" (
	"id" SERIAL PRIMARY KEY,
	"street" TEXT NOT NULL,
	"number" VARCHAR(10) NOT NULL,
	"complement" TEXT,
	"district" TEXT NOT NULL,
	"cep" VARCHAR(8) NOT NULL,
	"id_city" INTEGER NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"id_state" INTEGER NOT NULL
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "locations" (
	"id" SERIAL PRIMARY KEY,
	"id_customer" INTEGER NOT NULL,
	"location_date" TIMESTAMP DEFAULT NOW(),
	"return_date" TIMESTAMP,
	"grade_attendance" INTEGER
);

CREATE TABLE "locations_disk" (
	"id" SERIAL PRIMARY KEY,
	"id_location" INTEGER NOT NULL,
	"id_disk" INTEGER NOT NULL,
	"movie_grade" INTEGER
);

CREATE TABLE "disks" (
	"id" SERIAL PRIMARY KEY,
	"number" INTEGER NOT NULL,
	"barcode" INTEGER NOT NULL UNIQUE,
	"id_film" INTEGER NOT NULL,
	"available" BOOLEAN DEFAULT TRUE
);

CREATE TABLE "films"(
	"id" SERIAL PRIMARY KEY,
	"tittle" TEXT NOT NULL
);

CREATE TABLE "films_categories" (
	"id" SERIAL PRIMARY KEY,
	"id_film" INTEGER NOT NULL,
	"id_category" INTEGER NOT NULL
);

CREATE TABLE "categories" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "films_actors" (
	"id" SERIAL PRIMARY KEY,
	"id_film" INTEGER NOT NULL,
	"id_actor" INTEGER NOT NULL
);

CREATE TABLE "actors" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"id_country" INTEGER NOT NULL,
	"birthday" DATE NOT NULL
);

CREATE TABLE "countries" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

ALTER TABLE "customers" ADD CONSTRAINT "customers_fk0" FOREIGN KEY ("id_adress") REFERENCES "adresses"("id");
ALTER TABLE "customers" ADD CONSTRAINT "customers_fk1" FOREIGN KEY ("id_phone") REFERENCES "phones_numbers"("id");

ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("id_city") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("id_state") REFERENCES "states"("id");

ALTER TABLE "locations" ADD CONSTRAINT "locations_fk0" FOREIGN KEY ("id_customer") REFERENCES "customers"("id");

ALTER TABLE "locations_disk" ADD CONSTRAINT "locations_disk_fk0" FOREIGN KEY ("id_location") REFERENCES "locations"("id");
ALTER TABLE "locations_disk" ADD CONSTRAINT "locations_disk_fk1" FOREIGN KEY ("id_disk") REFERENCES "disks"("id");

ALTER TABLE "disks" ADD CONSTRAINT "disks_fk0" FOREIGN KEY ("id_film") REFERENCES "films"("id");

ALTER TABLE "films_actors" ADD CONSTRAINT "films_actors_fk0" FOREIGN KEY ("id_film") REFERENCES "films"("id");
ALTER TABLE "films_actors" ADD CONSTRAINT "films_actors_fk1" FOREIGN KEY ("id_actor") REFERENCES "actors"("id");

ALTER TABLE "films_categories" ADD CONSTRAINT "films_categories_fk0" FOREIGN KEY ("id_film") REFERENCES "films"("id");
ALTER TABLE "films_categories" ADD CONSTRAINT "films_categories_fk1" FOREIGN KEY ("id_category") REFERENCES "categories"("id");

ALTER TABLE "actors" ADD CONSTRAINT "actors_fk0" FOREIGN KEY ("id_country") REFERENCES "countries"("id");
