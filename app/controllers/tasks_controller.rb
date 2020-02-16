class TasksController < ApplicationController

	def new
		@task = Task.new
	end
	#Creates a task and redirects to admin_path (INDEX)
	# unless the task does not save
	#Need to put a min character count on tasks!
	
	def create
		if current_admin

			@task = current_admin.tasks.build(task_params)
			#binding.pry
			if @task.save
				redirect_to admin_path(current_admin)
			else
				redirect_to new_task_path
				#binding.pry
			end
		else
		redirect_to root_path
		end
	end

	def index
		if params[:group_id] && @group = find_groups
   		@tasks = @group.tasks
   	else
   		@tasks = current_admin.tasks.all
   	end
   			
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to '/tasks'
    else
      redirect_to edit_task_path(@task)
    end
  end

  def destroy
   	if current_admin
    	@task = current_admin.tasks.find(params[:id])
    	@task.destroy
    	redirect_to admin_path(current_admin)
    else 
    	redirect_to root_path
    end
  end



	private

	def task_params
		params.require(:task).permit(:content, :duedate, :user_id, :group_id)
	end

end

