class CreateEvaluateCourse < ActiveRecord::Migration
  def change
    execute"CREATE TABLE EVALUATECOURSE
  (
  student_id INT NOT NULL,
  course_code INT NOT NULL,
  a1 INT NOT NULL,
  a2 INT NOT NULL,
  a3 INT NOT NULL,
  a4 INT NOT NULL,
  a5 INT NOT NULL,
  other_comments VARCHAR(1000),
  PRIMARY KEY (student_id),
  
  CONSTRAINT EV_SUBJ_student_id 
  FOREIGN KEY(student_id) REFERENCES STUDENT(student_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
    
  CONSTRAINT EV_SUBJ_subject_id
  FOREIGN KEY (course_code) REFERENCES COURSE(course_code)
  ON DELETE CASCADE
  ON UPDATE CASCADE  
  );
"
  end
end
