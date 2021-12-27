class TasksController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @tasks = Task.where(user_id: current_user.id).includes(:user)
    @task = current_user.tasks.build
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.create(task_params)
    redirect_to tasks_path, notice: '登録しました'
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: '削除しました'
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update!(task_params)
      redirect_to tasks_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :start_time)
  end

  def set_post
    @task = current_user.tasks.find(params[:id])
    redirect_to tasks_path, notice: '権限がありません' if @task.nil?
  end
end
