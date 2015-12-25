class CreateTa < ActiveRecord::Migration
  def change
    execute"CREATE TABLE TA (
  TA_id INT NOT NULL CHECK 
  (TA_id >=2000000 AND TA_id <3000000 ),
  Degree VARCHAR(45) ,
  Years_of_exp INT ,
  PRIMARY KEY (TA_id),
  CONSTRAINT staff_id
    FOREIGN KEY (TA_id) REFERENCES STAFF (staff_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);"
  end
end
