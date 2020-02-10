class TasksController < ApplicationController

def new
	@task = Task.new
end
	#Creates a task and redirects to User tasks (INDEX)
	# unless the task does not save
	#Need to put a min character count on tasks!
	
	def create
		@task = current_user.tasks.build(task_params)
		if @task.save
			redirect_to tasks_path
		else
			render :new
			#binding.pry
		end
	end

	private

	def task_params
		params.require(:task).permit(:content)
	end


end

