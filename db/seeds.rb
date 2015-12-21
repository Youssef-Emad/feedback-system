connection = ActiveRecord::Base.connection()

connection.execute"INSERT INTO PERSON
VALUES ('male',1234567891,'ahmed','15-12-1993',11,'ahmed@yahoo.com' ,'abc',NULL,0),
('male',234567891,'ahmed','15-12-1993',12,'ahmed2@yahoo.com' ,'abc',NULL,0),
('male',34567891,'ahmed','15-12-1993',13,'ahmed3@yahoo.com' ,'abc',NULL,0),
('male',4567891,'ahmed','15-12-1993',14,'ahmed4@yahoo.com' ,'abc',NULL,0);
        
INSERT INTO PERSON(person_id,name,ssn,email,password,is_staff)
VALUES (21,'hasan',567,'hsan@yahoo','KQY',1),
(22,'Ali',568,'Ali@yahoo','KQY',1);"

connection.execute"INSERT INTO COURSE VALUES
('math',31,'MATH_DEPT'),
('science',32,'SCIENCE_DEPT'),
('Arabic',33,'LANGUAGE_DEPT');
INSERT INTO CLASS VALUES
(41,'2013','CH','ELEC_DEPT'),
(42,'2013','CH','MECH_DEPT');
INSERT INTO Student VALUES
(11,41),(12,41);
INSERT INTO CCS(staff_id,class_id,course_code)
VALUES (21,41,31),
(22,41,32),
(22,41,33);
INSERT INTO EVALUATE 
VALUES (12,22,31,5,4,5,3,2,'BATTEEE5a');"