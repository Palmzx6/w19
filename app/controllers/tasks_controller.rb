class TasksController < ApplicationController
    before_action :set_category
    before_action :set_task, only: [:update, :destroy]
  
    def create
      @task = @category.tasks.new(task_params)
      if @task.save
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to @category }
        end
      else
        render :new
      end
    end
  
    def update
      @task.update(task_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @category }
      end
    end
  
    def destroy
      @task.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @category }
      end
    end
  
    private
  
    def set_category
      @category = Category.find(params[:category_id])
    end
  
    def set_task
      @task = @category.tasks.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :completed)
    end
  end
  