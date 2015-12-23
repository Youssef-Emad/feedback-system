 class StudentsController < ApplicationController
 	before_filter :check_student_authorization
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
end

def check_student_authorization
	if session[:id] != params[:id].to_i || session[:is_staff] != 0
		redirect_to '/home/'
	end
end