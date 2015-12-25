class CreateStaff < ActiveRecord::Migration
  def change
    execute"CREATE TABLE STAFF (
      staff_id INT NOT NULL CHECK 
      (staff_id >=2000000 AND staff_id <4000000 ),
      department_id INT NOT NULL ,
      PRIMARY KEY (staff_id),
      CONSTRAINT staff_person_id
      FOREIGN KEY (staff_id) REFERENCES PERSON(person_id) 
      ON DELETE CASCADE
      ON UPDATE CASCADE ,
      CONSTRAINT staff_dept_id
      FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);"
  end
end
