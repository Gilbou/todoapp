class TasksController < ApplicationController

  def index
    @tasks = Task.order(priority: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    if task.valid?
      flash[:notice] = "your task is created"
      redirect_to tasks_path
    else
      flash[:notice] = "your task is NOT created : #{task.errors.messages}"
      redirect_to tasks_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "your task was destroyed"
    redirect_to tasks_path
  end






  private

  def task_params
    params.require(:task).permit(:name, :priority, :due_date)
  end


end
