connection = ActiveRecord::Base.connection()

#Students
connection.execute"INSERT INTO PERSON (sex,ssn,name,birthdate,person_id,email,password)
VALUES 
('Male',41000001,'Ahmed Fathi','3-12-1993',1000001,'1000001@yahoo.com' ,'abcd'),
('Male',41000002,'Youssef Emad','4-12-1993',1000002,'1000002@eng.asu.edu.eg' ,'abcd'),
('Male',41000003,'Youssef Magdy','5-12-1993',1000003,'1000003@eng.asu.edu.eg' ,'abcd'),
('Male',41000004,'Haitham Mohamed','6-12-1993',1000004,'1000004@eng.asu.edu.eg' ,'abcd'),
('Male',41000005,'Hisham','7-12-1993',1000005,'1000005@eng.asu.edu.eg' ,'abcd'),
('Male',41000006,'Fakhreldeen','8-12-1993',1000006,'1000006@eng.asu.edu.eg' ,'abcd'),
('Male',41000007,'Hossam Ali','9-12-1993',1000007,'1000007@eng.asu.edu.eg' ,'abcd'),
('Male',41000008,'Ali Hossam','10-12-1993',1000008,'1000008@eng.asu.edu.eg','abcd'),
('Female',41000009,'Mona Tawfeeq','11-12-1993',1000009,'1000009@eng.asu.edu.eg' ,'abcd'),
('Female',41000010,'Gehaan Elsadaat','12-12-1993',1000010,'1000010@eng.asu.edu.eg' ,'abcd'),
('Female',41000011,'Zomorroda Hesham','13-12-1993',1000011,'1000011@eng.asu.edu.eg' ,'abcd'),
('Female',41000012,'Yara Ahmad','14-12-1993',1000012,'1000012@eng.asu.edu.eg' ,'abcd'),
('Female',41000013,'Lobna Medhat','15-12-1993',1000013,'1000013@eng.asu.edu.eg' ,'abcd'),
('Female',41000014,'Hossam Fawzy','16-12-1993',1000014,'1000014@eng.asu.edu.eg' ,'abcd'),
('Female',41000015,'Heussein ebrahem','17-12-1993',1000015,'1000015@eng.asu.edu.eg' ,'abcd');"

#TAs
connection.execute"INSERT INTO PERSON (sex,ssn,name,birthdate,person_id,email,password)
VALUES
('Male',42000001,'Aya Ehab','3-11-1985',2000001,'2000001@eng.asu.edu.eg' ,'abcd'),
('Male',42000002,'Mona Lasheen','4-11-1985',2000002,'2000002@eng.asu.edu.eg' ,'abcd'),
('Male',42000003,'Mohamed Hossam','5-11-1985',2000003,'2000003@eng.asu.edu.eg' ,'abcd'),
('Male',42000004,'Omar Amin','6-11-1985',2000004,'2000004@eng.asu.edu.eg' ,'abcd'),
('Male',42000005,'Hossam AboElFotouh','7-11-1985',2000005,'2000005@eng.asu.edu.eg' ,'abcd'),
('Female',42000006,'Tarek Ebn Ziad','8-11-1985',2000006,'2000006@eng.asu.edu.eg' ,'abcd'),
('Female',42000007,'Hesham Ebraheem','9-11-1985',2000007,'2000007@eng.asu.edu.eg' ,'abcd'),
('Female',42000008,'Farida Mohamed','10-11-1985',2000008,'2000008@eng.asu.edu.eg' ,'abcd'),
('Female',42000009,'Aly Ahmed','11-11-1985',2000009,'2000009@eng.asu.edu.eg' ,'abcd'),
('Female',42000010,'Marwa Hussein','12-11-1985',2000010,'2000010@eng.asu.edu.eg' ,'abcd');
"

