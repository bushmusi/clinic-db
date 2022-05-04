/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Agumon',to_date('03 Feb 2022', 'DD Mon YYYY'),10.23,TRUE,0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Gabumon',to_date('15 Nov 2018','DD Mon YYYY'),'8',TRUE,2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Pikachu',to_date('07 Jan 2021','DD Mon YYYY'),'15.04',FALSE,1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Devimon',to_date('12 May 2017','DD Mon YYYY'),'11',TRUE,5); 