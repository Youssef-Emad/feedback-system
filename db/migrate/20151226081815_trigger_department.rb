class TriggerDepartment < ActiveRecord::Migration
  def change
  	execute"delimiter //
CREATE TRIGGER DEPARTMENT_BEFORE_UPDATE 
BEFORE UPDATE ON DEPARTMENT
     FOR EACH ROW
     BEGIN
         IF OLD.department_id <> 
         (SELECT department_id FROM STAFF 
          WHERE staff_id = NEW.lord_id ) 
         THEN
             signal sqlstate '45000' set message_text = 'lord must be a member of the department';
         END IF;
     END; //
delimiter ;
"
  end
end
