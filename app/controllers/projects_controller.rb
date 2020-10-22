class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render action: 'new'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render action: 'new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, todos_attributes: [:text, :isCompleted, :project_id])
  end
end
