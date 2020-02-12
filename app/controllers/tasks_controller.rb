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
				render new_task_path
				#binding.pry
			end
		else
		redirect_to root_path
		end
	end

	private

	def task_params
		params.require(:task).permit(:content, :duedate, :user_id, :group_id)
	end

end

