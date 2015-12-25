class CreateProfessor < ActiveRecord::Migration
  def change
    execute"CREATE TABLE PROFESSOR (
  prof_id INT NOT NULL  CHECK 
  (prof_id >=3000000 AND prof_id <4000000 ),
  position VARCHAR(45) ,
  PRIMARY KEY (prof_id),
  CONSTRAINT prof_id
    FOREIGN KEY (prof_id)  REFERENCES STAFF (staff_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);"
  end
end
