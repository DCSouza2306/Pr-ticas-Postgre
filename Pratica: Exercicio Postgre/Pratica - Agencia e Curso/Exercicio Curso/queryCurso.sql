CREATE TABLE "students" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"cpf" VARCHAR(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"current_class" INTEGER NOT NULL,
	"current_project" INTEGER NOT NULL
);

CREATE TABLE "classes" (
	"id" SERIAL PRIMARY KEY,
	"class_code" TEXT NOT NULL UNIQUE
);

CREATE TABLE "students_classes" (
	"id" SERIAL PRIMARY KEY,
	"id_student" INTEGER NOT NULL,
	"id_class" INTEGER NOT NULL,
	"entry_at" DATE DEFAULT NOW(),
	"leave_at" DATE
);

CREATE TYPE "note_type" AS ENUM(
	'Abaixo das Expectativas',
	'Dentro das Expectativas',
	'Acima das Expectativas');

CREATE TABLE "projects_students" (
	"id" SERIAL PRIMARY KEY,
	"id_student" INTEGER NOT NULL,
	"delivered_at" DATE,
	"note" note_type,
	"id_project" INTEGER NOT NULL
);

CREATE TABLE "modules" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "projects" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"id_module" INTEGER NOT NULL
);

ALTER TABLE "students" ADD CONSTRAINT "students_fk0" FOREIGN KEY ("current_class") REFERENCES "students_classes"("id");
ALTER TABLE "students" ADD CONSTRAINT "students_fk1" FOREIGN KEY ("current_project") REFERENCES "projects_students"("id");

ALTER TABLE "students_classes" ADD CONSTRAINT "students_classes_fk0" FOREIGN KEY ("id_student") REFERENCES "students"("id");
ALTER TABLE "students_classes" ADD CONSTRAINT "students_classes_fk1" FOREIGN KEY ("id_class") REFERENCES "classes"("id");

ALTER TABLE "projects_students" ADD CONSTRAINT "projects_students_fk0" FOREIGN KEY ("id_student") REFERENCES "students"("id");
ALTER TABLE "projects_students" ADD CONSTRAINT "projects_students_fk1" FOREIGN KEY ("id_project") REFERENCES "projects"("id");

ALTER TABLE "projects" ADD CONSTRAINT "projects_fk0" FOREIGN KEY ("id_module") REFERENCES "modules"("id");






