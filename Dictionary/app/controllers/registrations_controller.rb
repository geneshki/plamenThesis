class RegistrationsController < ApplicationController
	before_filter :authenticte_reg, :only => []
	before_filter :save_login_state, :only => [:new,:create]  
	def index
	end

	def show

	end

	def new
		@reg = Registration.new
	end

	def create
	
			@reg_params = regitration_params
			#sha1 the password
			@reg_params.except!(:cpassword)
		
			if password_check(@reg_params[:password],@reg_params[:cpassword])
				if @reg.save
					redirect_to registrations_path
				else
					render "new"
				end
			else
				#Error
				@a = "fail"
			end
		
	end

	private

	def password_check(password="",cpassword="")
			if password == cpassword
				return true
			else
				return false
			end
	end

	def email_check(email="")
		@EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
		if email =~ @EMAIL_REGEX
			return true
		else
			return false
		end
	end

	def regitration_params
	  params.require(:reg).permit(:username, :password, :cpassword, :email)
	end

	public

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	
	

end
