class ApplicationController < ActionController::Base


	#gives views access to methods
	helper_method :current_user, :logged_in?, :is_admin?, 
	:redirect_if_not_logged_in_admin, :admin_logged_in?, :current_admin, 
	:find_groups

 private

	#Finds the current user 
	def current_user
		@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
	end
	#Asks if there is a user loggind in
	def logged_in?
		!!current_user
	end
	#If not logged in redirects to root
	def redirect_if_not_logged_in
		redirect_to '/' if !logged_in?
	end

  def current_admin
  	@current_admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
  end

  def admin_logged_in?
  	!!current_admin
  end

  def redirect_if_not_logged_in_admin
  	redirect_to '/' if !admin_logged_in?
  end

  def find_groups
		@group = Group.find_by_id(params[:id])
	end

	def find_admin_groups
		@group = Group.find_by_id(params[:admin_id])
	end
  
  	


end