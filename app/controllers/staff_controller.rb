 class StaffController < ApplicationController
 	before_filter :check_staff_authorization
 	def home
 		result = ActiveRecord::Base.connection.execute"
 		SELECT course_name ,course_code,D.department_name
		FROM COURSE C , DEPARTMENT D
		WHERE course_code IN(
		SELECT course_code
		FROM CCS CCS1
		WHERE CCS1.staff_id =#{params["id"]})AND C.department_id =D.department_id;"
 		render "home",locals: {list: result.first}
 	end

 	def statistics
 		course_feedback = []
 		doc_feedback = []
 		ta_feedback = []

 		1.upto(5) do |i|
			6.times do |j|
				course_result = ActiveRecord::Base.connection.execute"
				SELECT count(*)
				FROM EVALUATECOURSE
				WHERE course_code = #{params[:course_id]} AND A#{i} = #{j} ;"
				course_feedback << course_result.first
			end
 		end

 		1.upto(5) do |i|
			6.times do |j|
				doc_result = ActiveRecord::Base.connection.execute"
				SELECT count(*)
				FROM EVALUATESTAFF 
				WHERE staff_id = #{session[:id]} AND course_code = #{params[:course_id]} AND A#{i} = #{j} ;"
				doc_feedback << doc_result.first
			end
 		end

 		ta_names_result = ActiveRecord::Base.connection.execute"SELECT DISTINCT  staff_id ,name 
						FROM EVALUATESTAFF , PERSON P
						WHERE course_code = #{params[:course_id]} AND staff_id IN
						(SELECT TA_id 
						FROM TA ) AND EVALUATESTAFF.student_id IN
						(SELECT student_id 
						FROM STUDENT 
						WHERE class_id IN 
						(SELECT class_id FROM CCS 
						WHERE CCS.staff_id = staff_id and CCS.class_id IN
						(SELECT class_id 
						FROM CCS CCS_TWO 
						WHERE course_code = #{params[:course_id]} and staff_id = #{session[:id]}) 
						)
						) AND P.person_id = staff_id;"

 		if ta_names_result.first != nil
	 		ta_ids, ta_names = ta_names_result.first.partition{|item| item.kind_of?(Fixnum)}
	 		count = ta.ids.count
	 		1.upto(5) do |i|
			6.times do |j|
				ta_result = ActiveRecord::Base.connection.execute"
				SELECT count(*)
				FROM EVALUATESTAFF 
				WHERE staff_id = #{session[:id]} AND course_code = #{params[:course_id]} AND A#{i} = #{j} ;"
				ta_feedback << ta_result.first
			end
 		end
	 	else
	 		count = 0
	 	end

		puts ta_names_result.first
 		course_string = "#{course_feedback.join(',')}"
 		doc_string = "#{doc_feedback.join(',')}"
 		ta_string = "#{ta_feedback.join(',')}"
 		render "statistics", locals:{count:count , course_feedback:course_string,doc_feedback: doc_string,ta_feedback: ta_string,ta_names: ta_names,type: session[:type]}
 	end
end

def check_staff_authorization

	if session[:id] != params["id"].to_i || session[:is_staff] != 1
		redirect_to "/home"
	end
end