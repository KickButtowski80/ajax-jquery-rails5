class TasksController < ApplicationController
  def index
    @incomplete_tasks = Task.in_complete
    @complete_tasks = Task.complete
  end

  def new
    @task = Task.new
  end
  
def create
  @task = Task.create!(allowed_params)

  respond_to do |f|
    f.html { redirect_to tasks_url }
    f.js
  end
end
  def edit 
    @task = Task.find(params[:id])
  end 
  def update
    @task = Task.find(params[:id])
    @task.update_attributes! allowed_params
    
    redirect_to root_path    
  end
    
  def destroy
    @task = Task.destroy(params[:id])
  
    respond_to do |f|
      f.html { redirect_to tasks_url }
      f.js
    end
  end
  
  private
  
  def allowed_params
    params.require(:task).permit(:name, :complete)
  end
end
