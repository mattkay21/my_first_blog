class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def confirm_logged_in
  	#checks to see that the session variable has been set and therefore that the user has logged in
  	unless session[:id]
  		flash[:notice] = "Please login"
  		redirect_to(:controller => 'access', :action => 'login')
  		return false #stops an actions that would take place afterwards
  	else
  		return true
  	end
  end

end
