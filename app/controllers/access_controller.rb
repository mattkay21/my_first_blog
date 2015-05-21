class AccessController < ApplicationController
	layout 'access'

	def index
		render('login')
	end

	def login
		#display login page
	end

	def attempt_login
		#if both an email and a password are present attempt to look up the user
		if params[:email].present? && params[:password].present?
			#lookup the author table to find a match for the email which is acting as the email address
			found_user = Author.where(:email => params[:email]).first
			#check to see if that particular user has the same password
			if found_user
				authenticated_user = found_user.authenticate(params[:password])
			end
		end
		if authenticated_user
			#if a match is found then asign session variables to id and pen_name
			session[:id] = authenticated_user.id
			session[:pen_name] = authenticated_user.pen_name
			flash[:notice] = "Welcome #{authenticated_user.first_name}!"
			redirect_to(:controller => 'article', :action => 'index')
		else
			#if no match is found then return to the login page with a flash notice
			flash[:notice] = "Sorry no user's details match those provided"
			render('login')
		end
			#########TODO: update the author table to make it accept passwords, add gem if needs be
	end

	def logout
		#delete the session details
		session[:id] = nil
		session[pen_name] = nil
		redirect_to('login')
	end

	private

#	def login_params
#		params.permit(:email, :password)
#	end

end
