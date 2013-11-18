class EventsController < ApplicationController
  respond_to :html, :json

  def create
    respond_with(@event = Event.create(params[:event]))
  end
end
