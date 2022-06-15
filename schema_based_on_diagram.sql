CREATE TABLE patients (
  id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  name	varchar(100) NOT NULL,
  date_of_birth	date,
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
  status varchar(100),
  PRIMARY KEY (id),
  CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices (
  id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  total_amout DECIMAL,
  generated_at TIMESTAMP DEFAULT NOW(),
  payed_at TIMESTAMP DEFAULT NOW(),
  medical_history_id int,
  PRIMARY KEY (id),
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  unit_price DECIMAL,
  quantity int NOT NULL,
  total_price DECIMAL,
  invoice_id int,
  treatment_id int,
  PRIMARY KEY (id),
  CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  CONSTRAINT fk_treatments FOREIGN KEY(treatment_id)  REFERENCES  treatments(id)
);

CREATE TABLE treatments_history (
  id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  medical_histories_id int,
  treatment_id int,
  PRIMARY KEY (id),
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id),
  CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);


CREATE INDEX ON medical_histories (patient_id);

CREATE INDEX ON treatments_history (medical_histories_id);

CREATE INDEX ON treatments_history (treatment_id);

CREATE INDEX ON invoices (medical_history_id);

CREATE INDEX ON invoice_items (invoice_id);

CREATE INDEX ON invoice_items (treatment_id);
