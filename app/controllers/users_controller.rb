class UsersController < ApplicationController

	#sets up new user
	def new
		@user = User.new
	end
	#if form saves creates new user, redirects to admin path
	#else redirects to new form
	def create
		if current_admin
			@user = current_admin.users.build(user_params)
			# binding.pry
			if @user.save
				redirect_to admin_path(current_admin.id)
			else
				render new_user_path
			end
		else
			redirect_to root_path
		end
	end
	#sends user to show page if logged in
	def show
		if current_admin
			@user = User.find_by_id(params[:id])
		else
			redirect_if_not_logged_in
			@user = User.find_by_id(params[:id])
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end


end
