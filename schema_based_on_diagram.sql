--create patients table
CREATE TABLE patients(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name CHAR(255),
	date_of_birth DATE
);

-- create medical_hitories table
CREATE TABLE medical_histories(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	admitted_at TIME,
	patient_id INT FOREIGN KEY REFERENCES patients(id),
	status CHAR(255)
);

-- create invoices table
CREATE TABLE invoices(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	total_amount DECIMAL,
	generated_at TIME,
	payed_at TIME,
	medical_history_id INT FOREIGN KEY REFERENCES medical_histories(id)
);

--create invoice_items table
CREATE TABLE invoice_items(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT FOREIGN KEY REFERENCES invoices(id),
	treatment_id INT FOREIGN KEY REFERENCES treatments(id)
);

-- create treatments table
CREATE TABLE treatments(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	type CHAR(255),
	name CHAR(255)
);

-- add table relationships
-- create a "join table" called hospitalizations for the medical_histories and treatments tables
CREATE TABLE hospitalizations(
	medical_history_id INT FOREIGN KEY REFERENCES medical_histories(id),
	treatment_id INT FOREIGN KEY REFERENCES treatments(id)
);

--create indexes on foreign keys
CREATE INDEX patient_id_asc ON medical_histories(patient_id ASC);
CREATE INDEX medical_history_id_asc ON invoices(medical_history_id ASC);
CREATE INDEX invoice_id_asc ON invoice_items(invoice_id ASC);
CREATE INDEX treatment_id_asc ON invoice_items(treatment_id ASC);


