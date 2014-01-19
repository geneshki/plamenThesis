class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def authenticte_reg
		if session[:reg_id]
			@current_reg = Registration.where(id: session[:reg_id]).take
			return true
		else
			 redirect_to(:controller => 'sessions', :action => 'new')
			 return false
		end
	end

	def save_login_state
		if session[:reg_id]
			redirect_to(:controller => 'home', :action => 'index')
			return false
		else
			return true
		end
	end

end
