class EventsController < ApplicationController
  respond_to :html, :json

  def index
    test = ENV["meetup_api_key"]
    binding.pry
    respond_with(@events = Event.all)
  end

  def show

    respond_with(@event = Event.find(params[:id]))
  end

  def new
    respond_with(@event = Event.new)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    respond_with(@event = Event.create(params[:event]))
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes params[:event]
    respond_with @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_with @event
  end
end
