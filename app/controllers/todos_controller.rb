class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find_by(params.require(:todos).permit(:id))
  end

  def create
    @project = Project.find(params[:project_id])
    @todo = @project.todos.new(todo_params)
    if @todo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @todo = Todo.find_by(params.require(:todos).permit(:id))
    @todo.update(bool)
  end

  private

   def todo_params
    params.require(:todo).permit(:text, :project_id)
  end

  def bool
    params.require(:todos).permit(:isCompleted)
  end
end
