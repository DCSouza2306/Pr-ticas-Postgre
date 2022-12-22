CREATE TABLE "states" (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE "cities"(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "stateId" INTEGER NOT NULL
);

CREATE TABLE "customerAddresses"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    street TEXT NOT NULL,
    number VARCHAR(10) NOT NULL,
    complement TEXT NULL,
    "postalCode" INTEGER NOT NULL,
    "cityId" INTEGER NOT NULL
);

CREATE TYPE phone_type AS ENUM ('landline','mobile');

CREATE TABLE "customerPhones"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    number INTEGER NOT NULL,
    type phone_type NOT NULL
);

CREATE TABLE "customers" (
    id SERIAL PRIMARY KEY,
    "fullName" VARCHAR(80) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(64) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    "adressId" INTEGER NOT NULL
);

CREATE TABLE "bankAccount"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "accountNumber" INTEGER NOT NULL UNIQUE,
    agency INTEGER NOT NULL,
    "openDate" TIMESTAMP DEFAULT NOW(),
    "closeDate" DATE DEFAULT NULL
);

CREATE TYPE "transactionType" AS ENUM ('deposit','withdraw');

CREATE TABLE "transactions"(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    amount INTEGER NOT NULL CHECK(amount > 0),
    type "transactionType" NOT NULL,
    time TIMESTAMP DEFAULT NOW(),
    description TEXT NULL,
    cancelled BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "creditCards"(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    name VARCHAR(80) NOT NULL,
    number INTEGER NOT NULL UNIQUE,
    "securityCode" INTEGER NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    password TEXT NOT NULL,
    "limit" INTEGER NOT NULL CHECK ("limit" > 0));

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" 
FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" 
FOREIGN KEY ("cityId") REFERENCES "cities"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" 
FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customers" ADD CONSTRAINT "customers_fk0"
FOREIGN KEY ()

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" 
FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" 
FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" 
FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" 
FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");
