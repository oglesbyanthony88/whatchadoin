class GroupsController < ApplicationController
	 #See App Controller method

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
			if @group.save
				redirect_to groups_path
			else
				flash[:message] = "Fields missing"
				redirect_to new_group_path
			#binding.pry
			end
		else 
			redirect_to root_path
		end
	end

	def index
		if current_admin
   		@groups = current_admin.groups.all
   	else
   		@groups = current_user.groups.all
   	end
  end

  def show
  	if params[:group_id] && @group = Group.find_by_id(params[:group_id])
			@group = Group.find_by_id(params[:id])
		else
			redirect_if_not_logged_in
			@group = Group.find_by_id(params[:id])
		end
	end

	# def index
	# 	if params[:group_id] && @group = Group.find_by_id(params[:group_id])
 #   		@tasks = @group.tasks
 #   	else
 #   		@tasks = current_admin.tasks.all
 #   	end
   			
 #  end

	def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to '/groups'
    else
    	flash[:message] = "Fields missing"
      redirect_to edit_group_path(@group)
    end
  end

  def destroy
   	if current_admin
    	@group = current_admin.groups.find(params[:id])
    	@group.destroy
    	redirect_to admin_path(current_admin)
    else 
    	redirect_to root_path
    end
  end

	private

	def group_params
		params.require(:group).permit(:title)
	end



end
