 class StudentsController < ApplicationController
 	before_filter :check_student_authorization
  	skip_before_filter :verify_authenticity_token
 	def home
 		result = ActiveRecord::Base.connection.execute"
 		SELECT course_name ,course_code,COURSE.department_id,DEPARTMENT.department_name
	FROM COURSE , DEPARTMENT
	WHERE course_code IN(
	SELECT course_code
	FROM CCS CCS1
	WHERE CCS1.class_id IN(
	SELECT class_id
	FROM  STUDENT SIC
	WHERE SIC.student_id = #{params["id"]}))AND DEPARTMENT.department_id = COURSE.department_id ;"
 		render "home",locals: {list: result.first}
 	end

 	def feedback
 		if check_student_evaluation(params["course_id"])
 			redirect_to "/home"
 			return
 		end
 		result = ActiveRecord::Base.connection.execute"
 		SELECT name,person_id 
		FROM PERSON
		WHERE person_id IN (
		SELECT staff_id 
		FROM CCS
		WHERE course_code = #{params["course_id"]}
		);"
 		staff_ids, staff_names = result.first.partition{|item| item.kind_of?(Fixnum)}
 		courses_count = result.first.count/2
 		render "feedback" ,locals: {count: courses_count,staff_names: staff_names,staff_ids: staff_ids,course_id: params["course_id"]}
 	end

 	def feedback_insert
 		ActiveRecord::Base.connection.execute"INSERT INTO EVALUATECOURSE VALUE
 		(#{params["id"].to_i},#{params["course_id"].to_i},#{params["choice1"].to_i},#{params["choice2"].to_i},
 		#{params["choice3"].to_i},#{params["choice4"].to_i},#{params["choice5"].to_i},'#{params["comment1"]}');"

 		staff_count = params["count"].to_i
 		staff_list = JSON.parse params["staff_ids"]
 		staff_count.times do |i|
 			ActiveRecord::Base.connection.execute"INSERT INTO EVALUATESTAFF VALUES 
 			(#{params["id"].to_i},#{staff_list.shift},#{params["course_id"].to_i},
 				#{params["choice" + "#{5*(i+1) + 1}"]},
 				#{params["choice" + "#{5*(i+1) + 2}"]},
 				#{params["choice" + "#{5*(i+1) + 3}"]},
 				#{params["choice" + "#{5*(i+1) + 4}"]},
 				#{params["choice" + "#{5*(i+1) + 5}"]},
 				'#{params["comment" + "#{i+1}"].to_i}');"
 		end
 		redirect_to "/home"
 	end
end

def check_student_authorization
	if session[:id] != params[:id].to_i || session[:is_staff] != 0
		redirect_to '/home/'

	end
end

def check_student_evaluation(course_id)
	result = ActiveRecord::Base.connection.execute"select student_id from EVALUATECOURSE where student_id = #{session[:id]}"
	
	if result.first != nil
		return true
	end
end