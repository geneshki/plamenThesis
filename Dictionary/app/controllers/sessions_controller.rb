class SessionsController < ApplicationController
  def new
  end
  def index
  	
  end
  def create
    debugger
    @usr = params[:session][:username]
    @pass = params[:session][:password]
      @reg = Registration.find_by_username(@usr)
  		reg = Registration.authenticate(params[:session][:username],session[:password])

  	if reg.nil?
  		flash.now[:error] = "Invalid username or password"
  		render new  		
  	else
  			
  	end
  	render new
  end

  def destroy
  end
end
