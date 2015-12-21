 class PersonsController < ApplicationController
 	skip_before_filter :verify_authenticity_token
 	before_filter :check_logged_in
	def home
	end

	def login
		email = params["email"]
		password =  params["password"]
		check_existance(email,password)
	end
end

def check_existance(email,password)
	result = ActiveRecord::Base.connection.execute"SELECT person_id,is_staff,password FROM PERSON WHERE email='#{email}'"
	if result.first[2] == password
		session[:id] = result.first[0]
		session[:is_staff] = result.first[1]
		if result.first[1] == 1
			redirect_to "/staff/home/#{result.first[0]}"
		else result.first[1] == 1
			redirect_to "/students/home/#{result.first[0]}"
		end
	else
		render 'home'
	end
end

def check_logged_in
	if session[:id] != nil
		if session[:is_staff] == 1
			redirect_to "/staff/home/#{session[:id]}"
		else session[:is_staff] == 0
			redirect_to "/students/home/#{session[:id]}"
		end
	end
end