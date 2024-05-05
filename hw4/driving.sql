CREATE TABLE InsuranceCo (
  name VARCHAR(32) PRIMARY KEY,
  phone INTEGER
);

CREATE TABLE Person (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(32)
);

CREATE TABLE Vehicle (
  licensePlate VARCHAR(32) PRIMARY KEY,
  year INTEGER,
  maxLiability REAL,
  insuranceCompany VARCHAR(32) REFERENCES InsuranceCo,
  ssn INTEGER REFERENCES Person
);

CREATE TABLE Car (
  vehicleLicensePlate VARCHAR(32) REFERENCES Vehicle,
  PRIMARY KEY(vehicleLicenseID),
  make VARCHAR(32)
);

CREATE TABLE Truck (
  truckLicensePlate VARCHAR(32) REFERENCES Vehicle,
  PRIMARY KEY (truckLicensePlate),
  profDriverSsn INTEGER REFERENCES ProfessionalDriver,
  capacity INTEGER
);

CREATE TABLE Driver(
  ssn INTEGER REFERENCES Person,
  PRIMARY KEY(ssn),
  driverID VARCHAR(32)
);

CREATE TABLE NonProfessionalDriver (
  nonProfDriverSsn INTEGER REFERENCES Driver,
  PRIMARY KEY(nonProfDriverSsn),
);

CREATE TABLE Drives (
  nonProfDriverSsn INTEGER REFERENCES NonProfessionalDriver,
  carLicensePlate VARCHAR(32) REFERENCES Car,
  PRIMARY KEY(nonProfDriverSsn, carLicensePlate)
);

CREATE TABLE ProfessionalDriver (
  profDriverSsn INTEGER REFERENCES Driver,
  PRIMARY KEY(profDriverSsn),
  medicalHistory VARCHAR(64)
);

-- part B
-- The relation in my relational schema that reperesents the "insures" in the E/R diagram is
-- the relationship between InsuranceCo and Vehicle tables. The reasoning is, as this is a many-to-one relation,
-- with an insurance company insuring many vehicles, but a vehicle can only have one insurance,
-- we reference the insuranceCo table from the vehicle table with a foreign key. This
-- enforces that many-to-one relationship.

-- part C
-- The difference between the representation of the "drives" and "operates relationships"
-- in my relational schema stems from the relationships that they hold. The "drives"
-- relationship is a many-to-many relationship, while the "operates" relationship is a 
-- one-to-many relationship. In our "implementation", so to speak, we represent a one-to-many
-- relationship by having a foreign key referencing ProfessionalDriver. On the other hand,
-- we represent a many-to-many relationship by creating a new table, Drives, as an
-- intermediate between the two tables which can represent a many-to-many relationship 
-- properly.