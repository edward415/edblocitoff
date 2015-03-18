class TasksController < ApplicationController
    # t.string   "name"
    # t.integer  "user_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.datetime "expires_at"
    # t.boolean  "completed",  default: false
  
  before_action :authenticate_user!
  
  def create
    @task = current_user.tasks.build(task_params)
    @task.expires_at = Time.now + 7.days
    
    if @task.save
      redirect_to tasks_path, notice:"Task was created successfully"
    else
      flash[:error] = "Error creating task. Please try again."
    end
  end
  
  def destroy
    @task = current_user.tasks.find(params[:id])
    
    if @task.destroy
      redirect_to tasks_path, notice: "Task was successfully deleted"
    else
      flash[:error] = "There was an error deleting your task"
      redirect_to @tasks_path
    end
  end
  
  def index
    @inactive_tasks = current_user.tasks.where("expires_at <= ? OR completed ?", Time.now, true)
    @tasks = current_user.tasks.where("expires_at >= ?", Time.now).where(completed: false)
    @new_task = Task.new
  end
  
  private
  def task_params
    params.require(:task).permit(:name, :completed, :id)
  end
  
end
