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
			render :new
		end
	end
	#sends admin to show page if logged in
	def show
		redirect_if_not_logged_in_admin
		@admin = Admin.find_by_id(params[:id])
		redirect_to '/' if !@admin
	end

	private

	def admin_params
		params.require(:admin).permit(:name, :email, :password)
	end
end
