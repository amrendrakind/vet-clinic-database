/* Populate database with sample data. */

INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon','2020-02-03',0,'1',10.23);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon','2018-11-15',2,'1',8);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3,'Pikachu','2021-01-07',1,'0',15.02);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4,'Devimon','2017-05-12',5,'1',11);

-- Adding more data

INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander','2020-02-08',0,'false',-11);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (6,'Plantmon','2021-11-15',2,'true',-5.7);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (7,'Squirtle','1993-04-02',3,'false',-12.13);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (8,'Angemon','2005-06-12',1,'true',-45);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (9,'Boarmon','2005-06-07',7,'true',20.4);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (10,'Blossom','1998-10-13',3,'true',17);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (11,'Ditto','2022-05-14',4,'true',22);

-- Adding more data Part 3

INSERT INTO owners(full_name, age)
VALUES('Sam Smith',34),
      ('Jennifer Orwell',19),
      ('Bob',45),
      ('Melody Pond',77),            
      ('Dean Winchester',14),  
      ('Jodie Whittaker',38);        

INSERT INTO species(name)
VALUES('Pokemon'),
      ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

-- Adding more data Part 4

BEGIN;
INSERT INTO vets (name, age, date_of_graduation) 
VALUES('William Tatcher', 45, '2000-04-23'),
      ('Maisy Smith', 26, '2019-01-17'),
      ('Stephanie Mendez', 64, '1980-05-04'),
      ('Jack Harkness', 38, '2008-06-08');
COMMIT;

BEGIN;
INSERT INTO specializations (vets_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id FROM species WHERE name = 'Pokemon')),
      ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM species WHERE name = 'Digimon')),
      ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM species WHERE name = 'Pokemon')),
      ((SELECT id FROM vets WHERE name = 'Jack Harkness'),(SELECT id FROM species WHERE name = 'Digimon'));
COMMIT;

BEGIN;
INSERT INTO visits (vets_id, animals_id, date)
VALUES((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id FROM animals WHERE name = 'Agumon'), '2020-05-24'),
      ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM animals WHERE name = 'Agumon'), '2020-07-22'),
      ((SELECT id FROM vets WHERE name = 'Jack Harkness'),(SELECT id FROM animals WHERE name = 'Gabumon'), '2021-02-02'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'),(SELECT id FROM animals WHERE name = 'Pikachu'), '2020-01-05'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'),(SELECT id FROM animals WHERE name = 'Pikachu'), '2020-03-08'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'),(SELECT id FROM animals WHERE name = 'Pikachu'), '2020-05-14'),
      ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM animals WHERE name = 'Devimon'), '2021-05-04'),
      ((SELECT id FROM vets WHERE name = 'Jack Harkness'),(SELECT id FROM animals WHERE name = 'Charmander'), '2021-02-24'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'),(SELECT id FROM animals WHERE name = 'Plantmon'), '2019-12-21'),
      ((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id FROM animals WHERE name = 'Plantmon'), '2020-08-10'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'),(SELECT id FROM animals WHERE name = 'Plantmon'), '2021-04-07'),
      ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM animals WHERE name = 'Squirtle'), '2019-09-29'),
      ((SELECT id FROM vets WHERE name = 'Jack Harkness'),(SELECT id FROM animals WHERE name = 'Angemon'), '2020-10-03'),
      ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), '2020-11-04'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'),(SELECT id FROM animals WHERE name = 'Boarmon'), '2019-01-24'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'),'2019-05-15'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'),(SELECT id FROM animals WHERE name = 'Boarmon'), '2020-02-27'),
      ((SELECT id FROM vets WHERE name = 'Maisy Smith'),(SELECT id FROM animals WHERE name = 'Boarmon'), '2020-08-03'),
      ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM animals WHERE name = 'Blossom'), '2020-05-24'),
      ((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id FROM animals WHERE name = 'Blossom'), '2021-01-11');
COMMIT;

-- Adding more data Part 5

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date) SELECT * FROM (SELECT id FROM animals) animals_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
