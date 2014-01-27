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
			@ex_reg = Registration.where(username: @reg_params[:username]).take

			if @ex_reg 
				#username_taken
			else
				if password_check(@reg_params[:password],@reg_params[:cpassword])
					@reg_params.except!(:cpassword)
					@reg = Registration.new(@reg_params)
					if @reg.save
						redirect_to(:controller => "home", :action =>"index")
					else
						render "new"
					end
				else
					#Error
					@a = "fail"
				end
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
