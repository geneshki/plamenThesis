class SessionsController < ApplicationController
 before_filter :authenticte_reg, :only => [:edit,:destroy,:home]
 before_filter :save_login_state, :only => [:new,:create]  

  def new
  end
  def index
  	
  end
  def create
      
    	reg = Registration.authenticate(params[:session][:username],params[:session][:password])
    
    	if reg
        session[:reg_id] = reg.id
        session[:reg_username] = reg.username
        redirect_to(:controller => 'home', :action => 'index')
      else
        flash.now[:error] = "Invalid username or password"
        redirect_to(:controller => 'home', :action => 'index')    
    	end
  end

  def destroy
    session[:reg_id] = nil
    redirect_to(:controller => 'home', :action =>'index')
  end

  def edit
    
  end

  def update
    
  end

end
