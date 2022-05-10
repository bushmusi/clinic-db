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

select count(a.id), o.full_name from animals as a left join owners as o on a.owner_id = o.id group by o.full_name order by count desc limit 1;

-- Who was the last animal seen by William Tatcher?
select * from visits as vi 
join vets as v on vi.vets_id = v.id 
join animals as a on a.id = vi.animals_id
where v.name='William Tatcher'
order by vi.visit_date desc limit 1;

-- How many different animals did Stephanie Mendez see?
select count(vi.id) from visits as vi 
join vets as v on vi.vets_id = v.id 
join animals as a on a.id = vi.animals_id
where v.name='Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
select * from vets left join specializations as s on s.vets_id = vets.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select * from animals as a 
join visits as vi  on vi.animals_id = a.id
join vets as v on vi.vets_id = v.id
where v.name = 'Stephanie Mendez' and vi.visit_date between to_date('Apr 01 2020','Mon DD YYYY') and to_date('Aug 30 2020','Mon DD YYYY');select * from animals as a 
join visits as vi  on vi.animals_id = a.id
join vets as v on vi.vets_id = v.id
where v.name = 'Stephanie Mendez' and vi.visit_date between to_date('Apr 01 2020','Mon DD YYYY') and to_date('Aug 30 2020','Mon DD YYYY');

-- What animal has the most visits to vets?
select count(id), animals_id from visits
group by animals_id order by count desc limit 1;

-- Who was Maisy Smith's first visit?
select * from visits as vi join vets as v on v.id = vi.vets_id
where v.name='Maisy Smith' order by vi.visit_date asc limit 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
select * from visits as vi
join animals as a on a.id = vi.animals_id
join vets as v on v.id = vi.vets_id
order by vi.visit_date desc

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT(vets.name) AS number_of_visits FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN visits ON visits.vets_id = specializations.vets_id
WHERE specializations.species_id IS NULL
GROUP BY vets.name, specializations.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT COUNT(A.name) AS animal_visited, S.name as animal_type FROM animals A
JOIN visits ON A.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN species S ON S.id = A.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY S.name
ORDER BY COUNT(A.name) DESC;