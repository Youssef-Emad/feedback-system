class CreateClass < ActiveRecord::Migration
  def change
    execute"CREATE TABLE CLASS (
  class_id INT NOT NULL,
  semister VARCHAR(5) NOT NULL,
  type VARCHAR(15) NOT NULL,
  department_id INT NOT NULL ,
  PRIMARY KEY (class_id),
  CONSTRAINT class_dept_id
  FOREIGN KEY (department_id) REFERENCES DEPARTMENT (department_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE);"
  end
end
