connection = ActiveRecord::Base.connection()

connection.execute"INSERT INTO PERSON
VALUES ('male',1234567891,'ahmed','15-12-1993',11,'ahmed@yahoo.com' ,'abc',NULL),
('male',234567891,'ahmed','15-12-1993',12,'ahmed2@yahoo.com' ,'abc',NULL),
('male',34567891,'ahmed','15-12-1993',13,'ahmed3@yahoo.com' ,'abc',NULL),
('male',4567891,'ahmed','15-12-1993',14,'ahmed4@yahoo.com' ,'abc',NULL);"

connection.execute"INSERT INTO PERSON(person_id,name,ssn,email,password)
VALUES (21,'hasan',567,'hsan@yahoo','KQY'),
(22,'Ali',568,'Ali@yahoo','KQY')
,(23,'Braheem',569,'Braheem@yahoo','QKY')
,(24,'Leloush',570,'Leloush@yahoo','QKY');"

connection.execute"INSERT INTO DEPARTMENT(department_id,department_name) VALUES
(51,'MATH_DEPT'),(52,'ECE_DEPT'),(53,'CSE_DEPT');"

connection.execute"INSERT INTO STAFF VALUES (21,51),(22,52),(23,52),(24,53);"

connection.execute"INSERT INTO PROFESSOR(prof_id) VALUES
(21),(22),(23);"

connection.execute"INSERT INTO TA(TA_id) VALUES (24);"

connection.execute"UPDATE  DEPARTMENT
SET lord_id = 21 
WHERE department_id = 51 ;"

connection.execute"UPDATE  DEPARTMENT
SET lord_id = 22 
WHERE department_id = 52 ;"

connection.execute"UPDATE  DEPARTMENT
SET lord_id = 23 
WHERE department_id = 53 ;"

connection.execute"INSERT INTO CLASS VALUES
(41,'2013','CH',51),
(42,'2013','CH',52);"

connection.execute"INSERT INTO COURSE VALUES
('math',31,51),
('science',32,52);"

connection.execute"INSERT INTO STUDENT VALUES
(11,41),(12,41);"

connection.execute"INSERT INTO CCS(staff_id,class_id,course_code)
VALUES (21,41,31),
(22,41,31)
,(24,41,31);"

connection.execute"INSERT INTO EVALUATE 
VALUES (12,22,31,5,4,5,3,2,'BATTEEE5a');"