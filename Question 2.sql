use clinic;

create table doctor
(
 d_id int(5) PRIMARY KEY, 
 d_name varchar(30),
 d_age tinyint,
 d_gender ENUM('M','F','U')
);

insert into doctor values(9051,'Dr. Mrinal Rai','53','F' );
insert into doctor values(9052,'Dr. Sakshi Bansal','56','F' );
insert into doctor values(9053,'Dr. AK Shukla','44','M' );
insert into doctor values(9054,'Dr. Sanjay Mahajan','47','M' );
insert into doctor values(9055,'Dr. KN Tiwari','55','M' );

Start transaction;

insert into doctor values(9056,'Dr. AP Dhillon','52','M' );
insert into doctor values(9057,'Dr. Gunrinder Gill','51','M' );

SAVEPOINT doctordata;


create table patient
(
 p_id int(5) Primary Key,
 doc_assign int(5),
 FOREIGN KEY (doc_assign) REFERENCES doctor(d_id),
 p_name varchar(30),
 p_age tinyint,
 p_gender ENUM('M','F','U'),
 p_address varchar(255),
 p_disease varchar(255)
);

insert into patient values(1011,9051,'Harsh Chauhan',32,'M','Delta 1 Greater noida','Cold, Cough');
insert into patient values(1012,9052,'Nandini Gandhi',23,'F','Saharanpur, UP','Ashtma');
insert into patient values(1013,9053,'Nehal Mehta',24,'F','Malviya Nagar, New Delhi','Diabetes, Flu, High BP');
insert into patient values(1014,9054,'Lokesh Thakur',32,'M','Alpha 2 Greater Noida','Stroke');
insert into patient values(1015,9054,'Pradeep Rajput',28,'M','Ghitorni New Delhi','Covid 19');
insert into patient values(1016,9053,'Ved Gujjar',42,'M','Tilapta Greater noida','Heart Disease, Migrane');
insert into patient values(1017,9052,'Rishab Chauhan',51,'M','Agouta Bulandshahr','Diabetes, Cold');
insert into patient values(1018,9055,'Vansh Rajput',30,'M','Karol Bagh New Delhi','Ashtma');
insert into patient values(1019,9051,'Shubham Peelwan',41,'M','Delta 2 Greater noida','Food Poisoning');


create table room
(
 room_no int(4) Primary Key,
 room_type ENUM('Private','Sharing','Economy','Not admitted')
);

insert into room values(901,'Private');
insert into room values(902,'Sharing');
insert into room values(903,'Economy');
insert into room values(0,'Not admitted');


create table bill
(
 b_id int(10) PRIMARY KEY,
 p_id int(5),
 FOREIGN KEY (p_id) REFERENCES patient(p_id),
 doctor_charge Decimal(8,2),
 room_charge decimal(8,2),
 no_of_days int(3),
 lab_charge decimal(8,2),
 room_no int(4),
 FOREIGN KEY (room_no) REFERENCES room(room_no)
);	


insert into bill values (706011,1011,500,0,0,400,0);
insert into bill values (706012,1012,500,0,0,400,0);
insert into bill values (706013,1013,500,0,0,400,0);
insert into bill values (706014,1014,500,0,0,400,901);
insert into bill values (706015,1015,500,0,0,400,0);
insert into bill values (706016,1016,500,0,0,400,0);
insert into bill values (706017,1017,500,0,0,400,902);
insert into bill values (706018,1018,500,0,0,400,0);
insert into bill values (706019,1019,500,0,0,400,0);

create table inpatients
(
 in_patient int(5),
 FOREIGN KEY (in_patient) REFERENCES patient(p_id),
 in_room_no int (4),
 FOREIGN KEY (in_room_no) REFERENCES room(room_no),
 in_date_of_adm DATE,
 in_date_of_dis DATE
);

insert into inpatients values(1013,901,'2022-02-22','2022-02-25');
insert into inpatients values(1016,902,'2022-02-22','2022-02-23');

create table outpatients
(
 out_patient int(5),
 FOREIGN KEY (out_patient) REFERENCES patient(p_id),
 out_date_of_adm DATE
);

insert into outpatients values (1011,'2022-02-22');
insert into outpatients values (1012,'2022-02-23');
insert into outpatients values (1014,'2022-02-24');
insert into outpatients values (1015,'2022-02-25');
insert into outpatients values (1017,'2022-02-26');
insert into outpatients values (1018,'2022-02-27');
insert into outpatients values (1019,'2022-02-28');

CREATE USER 'harsh'@'localhost' IDENTIFIED BY 'harsh' ;
grant  select  on  *.*  to  'harsh'@'localhost'  ;

CREATE USER 'doctor'@'localhost' IDENTIFIED BY 'doctor' ;
GRANT select, insert, update, delete   ON clinic.doctor  TO 'doctor'@'localhost' ;

CREATE USER 'patient'@'localhost' IDENTIFIED BY 'doctor' ;
GRANT select, insert, update, delete   ON clinic.patient  TO 'patient'@'localhost' ;




