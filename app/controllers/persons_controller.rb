 class PersonsController < ApplicationController
 	skip_before_filter :verify_authenticity_token
	def home
	end

	def login
		email = params["email"]
		password =  params["password"]
		render 'home'
	end
end