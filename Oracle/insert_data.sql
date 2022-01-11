DELETE FROM Appointment;
DELETE FROM Clinic;
DELETE FROM Doctor;
DELETE FROM Test;
DELETE FROM Users;

-- Inserting data into 'Users' table
INSERT INTO Users VALUES(1, 'Farhan Sadaf', '13-APR-1999', 'MALE', '01234572739');
INSERT INTO Users VALUES(2, 'Ahnaf Umar', '21-SEP-1991', 'MALE', '01727291741');
INSERT INTO Users VALUES(3, 'Anamika Tazrin', '03-JAN-1997', 'FEMALE', '01682943729');
INSERT INTO Users VALUES(4, 'Jarin Tabassum', '31-JUL-1987', 'FEMALE', '01453943462');

-- Inserting data into 'Test' table
INSERT INTO Test VALUES(1, 1, 64, 5.8, NULL, NULL, '05-JAN-2022');
INSERT INTO Test VALUES(2, 1, 66, 5.8, NULL, NULL, '01-JAN-2022');
INSERT INTO Test VALUES(3, 1, 91, 5.8, NULL, NULL, '18-SEP-2020');
INSERT INTO Test VALUES(4, 1, 94, 5.8, NULL, NULL, '21-AUG-2020');
INSERT INTO Test VALUES(5, 2, 83, 5.7, NULL, NULL, '11-APR-2021');
INSERT INTO Test VALUES(6, 2, 81, 5.7, NULL, NULL, '21-JUN-2021');
INSERT INTO Test VALUES(7, 3, 54, 5.5, NULL, NULL, '19-DEC-2021');

-- Inserting data into 'Doctor' table
INSERT INTO Doctor VALUES(1, 'Dr. AKM Fazlul Hoque', 'MALE', 'Professor', 'Colorectal Surgeon', 'Eden Muli-Care Hospital, 753 Satmasjid Road, Dhaka-1205', 'akmfazlulh@gmail.com', '01755697173', 10);
INSERT INTO Doctor VALUES(2, 'Dr. Mahbub H Khan', 'MALE', 'Professor', 'Liver and Gastroenterology Specialist', 'Gastro Liver Hospital, Dhaka', 'mahbubhkhan@yahoo.com', '01911356298', 1);
INSERT INTO Doctor VALUES(3, 'Dr. Ferdous Ara J. Janan', 'FEMALE', 'Professor', 'Medicine Specialist', 'Popular Diagnostic Centre Ltd., Shyamoli Branch, Dhaka', 'arajanan911@gmail.com', '+88029111911', 7);
INSERT INTO Doctor VALUES(4, 'Dr. A K M Musa', 'MALE', 'Professor', 'Diabetologist and Medicine Specialist', 'Labaid Specialized Hospital, Dhanmondi, Dhaka-1205', 'drprofmusa@hotmail.com', '+88029676356', 19);
INSERT INTO Doctor VALUES(5, 'Dr. Mirza Mohammad Hiron', 'MALE', 'Professor', 'Medicine and Chest Specialist', 'Ibn Sina Diagnostic and Imaging Center, Dhanmondi, Dhaka-1209', 'drprofmusa@hotmail.com', '+88029126625', 18);
INSERT INTO Doctor VALUES(6, 'Dr. Umme Saima (Sunny)', 'FEMALE', 'BDS(DU), PGT(OMFS)', 'Dental Surgery', 'Tasnim Dental Care, Seikh Para, Khulna', 'ummesunny@outlook.com', '01828473922', 6);
INSERT INTO Doctor VALUES(7, 'Dr. Tahmina Ahamed', 'FEMALE', 'BDS(DU), PGT(SSMCH)', 'Dental Surgery, Maxilliofacial Surgeon', 'Evolution Dental Chamber, 30 Hazi Mohsin Road, Khulna', 'tahminaahme@gmail.com', '01729384928', 3);
INSERT INTO Doctor VALUES(8, 'Dr. Abdullah Al-Mahbub', 'MALE', 'Professor', 'MBBS, FCPS(Child)', 'Khulna City Medical College, Khulna', 'almahbub@gmail.com', '01827382748', 2);
INSERT INTO Doctor VALUES(9, 'Dr. M. A. Samad', 'MALE', 'MBBS, DDV (DU)', 'Dermatology, Allergology, Skin, Sex', 'Islami Bank Hospital, Khulna', 'samadma67@gmail.com', '01711298607', 21);

-- Inserting data into 'Clinic' table
INSERT INTO Clinic VALUES(1, 'Eden Muli-Care Hospital', '753 Satmasjid Road, Dhaka-1205', 'emch@contactus.com', '01755697173');
INSERT INTO Clinic VALUES(2, 'Popular Diagnostic Centre Ltd.', 'Shyamoli, Dhaka', 'populardiag@yahoo.com', '01347328492');
INSERT INTO Clinic VALUES(3, 'Labaid Specialized Hospital', 'Dhanmondi, Dhaka-1205', 'labaidbd@gmail.com', '01128382921');
INSERT INTO Clinic VALUES(4, 'Gastro Liver Hospital', '69/D Green Road, Dhaka', 'gaslive@help.com', '01911356298');
INSERT INTO Clinic VALUES(5, 'Islami Bank Hospital', 'Khulna', 'islamihospitalkhulna@gmail.com', '01273829273');
INSERT INTO Clinic VALUES(6, 'Khulna City Medical College', 'Khulna', 'kcmc@gmail.com', '01738293729');
INSERT INTO Clinic VALUES(7, 'Tasnim Dental Care', 'Saikh Para, Khulna', 'tasnimdc@gmail.com', '01238492021');

-- Inserting data into 'Appointment' table
INSERT INTO Appointment VALUES(1, 1, 9, 5, '29-NOV-2021', 'YES');
INSERT INTO Appointment VALUES(2, 1, 9, 5, '22-FEB-2022', 'NO');
INSERT INTO Appointment VALUES(3, 4, 8, 6, '31-JAN-2022', 'NO');
INSERT INTO Appointment VALUES(4, 4, 3, 2, '31-JAN-2021', 'YES');
INSERT INTO Appointment VALUES(5, 3, 9, 5, '20-FEB-2022', 'NO');

COMMIT;