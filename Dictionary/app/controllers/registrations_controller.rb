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
			
			if @reg_params[:username].blank? || @reg_params[:password].blank? || @reg_params[:email].blank?
				$error = "Fill in all the fields!"
				redirect_to(:controller => "registrations", :action =>"new")
			else
				if !email_check(@reg_params[:email])
					$error = "Invalid email!"
					redirect_to(:controller => "registrations", :action =>"new")
				else
					@ex_reg = Registration.where(username: @reg_params[:username]).take
					if @ex_reg 
						$error = "Username taken!"
						@reg = nil
						redirect_to(:controller => "registrations", :action =>"new")
					else
						if password_check(@reg_params[:password],@reg_params[:cpassword])
							@reg_params.except!(:cpassword)
							@reg_params[:salt] = BCrypt::Engine.generate_salt
							@encrypted_password = BCrypt::Engine.hash_secret(@reg_params[:password], @reg_params[:salt])
							@reg_params[:password] = @encrypted_password
							@reg = Registration.new(@reg_params)
							if @reg.save
								redirect_to(:controller => "home", :action =>"index")
							else
								render "new"
							end
						else
							$error= "Passwords don't match!"
							@reg = nil
							redirect_to(:controller => "registrations", :action =>"new")
						end
					end
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
		@reg =  Registration.find(params[:id])
	end

	def update
		@reg =  Registration.find(params[:id])

		if @reg.update_attributes(regitration_params)
			redirect_to(:controller => 'home', :action =>'index')
		end
	end

	def destroy
		@reg = Registration.find(params[:id])
		@reg.destroy
		session[:reg_id] = nil
    	redirect_to(:controller => 'home', :action =>'index')
	end

	
	

end
