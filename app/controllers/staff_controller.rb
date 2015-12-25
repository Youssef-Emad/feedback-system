 class StaffController < ApplicationController
 	before_filter :check_staff_authorization
 	def home
 		sql_result = ActiveRecord::Base.connection.execute"
 		SELECT course_name ,course_code,D.department_name
		FROM COURSE C , DEPARTMENT D
		WHERE course_code IN(
		SELECT course_code
		FROM CCS CCS1
		WHERE CCS1.staff_id =#{params["id"]})AND C.department_id =D.department_id;"

 		result = []
 		sql_result.each do |row|
 			result << row[0]
 			result << row[1]
 			result << row[2]
 		end
 		render "home",locals: {list: result}
 	end

 	def statistics
 		course_feedback = []
 		doc_feedback = []
 		ta_feedback = []
 		count = 0
 		1.upto(5) do |i|
			6.times do |j|
				sql_course_result = ActiveRecord::Base.connection.execute"
				SELECT count(*)
				FROM EVALUATECOURSE
				WHERE course_code = #{params[:course_id]} AND A#{i} = #{j} ;"
		 		sql_course_result.each do |row|
		 			course_feedback << row[0]
		 		end
			end
 		end

 		1.upto(5) do |i|
			6.times do |j|
				sql_doc_result = ActiveRecord::Base.connection.execute"
				SELECT count(*)
				FROM EVALUATESTAFF 
				WHERE staff_id = #{session[:id]} AND course_code = #{params[:course_id]} AND A#{i} = #{j} ;"
		 		sql_doc_result.each do |row|
		 			doc_feedback << row[0]
		 		end
			end
 		end

 		if session[:type] != "ta"
 			ta_names_result = []
 			sql_ta_names_result = ActiveRecord::Base.connection.execute"SELECT DISTINCT  staff_id ,name 
							FROM CCS C1, PERSON P
							WHERE course_code = #{params[:course_id]} AND C1.staff_id IN
							(SELECT TA_id 
							FROM TA ) AND C1.class_id IN
							(SELECT class_id FROM CCS C2
							WHERE C2.staff_id = #{session[:id]}  AND C2.course_code = #{params[:course_id]}) 
							AND P.person_id =C1.staff_id;"


	 		sql_ta_names_result.each do |row|
	 			ta_names_result << row[0]
	 			ta_names_result << row[1]
	 		end
	 		if ta_names_result.first != nil
		 		ta_ids, ta_names = ta_names_result.partition{|item| item.kind_of?(Fixnum)}
		 		count = ta_ids.count
		 		ta_ids.each do |taid|
		 			1.upto(5) do |i|
						6.times do |j|
							ta_result = ActiveRecord::Base.connection.execute"
							SELECT count(*)
							FROM EVALUATESTAFF 
							WHERE staff_id = #{taid} AND course_code = #{params[:course_id]} AND A#{i} = #{j} ;"
							ta_result.each do |row|
								ta_feedback << row[0]
							end
						end
	 				end
		 		end
		 	end
 		end

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