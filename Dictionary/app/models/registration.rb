class Registration < ActiveRecord::Base

	class << self
		def authenticate(log_username="", log_password="")
			@reg = Registration.find_by_username(log_username)

			if @reg && (@reg.password == log_password)
				return @reg
			else
				return false
			end
		end
		
	end
end
