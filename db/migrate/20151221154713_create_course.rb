class CreateCourse < ActiveRecord::Migration
  def change
    execute"CREATE TABLE COURSE (
  course_name VARCHAR(20) NOT NULL ,
  course_code INT NOT NULL,
  department VARCHAR(45) NOT NULL,
  PRIMARY KEY (course_code),
  UNIQUE(course_name));"
  end
end
