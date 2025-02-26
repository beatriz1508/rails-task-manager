class TasksController < ApplicationController
  before_action :set_task, only: [:show]

  def index #ver todas tasks
    @tasks = Task.all
  end

  def show #verdetalhes
  end

  def new #criar nova instancia
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
