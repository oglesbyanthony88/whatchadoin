class NagsController < ApplicationController

	#creates new nag
	def new
			@nag = Nag.new
	end
	#Creates a nag and redirects to User Nags (INDEX)
	# unless the nag does not save
	#Need to put a min character count on Nags!

	def create
		if current_user
			@nag = current_user.nags.build(nag_params)
			if @nag.save
				redirect_to users_path(current_user)
			else
				render new_nag_path
			end
		elsif current_admin
			@nag = current_admin.nags.build(nag_params)
			if @nag.save
				redirect_to admin_path(current_admin)
			else
				redirect_to new_nag_path
			end
		end
	end

	def index
		if current_admin
    	@nags = current_admin.nags.all
 		else
 			@nags = current_user.nags.all
 		end
  end

  def edit
    @nag = Nag.find(params[:id])
  end

  def update
    @nag = Nag.find(params[:id])
    if @nag.update(nag_params)
      redirect_to '/nags'
    else
      render edit_nag_path(@nag)
    end
  end

  def destroy
   	if current_admin
    	@nag = current_admin.nags.find(params[:id])
    	@nag.destroy
    	redirect_to admin_path(current_admin)
    elsif current_user
    	@nag = current_user.nags.find(params[:id])
    	@nag.destroy
    	redirect_to user_path(current_user)
    else 
    	redirect_to root_path
    end
  end

	private

	def nag_params
		params.require(:nag).permit(:content, :task_id)
	end


end
