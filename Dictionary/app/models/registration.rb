class Registration < ActiveRecord::Base

	class << self
		def authenticate(log_username="", log_password="")
			@reg = Registration.where(username: log_username).take

			if @reg
				return @reg
			else
				return false
			end
		end
		
	end
end
