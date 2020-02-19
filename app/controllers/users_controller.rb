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
			@user = User.find(params[:id])
		else
			redirect_if_not_logged_in
			@user = current_user
		end
	end

	def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user) if current_user
      redirect_to admin_path(current_admin) if current_admin
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
   	if current_admin
    	@user = current_admin.users.find(params[:id])
    	@user.destroy
    	redirect_to admin_path(current_admin)
    else 
    	redirect_to root_path
    end
  end



	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end


end
