/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int NOT NULL,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL,
    PRIMARY KEY (id)
);

/* Part 2*/

ALTER TABLE animals ADD species varchar(100);

/* Part 3*/

CREATE TABLE owners (
    id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    full_name varchar(100) NOT NULL,
    age integer,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    name varchar(100) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id int,
ADD CONSTRAINT fk_species_id
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owners_id int,
ADD CONSTRAINT fk_owners_id
FOREIGN KEY (owners_id)
REFERENCES owners(id);

/* Part 4*/

CREATE TABLE vets (
    id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    name varchar(100) NOT NULL,
    age int,
    date_of_graduation date, 
    PRIMARY KEY (id)
);

CREATE TABLE specializations (
  vets_id	INT,
  species_id	INT,
  PRIMARY KEY (vets_id, species_id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  vets_id	INT,
  animals_id	INT,
  date		DATE,
  PRIMARY KEY (vets_id, animals_id,date),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
  CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id)
);
