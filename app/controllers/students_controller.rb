 class StudentsController < ApplicationController
 	before_filter :check_student_authorization
  	skip_before_filter :verify_authenticity_token
 	def home
 		sql_result = ActiveRecord::Base.connection.execute"
 		SELECT course_name ,course_code,DEPARTMENT.department_name
		FROM COURSE , DEPARTMENT
		WHERE course_code IN(
		SELECT course_code
		FROM CCS CCS1
		WHERE CCS1.class_id IN(
		SELECT class_id
		FROM  STUDENT SIC
		WHERE SIC.student_id = #{params["id"]}))AND DEPARTMENT.department_id = COURSE.department_id ;"

 		result = []
 		sql_result.each do |row|
 			result << row[0]
 			result << row[1]
 			result << row[2]
 		end

 		bool_list = []
 		count = result.count/3
 		count.times do |i|
 			bool_result = ActiveRecord::Base.connection.execute"
	 		SELECT student_id 
			FROM EVALUATECOURSE 
			WHERE student_id = #{params["id"]} AND course_code = #{result[3*i + 1]} ;"
			if bool_result.first == nil
				bool_list << 0
			else
				bool_list << 1 
			end
 		end
 		render "home",locals: {list: result,bool_list:bool_list}
 	end

 	def feedback
 		if check_student_evaluation(params["course_id"])
 			redirect_to "/home"
 			return
 		end
 		sql_result = ActiveRecord::Base.connection.execute"
 		SELECT name,person_id 
		FROM PERSON
		WHERE person_id IN (
		SELECT staff_id 
		FROM CCS
		WHERE course_code = #{params["course_id"]}
		);"
 		result = []
 		
 		sql_result.each do |row|
 			result << row[0]
 			result << row [1]
 		end
 		course_name = ActiveRecord::Base.connection.execute"SELECT course_name FROM COURSE where course_code = #{params["course_id"]}"

 		staff_ids, staff_names = result.partition{|item| item.kind_of?(Fixnum)}
 		staff_ids_string = "#{staff_ids.join(',')}"
 		courses_count = result.count/2

 		render "feedback" ,locals: {count: courses_count,staff_names: staff_names,staff_ids: staff_ids_string,course_id: params["course_id"],course_name:course_name.first[0]}
 	end

 	def feedback_insert
 		ActiveRecord::Base.connection.execute"INSERT INTO EVALUATECOURSE VALUE
 		(#{params["id"].to_i},#{params["course_id"].to_i},#{params["choice1"].to_i},#{params["choice2"].to_i},
 		#{params["choice3"].to_i},#{params["choice4"].to_i},#{params["choice5"].to_i},'#{params["comment1"]}');"

 		staff_count = params["count"].to_i
 		
 		staff_list = params["staff_ids"].split(",")
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
	result = ActiveRecord::Base.connection.execute"select student_id from EVALUATECOURSE where student_id = #{session[:id]} and course_code = #{course_id}"
	
	if result.first != nil
		return true
	end
end