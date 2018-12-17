DROP TABLE owners;
DROP TABLE animals;

CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  animal_name VARCHAR(255),
  animal_type VARCHAR(255),
  admin_date VARCHAR(255),
  adopt_ready BOOLEAN,
  owner_id INT8 REFERENCES owners(id)
);
