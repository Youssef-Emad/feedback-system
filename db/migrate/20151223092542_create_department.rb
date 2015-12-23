class CreateDepartment < ActiveRecord::Migration
  def change
    execute"CREATE TABLE DEPARTMENT (
  department_id INT NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  lord_id INT UNIQUE ,
  PRIMARY KEY (department_id));"
  end
end
