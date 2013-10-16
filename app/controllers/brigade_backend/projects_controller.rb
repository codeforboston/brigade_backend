require_dependency "brigade_backend/application_controller"

module BrigadeBackend
  class ProjectsController < ApplicationController
    respond_to :html, :json

    def create
      respond_with(@project = Project.create(project_params))
    end

    private
    def project_params
      params.require(:project).permit(:name, :url, :repository, :description)
    end
  end
end