#Professor
connection.execute"INSERT INTO PERSON (sex,ssn,name,birthdate,person_id,email,password)
VALUES
('Male',43000001,'Hussein Ismail','3-10-1985',3000001,'3000001@eng.asu.edu.eg' ,'abcd'),
('Male',43000002,'Yasser Ebraheem','4-10-1985',3000002,'3000002@eng.asu.edu.eg' ,'abcd'),
('Male',43000003,'Nashwa Fawzy','5-10-1985',3000003,'3000003@eng.asu.edu.eg' ,'abcd'),
('Female',43000004,'Hayam AbdElSattar','6-10-1985',3000004,'3000004@eng.asu.edu.eg' ,'abcd'),
('Female',43000005,'Marwa Ragheb','7-10-1985',3000005,'3000005@eng.asu.edu.eg' ,'abcd'),
('Female',43000006,'Asmaa Hussein','8-10-1985',3000006,'3000006@eng.asu.edu.eg' ,'abcd');"

#Departments
connection.execute"INSERT INTO DEPARTMENT(department_id,department_name) VALUES
(51,'CSE'),(52,'ECE'),(53,'EPM');"

connection.execute"INSERT INTO STAFF(staff_id,department_id)
VALUES (3000001,51),(3000002,51),(3000003,52),(3000004,52),
(3000005,53),(3000006,53);"


connection.execute"INSERT INTO STAFF(staff_id,department_id)
VALUES (2000001,51),(2000002,51),(2000003,51),(2000004,51), 
(2000005,52),(2000006,52),(2000007,52),
(2000008,53),(2000009,53),(2000010,53);"

connection.execute"INSERT INTO PROFESSOR(prof_id,position) VALUES
(3000001,'Associate Professor'),(3000002,'Associate Professor'),
(3000003 , 'Assistant Professor'),(3000004 ,'Assistant Professor'),
(3000005,'Full Professor'),(3000006,'Full Professor');"

connection.execute"INSERT INTO TA(TA_id,Degree,Years_of_exp) 
VALUES 
(2000001,'Bachelor Of Engineering',1),(2000002,'Bachelor of Computer Science',0),
(2000003,'Bachelor Of Engineering',2),(2000004,'Bachelor Of Engineering',2),
(2000005,'Bachelor Of Engineering',3),(2000006,'Bachelor Of Engineering',4),
(2000007,'Bachelor Of Engineering',4),(2000008,'Bachelor Of Engineering',1),
(2000009,'Bachelor Of Engineering',1),(2000010,'Bachelor Of Engineering',3);"

connection.execute"UPDATE  DEPARTMENT
SET lord_id = 3000001 
WHERE department_id = 51 ;"

connection.execute"UPDATE  DEPARTMENT
SET lord_id = 3000003 
WHERE department_id = 52 ;"

connection.execute"UPDATE  DEPARTMENT
SET lord_id = 3000004 
WHERE department_id = 54 ;"

connection.execute"INSERT INTO COURSE (course_name,course_code,department_id)
VALUES
('DATA STRUCTURES',81,51),
('DATABASE SYSTEMS',82,51),
('COMPUTER ORGANIZATION',83,51),
('SECURITY',84,51),
('SIGNALS',85,52),
('MICROWAVES',86,52),
('DIGITAL DESING',87,52),
('ANALOG DESIGN',88,52),
('THREE PHASE',89,53),
('HIGH VOLTAGE',90,53),
('MEASUREMENT',91,53),
('MACHINES',92,53)
;"

connection.execute"INSERT INTO CLASS (class_id,semister,type,department_id) VALUES
(41,'FIRST','Credit Hours',51),
(42,'FIRST','Credit Hours',52),
(43,'FIRST','Main Stream',53);"

connection.execute"INSERT INTO STUDENT (student_id,class_id) VALUES
(1000001,41),(1000002,41),
(1000003,41),(1000004,41),
(1000005,41),(1000006,42),
(1000007,42),(1000008,42),
(1000009,42),(1000010,42),
(1000011,43),(1000012,43),
(1000013,43),(1000014,43),
(1000015,43);"

