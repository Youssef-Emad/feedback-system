 class StaffController < ApplicationController
 	before_filter :check_staff_authorization
 	def home
 		result = ActiveRecord::Base.connection.execute"
 		SELECT course_name ,course_code,C.department_id,D.department_name
		FROM COURSE C , DEPARTMENT D
		WHERE course_code IN(
		SELECT course_code
		FROM CCS CCS1
		WHERE CCS1.staff_id =#{params["id"]})AND C.department_id =D.department_id;"
 		render "home",locals: {list: result.first}
 	end

 	def statistics
 		course_feedback = [3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,6,7,4,3,2]
 		doc_feedback = [10,12,5,5,12,5,7,5,8,5,5,8,5,3,2,5,7,5,10,5,3,5,11,5,5,22,34,11,22,33]
 		ta_feedback = [4,4,4,4,4,22,24,4,42,4,42,4,4,4,4,14,4,4,4,4,4,4,4,4,4,4,4,4,4,4,10,200,40,1,4,4,4,4,4,22,24,4,42,4,42,4,4,4,4,14,4,4,4,4,4,4,4,4,4,4,4,4,4,4,10,200,40,1]
 		ta_names = ["V","M"]
 		count = 2
 		course_string = "#{course_feedback.join(',')}"
 		doc_string = "#{doc_feedback.join(',')}"
 		ta_string = "#{ta_feedback.join(',')}"
 		render "statistics", locals:{count:count , course_feedback:course_string,doc_feedback: course_string,ta_feedback: ta_string,ta_names: ta_names}
 	end
end

def check_staff_authorization

	if session[:id] != params["id"].to_i || session[:is_staff] != 1
		redirect_to "/home"
	end
end