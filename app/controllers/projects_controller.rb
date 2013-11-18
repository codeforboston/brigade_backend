class ProjectsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(@projects = Project.all)
  end

  def create
    respond_with(@project = Project.create(params[:project]))
  end

  def show
    respond_with(@project = Project.find(params[:id]))
  end
end
