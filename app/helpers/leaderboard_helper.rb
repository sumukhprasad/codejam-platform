include Pagy::Frontend

module LeaderboardHelper
	def computed_name(student)
		(student.preferred_first_name != '' ? student.preferred_first_name : student.first_name) + " " + student.last_name
	end
end
