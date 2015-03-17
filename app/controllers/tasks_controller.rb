class TasksController < ApplicationController
  # t.string   "name"
  # t.integer  "user_id"
  # t.datetime "created_at"
  # t.datetime "updated_at"
  
  def create
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      redirect_to current_user, notice:"Task was created successfully"
    else
      flash[:error] = "Error creating task. Please try again."
    end
  end
  
  private
  def task_params
    params.require(:task).permit(:name, :done)
  end
  
end
