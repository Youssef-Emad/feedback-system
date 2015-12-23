class AlterDepartment < ActiveRecord::Migration
  def change
  	execute"ALTER TABLE DEPARTMENT
ADD CONSTRAINT department_lord_id
  FOREIGN KEY(lord_id) REFERENCES PROFESSOR(prof_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;"
  end
end
