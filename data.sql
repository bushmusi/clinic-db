INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Agumon',to_date('03 Feb 2022', 'DD Mon YYYY'),10.23,TRUE,0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Gabumon',to_date('15 Nov 2018','DD Mon YYYY'),'8',TRUE,2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Pikachu',to_date('07 Jan 2021','DD Mon YYYY'),'15.04',FALSE,1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Devimon',to_date('12 May 2017','DD Mon YYYY'),'11',TRUE,5); 

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Charmander',to_date('08 Feb 2020', 'DD Mon YYYY'),11,FALSE,0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Plantmon',to_date('15 Nov 2021','DD Mon YYYY'),'5.7',TRUE,2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Squirtle',to_date('02 Jan 1993','DD Mon YYYY'),'12.13',FALSE,3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Angemon',to_date('12 Jun 2005','DD Mon YYYY'),'15',TRUE,1); 

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Boarmon',to_date('07 Jun 2005', 'DD Mon YYYY'),20.4,TRUE,7);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Blossom',to_date('13 Oct 1998','DD Mon YYYY'),'17',TRUE,3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Ditto',to_date('14 May 2022','DD Mon YYYY'),'22',TRUE,4);

insert into owners (full_name,age) values('Sam Smith',34);
insert into owners (full_name,age) values('Jodie Whittaker',38);
insert into owners (full_name,age) values('Jennifer Orwell',19);
insert into owners (full_name,age) values('Bob',45);
insert into owners (full_name,age) values('Melody Pond',77);
insert into owners (full_name,age) values('Dean Winchester',14);

insert into species (name) values('Pokemon');
insert into species (name) values('Digimon');

update animals set species_id = (select id from species where name= 'Digimon' limit 1) where name like '%mon';

update animals set species_id = (select id from species where name= 'Pokemon' limit 1) where name not like '%mon';

update animals set owner_id = (select id from owners where full_name = 'Sam Smith') where name = 'Angemon';

update animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell' limit 1) where name = 'Gabumon' or name = 'Pikachu';

update animals set owner_id = (select id from owners where full_name = 'Bob' limit 1) where name = 'Plantmon' or name = 'Devimon';

update animals set owner_id = (select id from owners where full_name = 'Melody Pond' limit 1) where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';

update animals set owner_id = (select id from owners where full_name = 'Dean Winchester' limit 1) where name = 'Angemon' or name = 'Boarmon';