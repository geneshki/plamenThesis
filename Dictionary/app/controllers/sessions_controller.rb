class SessionsController < ApplicationController
  def new
  end
  def index
  	
  end
  def create
    debugger
   
  		reg = Registration.authenticate(params[:session][:username])

  	if reg.nil?
  		flash.now[:error] = "Invalid username or password"
  		render new  		
  	elsif reg.password != params[:session][:password]
      flash.now[:error] = "Invalid username or password"
      render new  
    else
  		@test = "qq"
  	end
  	
  end

  def destroy
  end
end
