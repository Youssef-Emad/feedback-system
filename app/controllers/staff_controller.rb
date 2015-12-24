 class StaffController < ApplicationController
 	#before_filter :check_staff_authorization
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
 	end
end

def check_staff_authorization

	if session[:id] != params["id"].to_i || session[:is_staff] != 1
		redirect_to "/home"
	end
end