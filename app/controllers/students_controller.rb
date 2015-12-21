 class StudentsController < ApplicationController
 	before_filter :check_student_authorization
 	def home
 	end
end

def check_student_authorization
	if session[:id] != params[:id].to_i || session[:is_staff] != 0
		redirect_to '/home/'
	end
end