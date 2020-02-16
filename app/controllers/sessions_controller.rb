class SessionsController < ApplicationController
	#root path
	def home
		#binding.pry
	end
	#ends current session
	def destroy
		session.clear
		redirect_to root_path
	end
	#finds user. if user found creates new session, redirects to user_path
	#if not logged in displays error message, redirects to login_path
	def create
		#binding.pry
		user = User.find_by(email: params[:user][:email])
			if user && user.authenticate(params[:user][:password])
				session[:user_id] = user.id
				redirect_to user_path(user)
			else
				flash[:message] = "Incorrect Login Info"
				redirect_to login_path
			end
	end

	def admin_create
		admin = Admin.find_by(email: params[:admin][:email])
			if admin && admin.authenticate(params[:admin][:password])
				session[:admin_id] = admin.id
				redirect_to admin_path(current_admin)
			else
				flash[:message] = "Incorrect Login Info"
				redirect_to login_path
			end
	end

	def google
    @admin = Admin.find_or_create_by(email: auth["info"]["email"]) do |admin|
    	admin.name = auth["info"]["first_name"]
    	admin.password = SecureRandom.hex(10)
    end
    if
    	@admin.save
    	session[:admin_id] = @admin.id
    	redirect_to admin_path(current_admin)
  	else
  		redirect_to root_path
  	end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
