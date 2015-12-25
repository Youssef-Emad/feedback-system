class CreateStudent < ActiveRecord::Migration
  def change
    execute"CREATE TABLE STUDENT (
  student_id INT NOT NULL  CHECK 
  (student_id >=1000000 AND student_id <2000000 ),
  class_id INT NOT NULL,
  PRIMARY KEY (student_id),
  
  CONSTRAINT class_id_4
  FOREIGN KEY (class_id)  REFERENCES CLASS (class_id)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
  CONSTRAINT student_id_4
  FOREIGN KEY (student_id) REFERENCES PERSON (person_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE);"
  end
end
