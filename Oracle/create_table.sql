-- DROP TABLES

DROP TABLE Appointment;
DROP TABLE Clinic;
DROP TABLE Doctor;
DROP TABLE Test;
DROP TABLE Users;

-- CREATE TABLES

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


-- TRIGGERS

-- Reduce 'Doctor.visits_available' by 1 on each 'Appointment' entry
CREATE OR REPLACE TRIGGER reduce_visits_available
  BEFORE INSERT OR UPDATE ON Appointment
FOR EACH ROW
DECLARE
	available_visits Doctor.visits_available%TYPE;
BEGIN
	SELECT visits_available INTO available_visits 
	  FROM Doctor
	  WHERE doctor_id=:NEW.doctor_id;
	
	IF available_visits < 1 THEN
		RAISE_APPLICATION_ERROR(-20000, 'No more appointments available.');
	ELSE
		UPDATE Doctor 
		  SET visits_available=visits_available-1
		  WHERE doctor_id=:NEW.doctor_id;
	END IF;
END reduce_visits_available;
/

-- Increase 'Doctor.visits_available' by 1 on each 'Appointment' completed
CREATE OR REPLACE TRIGGER increase_visits_available
  BEFORE INSERT OR UPDATE ON Appointment
FOR EACH ROW
BEGIN
	IF :NEW.appointment_complete = 'YES' THEN
		UPDATE Doctor 
		  SET visits_available=visits_available+1
		  WHERE doctor_id=:NEW.doctor_id;
	END IF;
END increase_visits_available;
/

-- Fill 'appointment_complete' if 'appointment_date' is after today's date
CREATE OR REPLACE TRIGGER fill_appointment_complete
  BEFORE INSERT OR UPDATE ON Appointment
FOR EACH ROW
BEGIN
	IF :NEW.appointment_date > SYSDATE THEN
		:NEW.appointment_complete := 'NO';
	END IF;
END fill_appointment_complete;
/