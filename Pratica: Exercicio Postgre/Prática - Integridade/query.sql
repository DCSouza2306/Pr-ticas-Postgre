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

CREATE TABLE "customerPhones"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    number INTEGER,
    CHECK (length(number) BETWEEN 8 AND 9)
);

CREATE TABLE "customers" (
    id SERIAL PRIMARY KEY,
    "fullName" VARCHAR(80) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(64) NOT NULL UNIQUE,
    password TEXT NOT NULL
);

