 class PersonsController < ApplicationController
 	skip_before_filter :verify_authenticity_token
 	before_filter :check_logged_in , only: [:home]
	def home
	end

	def login
		email = params["email"]
		password =  params["password"]
		check_existance(email,password)
	end

	def logout
		session[:id] = nil
		session[:is_staff] = nil
		session[:type] = nil
		redirect_to "/home"
	end
end

def check_existance(email,password)
	person_data = ActiveRecord::Base.connection.execute"SELECT person_id ,password FROM PERSON WHERE email='#{email}'"

	if person_data.first[1] == password
		session[:id] = person_data.first[0]
		adminstrator_check = ActiveRecord::Base.connection.execute"SELECT lord_id FROM DEPARTMENT  WHERE lord_id = #{person_data.first[0]};"
		if adminstrator_check.first != nil
			session[:type] = "lord"
			session[:is_staff] = 1
			redirect_to "/staff/#{person_data.first[0]}"
		else
			professor_check = ActiveRecord::Base.connection.execute"SELECT prof_id FROM PROFESSOR  WHERE prof_id = #{person_data.first[0]};"
			if professor_check.first != nil
				session[:type] = "professor"
				session[:is_staff] = 1
				redirect_to "/staff/#{person_data.first[0]}"
			else
				
				ta_check = ActiveRecord::Base.connection.execute"SELECT TA_id FROM  TA WHERE TA_id = #{person_data.first[0]}"
				if ta_check.first != nil
					session[:type] = "ta"
					session[:is_staff] = 1
					redirect_to "/staff/#{person_data.first[0]}"
				else
					student_check = ActiveRecord::Base.connection.execute"SELECT student_id FROM STUDENT  WHERE student_id = #{person_data.first[0]}"
					if student_check.first != nil
						session[:type] = "student"
						session[:is_staff] = 0
						redirect_to "/students/#{person_data.first[0]}"
					end
				end
			end
		end
	else
		render 'home'
	end
end

def check_logged_in
	if session[:id] != nil
		if session[:is_staff] == 1
			redirect_to "/staff/#{session[:id]}"
		else session[:is_staff] == 0
			redirect_to "/students/#{session[:id]}"
		end
	end
end
