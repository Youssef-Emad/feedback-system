class CreatePerson < ActiveRecord::Migration
  def change
    execute"CREATE TABLE PERSON (
  sex VARCHAR(7) ,
  ssn INT NOT NULL UNIQUE,
  name VARCHAR(45) NOT NULL,
  birthdate VARCHAR(15) ,
  person_id INT NOT NULL,
  email VARCHAR(45) NOT NULL UNIQUE ,
  password VARCHAR(45) NOT NULL,
  token INT,
  PRIMARY KEY (person_id) );"
  end
end
