class CreateCourse < ActiveRecord::Migration
  def change
    execute"CREATE TABLE COURSE (
  course_name VARCHAR(45) NOT NULL ,
  course_code INT NOT NULL,
  department_id int NOT NULL ,
  PRIMARY KEY (course_code),
  UNIQUE(course_name),
  CONSTRAINT course_dept_id
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);"
  end
end
