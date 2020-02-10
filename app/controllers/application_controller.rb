class ApplicationController < ActionController::Base


	#gives views access to methods
	helper_method :current_user, :logged_in?

 private

	#Finds the current user 
	def current_user
		@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
	end
	#Asks if there is a user loggind in
	def logged_in?
		!!session[:user_id]
	end
	#If not logged in redirects to root
	def redirect_if_not_logged_in
		redirect_to '/' if !logged_in?
	end

end