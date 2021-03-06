class TasksController < ApplicationController

	def new
		if params[:group_id] && @group = current_admin.groups.find_by_id(params[:group_id])
			@task = current_admin.tasks.build
		else
			redirect_to root_path
		end
	end
	#Creates a task and redirects to admin_path (INDEX)
	# unless the task does not save
	#Need to put a min character count on tasks!
	
	def create
			@task = current_admin.tasks.build(task_params)
			if @task.save
				redirect_to admin_tasks_path(current_admin)
			else
				flash[:message] = "Keep Tasks between 1 and 100 characters please."
				redirect_to new_task_path
				#binding.pry
			end
	end

	def index
		if params[:group_id] && @group = find_groups
   		@tasks = @group.tasks.order_by_due_date
   	else
   		@tasks = current_admin.tasks.order_by_due_date
   	end
   			
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to admin_tasks_path(current_admin)
    else
      redirect_to edit_task_path(@task)
    end
  end

  def destroy
   	if current_admin
    	@task = current_admin.tasks.find(params[:id])
    	@task.destroy
    	redirect_to admin_tasks_path(current_admin)
    else 
    	redirect_to root_path
    end
  end



	private

	def task_params
		params.require(:task).permit(:content, :duedate, :user_id, :group_id)
	end

end

