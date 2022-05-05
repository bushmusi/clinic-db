select * from animals where name like '%mon'

select * from animals where date_of_birth between '01-01-2016' and '01-01-2019'

select * from animals where neutered and escape_attempts < 3

select date_of_birth from animals where name = 'Agumon' or name='Pikachu'

select name ,escape_attempts from animals where weight_kg > 10.5

select * from animals where neutered

select * from animals where name != 'Gabumon'

select * from animals where weight_kg between 10.4 and 17.3

begin;
update animals set species = 'unspecified';
rollback;

begin;
update animals set species = 'digimon'
where name like '%mon';

update animals set species = 'pokemon'
where species is null;
commit;

begin;
delete from animals;
rollback;

begin;
delete from animals where date_of_birth > to_date('01 Jan 2022','DD Mon YYYY');
savepoint sp1;
update animals set weight_kg = weight_kg * (-1);
rollback to sp1;
update animals set weight_kg = weight_kg *(-1) where weight_kg < 0;
commit;

select count(id) from animals;

select count(id) from animals;

select avg(weight_kg) as average_weight from animals ;

select neutered,sum(escape_attempts) from animals group by neutered order by sum desc limit 1;

select species,min(weight_kg) as minimum,max(weight_kg) as maximum from animals group by species;

select species,avg(escape_attempts) as Average_escape from animals where date_of_birth between '1990-01-01' and '2000-01-01' group by species;

select * from animals as a join owners as o on a.owner_id = o.id where o.full_name = 'Melody Pond ';

select * from animals as a join species as s on a.species_id = s.id where s.name='Pokemon';

select * from animals as a right join owners as o on a.owner_id = o.id ;

select count(s.id),s.name from animals as a join species as s on a.species_id = s.id group by s.id;

select * from animals as a 
join species as s on a.species_id = s.id 
join owners as o on a.owner_id = o.id 
where s.name = 'Digimon' and o.full_name = 'Jennifer Orwell';

select * from animals as a left join owners as o on a.owner_id = o.id where o.full_name = 'Dean Winchester' and escape_attempts = 0;

select count(a.id), o.full_name from animals as a left join owners as o on a.owner_id = o.id group by o.full_name order by count desc limit 1