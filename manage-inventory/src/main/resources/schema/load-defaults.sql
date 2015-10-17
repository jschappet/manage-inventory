insert into inv.person(person_id,username,first_name,last_name,password,email) values (10,'schappetj','James','Schappet','9d739e3b1ab6142d5bea2885828de015','jschappet@gmail.com');
insert into inv.person(person_id,username,first_name,last_name,password,email) values (11,'bpribyl','Brandon','Pribyl','ef86a3e43cc39fe2a45477a34fdd7682','brandon@schappet.com');

insert into inv.role(role_id, role_name) values (20,'ROLE_USER');
insert into inv.role(role_id, role_name) values (30,'ROLE_ADMIN');

insert into inv.person_role (person_role_id, person_id, role_id) values (nextval('inv.seqnum'),10, 20);
insert into inv.person_role (person_role_id, person_id, role_id) values (nextval('inv.seqnum'),10, 30);
insert into inv.person_role (person_role_id, person_id, role_id) values (nextval('inv.seqnum'),11, 20);
insert into inv.person_role (person_role_id, person_id, role_id) values (nextval('inv.seqnum'),11, 30);


insert into inv.location (location_id,name) values (nextval('inv.seqnum'), 'Demo Location');
insert into inv.property (property_id,name, description,created_by, created, location_id) values (nextval('inv.seqnum'), 'Demo Property','Demo Property','INSTALL',now(), 35);