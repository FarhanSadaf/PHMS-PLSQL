DROP TABLE Appointment;
DROP TABLE Clinic;
DROP TABLE Doctor;
DROP TABLE Test;
DROP TABLE Users;

CREATE TABLE Users(
	users_id 			NUMBER(7),
	name 				VARCHAR(30),
	date_of_birth 		DATE,
	gender 				VARCHAR(6),
	phone_no 			VARCHAR(20)
);
ALTER TABLE Users ADD CONSTRAINT Users_PK PRIMARY KEY (users_id);

CREATE TABLE Test(
	test_id 			NUMBER(7),
	users_id 			NUMBER(7) NOT NULL,
	weight 				NUMBER(7, 3),
	height 				NUMBER(7, 3),
	systolic_bp 		NUMBER(7, 3),
	diastolic_bp 		NUMBER(7, 3),
	test_date 			DATE
);
ALTER TABLE Test ADD CONSTRAINT Test_PK PRIMARY KEY (test_id);
ALTER TABLE Test ADD CONSTRAINT Test_Users_FK FOREIGN KEY (users_id) REFERENCES Users(users_id);

CREATE TABLE Doctor(
	doctor_id 			NUMBER(7),
	name 				VARCHAR(30),
	gender 				VARCHAR(6),
	qualification 		VARCHAR(40),
	department 			VARCHAR(50),
	workplace 			VARCHAR(70),
	email 				VARCHAR(30),
	phone_no 			VARCHAR(20),
	visits_available	NUMBER(4)
);
ALTER TABLE Doctor ADD CONSTRAINT Doctor_PK PRIMARY KEY (doctor_id);

CREATE TABLE Clinic(
	clinic_id 			NUMBER(7),
	name				VARCHAR(30),
	address 			VARCHAR(50),
	email 				VARCHAR(30),
	phone_no 			VARCHAR(20)
);
ALTER TABLE Clinic ADD CONSTRAINT Clinic_PK PRIMARY KEY (clinic_id);

CREATE TABLE Appointment(
	appointment_id 			NUMBER(7),
	users_id 				NUMBER(7) NOT NULL,
	doctor_id 				NUMBER(7) NOT NULL,
	clinic_id 				NUMBER(7),
	appointment_date 		DATE,
	appointment_complete	VARCHAR(3)
);
ALTER TABLE Appointment ADD CONSTRAINT Appointment_PK PRIMARY KEY (appointment_id);
ALTER TABLE Appointment ADD CONSTRAINT Appointment_Users_FK FOREIGN KEY (users_id) REFERENCES Users(users_id);
ALTER TABLE Appointment ADD CONSTRAINT Appointment_Doctor_FK FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id);
ALTER TABLE Appointment ADD CONSTRAINT Appointment_Clinic_FK FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id);


