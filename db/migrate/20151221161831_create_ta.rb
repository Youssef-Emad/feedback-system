class CreateTa < ActiveRecord::Migration
  def change
    execute"CREATE TABLE TA (
  TA_ID INT NOT NULL,
  Degree VARCHAR(45) NOT NULL,
  Years_of_exp INT NOT NULL,
  department VARCHAR(45),
  PRIMARY KEY (TA_ID),
  CONSTRAINT staff_id
    FOREIGN KEY (TA_id) REFERENCES PERSON (person_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);"
  end
end
