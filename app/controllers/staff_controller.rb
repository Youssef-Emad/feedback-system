 class StaffController < ApplicationController
 	before_filter :check_staff_authorization
 	def home
 	end
end

def check_staff_authorization

	if session[:id] != params["id"].to_i || session[:is_staff] != 1
		redirect_to "/home"
	end
end