class CreateTa < ActiveRecord::Migration
  def change
    execute"CREATE TABLE TA (
  TA_id INT NOT NULL,
  Degree VARCHAR(45) ,
  Years_of_exp INT ,
  PRIMARY KEY (TA_id),
  CONSTRAINT staff_id
    FOREIGN KEY (TA_id) REFERENCES STAFF (staff_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);"
  end
end
