class CreateEvaluate < ActiveRecord::Migration
  def change
    execute"CREATE TABLE EVALUATESTAFF (
  student_id INT NOT NULL ,
  staff_id INT NOT NULL ,
  course_code INT NOT NULL,
  a1 INT NOT NULL,
  a2 INT NOT NULL,
  a3 INT NOT NULL,
  a4 INT NOT NULL,
  a5 INT NOT NULL,
  other_comments VARCHAR(1000) ,
  
  PRIMARY KEY (student_id,staff_id,course_code),
  
  CONSTRAINT EVALUATE_1
  FOREIGN KEY (student_id) REFERENCES PERSON(person_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  
  CONSTRAINT EVALUATE_2
  FOREIGN KEY (staff_id) REFERENCES PERSON(person_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  
  CONSTRAINT EVALUATE_3
  FOREIGN KEY (course_code) REFERENCES COURSE(course_code)
  ON DELETE CASCADE
  ON UPDATE CASCADE

  );
"
  end
end
