class CreateCcs < ActiveRecord::Migration
  def change
    execute"CREATE TABLE CCS (
  staff_id INT NOT NULL,
  class_id INT NOT NULL,
  course_code INT NOT NULL,
  PRIMARY KEY (staff_id, class_id, course_code),
  CONSTRAINT staff_id_2
  FOREIGN KEY (staff_id) REFERENCES PERSON(person_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT class_id
    FOREIGN KEY (class_id)  REFERENCES CLASS (class_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT course_code
    FOREIGN KEY (course_code)  REFERENCES COURSE (course_code)
    ON DELETE CASCADE
    ON UPDATE CASCADE);"
  end
end
