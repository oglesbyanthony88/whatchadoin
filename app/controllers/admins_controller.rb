class AdminsController < ApplicationController

	#sets up new admin
	def new
		@admin = Admin.new
	end
	#if form saves creates new admin, redirects to admin path
	#else redirects to new form
	def create
		@admin = Admin.new(admin_params)
		if @admin.save
			session[:admin_id] = @admin.id
			redirect_to admin_path(@admin)
		else
			flash[:message] = "Fields missing"
			render new_admin_path
		end
	end
	#sends admin to show page if logged in
	def show
		redirect_if_not_logged_in_admin
		current_admin
	end

	def edit
    current_admin
  end

  def update
    current_admin
    if current_admin.update(admin_params)
      redirect_to admin_path(current_admin)
    else
    	flash[:message] = "Fields missing"
      redirect_to edit_admin_path(current_admin)
    end
  end

  def destroy
   	if current_admin
    	current_admin.destroy
    	redirect_to root_path
    else 
    	redirect_to root_path
    end
  end

	private

	def admin_params
		params.require(:admin).permit(:name, :email, :password)
	end


end
