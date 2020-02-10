class UsersController < ApplicationController

	#sets up new user
	def new
		@user = User.new
	end
	#if form saves creates new user, redirects to user path
	#else redirects to new form
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			render :new
		end
	end
	#sends user to show page if logged in
	def show
		redirect_if_not_logged_in
		@user = User.find_by_id(params[:id])
		redirect_to '/' if !@user
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :is_admin)
	end


end
