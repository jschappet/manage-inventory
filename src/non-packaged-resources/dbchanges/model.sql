DROP  SCHEMA inv CASCADE ;
CREATE SCHEMA inv ;
CREATE SEQUENCE inv.seqnum INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 31 CACHE 1;

CREATE TABLE inv.system_setting (
       name VARCHAR(30) NOT NULL
     , value TEXT
     , active BOOLEAN
     , notes TEXT
     , last_updated_by TEXT
     , last_updated TIMESTAMP
     , PRIMARY KEY (name)
);

CREATE TABLE inv.person (
       person_id INT NOT NULL
     , first_name TEXT NOT NULL
     , last_name TEXT NOT NULL
     , username TEXT
     , consent BOOLEAN
     , deleted BOOLEAN DEFAULT false
     , language_id INT
     , password TEXT
     , PRIMARY KEY (person_id)
);

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

CREATE TABLE inv.message (
       message_id INT NOT NULL
     , message_name TEXT NOT NULL
     , message_type TEXT NOT NULL
     , version INT NOT NULL
     , message_text TEXT NOT NULL
     , irb_approval BOOLEAN
     , irb_approval_start_date TIMESTAMP
     , irb_approval_end_date TIMESTAMP
     , description TEXT
     , PRIMARY KEY (message_id)
);

CREATE TABLE inv.property (
       property_id INT NOT NULL
     , name TEXT NOT NULL
     , description TEXT NOT NULL
     , created_by TEXT NOT NULL
     , created TIMESTAMP
     , updated_by TEXT
     , updated TIMESTAMP
     , location_id INT NOT NULL
     , PRIMARY KEY (property_id)
     , CONSTRAINT FK_property_1 FOREIGN KEY (location_id)
                  REFERENCES inv.location (location_id)
);

CREATE TABLE inv.task (
       task_id INT NOT NULL
     , task_type TEXT NOT NULL
     , name TEXT NOT NULL
     , created TIMESTAMP
     , created_by TEXT NOT NULL
     , assigned_to TEXT NOT NULL
     , deadline TIMESTAMP NOT NULL
     , completed TIMESTAMP
     , property_id INT NOT NULL
     , PRIMARY KEY (task_id)
     , CONSTRAINT FK_task_1 FOREIGN KEY (property_id)
                  REFERENCES inv.property (property_id)
);

