class CreateProfessor < ActiveRecord::Migration
  def change
    execute"CREATE TABLE PROFESSOR (
  prof_id INT NOT NULL,
  position VARCHAR(45) NOT NULL,
  department VARCHAR(45),
  PRIMARY KEY (prof_id),
  CONSTRAINT prof_id
    FOREIGN KEY (prof_id)  REFERENCES PERSON (person_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);"
  end
end