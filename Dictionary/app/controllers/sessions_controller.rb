class SessionsController < ApplicationController
 before_filter :authenticte_reg, :only => [:edit,:destroy,:home,:profile]
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
        $error = "Invalid username or password!"
        redirect_to(:controller => 'sessions', :action => 'new')
      end
  end

  def destroy
    session[:reg_id] = nil
    redirect_to(:controller => 'home', :action =>'index')
  end
  def profile
    @acc = Registration.where(id: session[:reg_id]).take!
    @words = Word.where(author: @acc.username).to_a
  end
  def edit
    
  end

  def update
    
  end

end