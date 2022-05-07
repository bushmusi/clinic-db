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

insert into vets (name, age, date_of_graduation) values('William Tatcher', 45,to_date('23 Apr 2000','DD Mon YYYY'))
insert into vets (name,age,date_of_graduation) values('Maisy Smith', 26,to_date('Jan 17 2019', 'Mon DD YYYY')) 
insert into vets (name,age,date_of_graduation) values('Stephanie Mendez', 64,to_date(' May 4 1981', 'Mon DD YYYY')) 
insert into vets (name, age, date_of_graduation) values('Jack Harkness', 38, to_date('Jun 8 2008', 'Mon DD YYYY'))

insert into specializations (vets_id,species_id) values((select id from vets where name='Vet William Tatcher' limit 1),(select id from species where name='Pokemon' limit 1))
insert into specializations (vets_id, species_id) values((select id from vets where name='Vet Stephanie Mendez' limit 1), (select id from species where name = 'Digimon' limit 1))
insert into specializations (vets_id,species_id) values((select id from vets where name='Vet Stephanie Mendez' limit 1), (select id from species where name = 'Pokemon' limit 1))
insert into specializations (vets_id, species_id) values ((select id from vets where name='Vet Jack Harkness'), (select id from species where name='Digimon'))

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Agumon'),
	(select id from vets where name = 'William Tatcher'),
	to_date('May 24 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Agumon'),
	(select id from vets where name = 'Stephanie Mendez'),
	to_date('Jul 22 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Gabumon'),
	(select id from vets where name = 'Jack Harkness'),
	to_date('Jan 5 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Pikachu'),
	(select id from vets where name = 'Maisy Smith'),
	to_date('Mar 8 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Pikachu'),
	(select id from vets where name = 'Maisy Smith'),
	to_date('May 14 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Charmander'),
	(select id from vets where name = 'Jack Harkness'),
	to_date('Feb 24 2021','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Plantmon'),
	(select id from vets where name = 'Maisy Smith '),
	to_date('Dec 21 2019','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Plantmon'),
	(select id from vets where name = 'William Tatche'),
	to_date('Aug 10 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Plantmon'),
	(select id from vets where name = 'Maisy Smith'),
	to_date('Apr 7 2021','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Squirtle'),
	(select id from vets where name = 'Stephanie Mendez'),
	to_date('Sep 29 2019','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Angemon'),
	(select id from vets where name = 'Jack Harkness'),
	to_date('Oct 3 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Angemon'),
	(select id from vets where name = 'Jack Harknes'),
	to_date('Nov 4 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Boarmon'),
	(select id from vets where name = 'Maisy Smith'),
	to_date('Jan 24 2019','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Boarmon'),
	(select id from vets where name = 'Maisy Smith'),
	to_date('May 15 2019','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Boarmon'),
	(select id from vets where name = 'Maisy Smith'),
	to_date('Feb 27 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Boarmon'),
	(select id from vets where name = 'Maisy Smith'),
	to_date('Aug 3 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Blossom'),
	(select id from vets where name = 'Stephanie Mendez'),
	to_date('May 24 2020','Mon DD YYYY')
);

insert into visits (animals_id, vets_id,visit_date)
values(
	(select id from animals where name = 'Blossom'),
	(select id from vets where name = 'William Tatcher'),
	to_date('Jan 11 2021','Mon DD YYYY')
);
