class GroupsController < ApplicationController
	before_action :redirect_if_not_logged_in_admin #See App Controller method

	#creates new group
	def new
			@group = Group.new
	end
	#Creates a group and redirects to User groups (INDEX)
	# unless the group does not save
	#Need to put a min character count on groups!

	def create
		if current_admin
			@group = current_admin.groups.build(group_params)
			binding.pry
			if @group.save
				redirect_to groups_path
			else
				render :new
			#binding.pry
			end
		else 
			redirect_to root_path
		end
	end

	def index
   @groups = current_admin.groups.all
  end

	private

	def group_params
		params.require(:group).permit(:title)
	end


end
