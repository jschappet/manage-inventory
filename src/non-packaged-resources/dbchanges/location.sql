CREATE SCHEMA schemaname
  AUTHORIZATION test;
CREATE SEQUENCE schemaname.seqnum
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 31
  CACHE 1;
CREATE TABLE inv.location (
       location_id INT NOT NULL
     , name TEXT NOT NULL
     , description TEXT
     , address_1 TEXT
     , address_2 TEXT
     , city TEXT
     , state TEXT
     , zip_code TEXT
     , PRIMARY KEY (location_id)
);

