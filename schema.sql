CREATE DATABASE vet_clinic
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered bool,
    weight_kg float8
);

alter table animals add column species varchar(100)

create table owners(
    id BIGSERIAL  primary key,
    full_name varchar(100),
    age int
);

create table species(
    id BIGSERIAL  primary key,
    name varchar(100)
);

alter table animals drop column species;

alter table animals add  column species_id bigint;
alter table animals add constraint fk_species foreign key (species_id) references species(id) on delete cascade;

alter table animals add column owner_id bigint;
alter table animals add constraint fk_owner foreign key (owner_id) references owners(id) on delete cascade;

create table vets(
    id BIGSERIAL primary key ,
    name varchar(100),
    age int,
    date_of_graduation date
);

create table specializations(
	id bigserial primary key,
    vets_id BIGSERIAL ,
    species_id BIGSERIAL,
    foreign key (vets_id) references vets(id) on delete cascade,
    foreign key (species_id) references species(id) on delete cascade
);

alter table animals add constraint make_primary primary key (id);
create table visits (
	id bigserial primary key,
	vets_id bigint,
	animals_id bigint,
	visit_date date,
	foreign key (vets_id) references vets(id) on delete cascade,
	foreign key (animals_id) references animals(id) on delete cascade
);
