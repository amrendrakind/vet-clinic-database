CREATE TABLE patients (
  id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  name	varchar(100) NOT NULL,
  date_of_birth	date NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
  id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  type varchar(100) NOT NULL,
  name	varchar(100) NOT NULL,
  date_of_birth	date,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  admitted_at TIMESTAMP DEFAULT NOW(),
  patient_id int,
  status varchar(100) NOT NULL,
  CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients(id)
)