connection.execute"INSERT INTO CCS(staff_id,class_id,course_code)
VALUES
(3000001,41,81),
(3000001,41,83),(3000002,41,84),
(3000001,42,83),
(3000002,42,84),
(3000002,43,81),
(3000003,42,85),(3000004,42,86),
(3000003,42,86),(3000004,42,87),
(3000003,42,87),(3000004,42,88),
(3000003,41,85),(3000004,41,86),
(3000003,43,86),(3000004,43,87),
(3000005,43,89),(3000006,43,92),
(3000005,43,90),(3000006,43,90),
(3000005,42,89),(3000006,42,92),
(3000005,41,90),(3000006,42,90),
(3000005,41,91);"

connection.execute"INSERT INTO CCS(staff_id,class_id,course_code)
VALUES
-- CSE
(2000001,41,81),
(2000003,41,83),(2000002,41,84),
(2000004,41,81),
(2000003,42,83),(2000002,42,84),
(2000002,43,81),
-- ECE
(2000005,42,85),(2000006,42,86),
(2000004,42,87),(2000007,42,87),
(2000004,41,86),(2000006,43,86),
(2000007,43,87),
-- EPM
(2000008,43,89),(2000008,43,92),
(2000010,43,90),(2000009,42,89),
(2000009,42,92),(2000009,41,90),
(2000009,42,90),(2000010,41,91);"

#Dr.Mona and Eng.Veronia

connection.execute"INSERT INTO PERSON (sex,ssn,name,birthdate,person_id,email,password)
     VALUES ('Female',42000011,'Veronia Bahaa',13-11-1985,2000011,'2000011@eng.asu.edu.eg','abcd') ;"

connection.execute"INSERT INTO PERSON (sex,ssn,name,birthdate,person_id,email,password)
     VALUES ('Female',43000007,'Mona Ismail',9-11-1965,3000007,'3000007@eng.asu.edu.eg','abcd') ;"

connection.execute"INSERT INTO STAFF(staff_id,department_id)
VALUES (2000011,51),(3000007,51);"

connection.execute"INSERT INTO PROFESSOR (prof_id,position) 
VALUES (3000007,'Professor') ;"

connection.execute"INSERT INTO TA VALUES (2000011,'Bachelor Of Engineering',4);"

connection.execute"INSERT INTO CCS(staff_id,class_id,course_code)
VALUES (3000007,41,82 ),( 2000011,41,82);"

connection.execute"INSERT INTO EVALUATECOURSE(student_id,course_code,a1,a2,a3,a4,a5,other_comments)
VALUES (1000001,82,5,5,5,5,5,'BRILLIANT'),(1000002,82,5,5,5,5,5,'BRILLIANT')
,(1000003,82,5,5,5,5,5,'BRILLIANT'),(1000004,82,5,5,5,5,5,'BRILLIANT'),
(1000005,82,5,5,5,5,5,'BRILLIANT') ;"

connection.execute"INSERT INTO EVALUATESTAFF (student_id,staff_id,course_code,a1,a2,a3,a4,a5,other_comments)
 VALUES
 (1000001,3000007,82,5,5,5,5,5,'BRILLIANT') 
,(1000002,3000007,82,5,5,5,5,5,'BRILLIANT') 
,(1000003,3000007,82,5,5,5,5,5,'BRILLIANT') 
 ,(1000004,3000007,82,5,5,5,5,5,'BRILLIANT') 
 ,(1000005,3000007,82,5,5,5,5,5,'BRILLIANT') 
,(1000001,2000011,82,5,5,5,5,5,'BRILLIANT')
 ,(1000002,2000011,82,5,5,5,5,5,'BRILLIANT')
 ,(1000003,2000011,82,5,5,5,5,5,'BRILLIANT')
 ,(1000004,2000011,82,5,5,5,5,5,'BRILLIANT')
 ,(1000005,2000011,82,5,5,5,5,5,'BRILLIANT');"