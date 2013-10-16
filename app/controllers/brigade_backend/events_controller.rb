require_dependency "brigade_backend/application_controller"

module BrigadeBackend
  class EventsController < ApplicationController
    respond_to :html, :json

    def create
      respond_with(@event = Event.create(event_params))
    end

    private
    def event_params
      params.require(:event).permit(:name, :start_time, :url, :description)
    end
  end
end
