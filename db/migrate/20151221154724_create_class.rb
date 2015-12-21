class CreateClass < ActiveRecord::Migration
  def change
    execute"CREATE TABLE CLASS (
  class_id INT NOT NULL,
  year VARCHAR(5) NOT NULL,
  type VARCHAR(15) NOT NULL,
  department VARCHAR(45) NOT NULL,
  PRIMARY KEY (class_id));"
  end
end
