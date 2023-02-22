/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id integer,
   name text,
   date_of_birth date,
	escape_attempts integer,
	neutered boolean,
	weight_kg decimal
);

/* Day 2 */

ALTER TABLE animals ADD COLUMN species text;

/* Day 3 */

CREATE TABLE owners
(
    id serial primary key,
    full_name text,
    age integer
);

CREATE TABLE species
(
    id serial primary key,
    name text,
);

CREATE SEQUENCE id_seq OWNED By animals.id;
SELECT SETVAL('id_seq', (select max(id) from animals), false);
ALTER TABLE animals ALTER COLUMN id SET DEFAULT nextval('id_seq');
ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER TABLE animals 
	DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id integer;
ALTER TABLE animals 
ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
ADD COLUMN owner_id integer;
ALTER TABLE animals 
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);