class ProjectsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(@projects = Project.all)
  end

  def show
    respond_with(@project = Project.find(params[:id]))
  end

  def new
    respond_with(@project = Project.new)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    respond_with(@project = Project.create(params[:project]))
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes params[:project]
    respond_with @project
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with @project
  end
end
