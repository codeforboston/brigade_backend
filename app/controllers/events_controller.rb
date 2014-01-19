class EventsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(@events = Event.all)
  end

  def create
    respond_with(@event = Event.create(params[:event]))
  end

  def show
    respond_with(@event = Event.find(params[:id]))
  end
end
