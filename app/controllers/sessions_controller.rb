class SessionsController < ApplicationController
	#root path
	def home
	end
	#ends current session
	def destroy
		session.clear
		redirect_to root_path
	end
	#finds user. if user found creates new session, redirects to user_path
	#if not logged in displays error message, redirects to login_path
	def create
		user = User.find_by(email: params[:user][:email])
			if user && user.authenticate(params[:user][:password])
				session[:user_id] = user.id
				redirect_to user_path(user)
			else
				flash[:message] = "Incorrect Login Info"
				redirect_to login_path
			end
	end



end
