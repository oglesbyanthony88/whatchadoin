class NagsController < ApplicationController
	before_action :redirect_if_not_logged_in #See App Controller method

	#creates new nag
	def new
			@nag = Nag.new
	end
	#Creates a nag and redirects to User Nags (INDEX)
	# unless the nag does not save
	#Need to put a min character count on Nags!

	def create
		@nag = current_user.nags.build(nag_params)
		if @nag.save
			redirect_to nags_path
		else
			render :new
			#binding.pry
		end
	end

	def index
   @nags = current_user.nags.all
  end

	private

	def nag_params
		params.require(:nag).permit(:content)
	end


end
