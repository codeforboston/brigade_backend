class EventsController < ApplicationController
  respond_to :html, :json

  def index
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

  def new_import
    respond_with(@events = Event.fetch(:events, { group_id: ENV['meetup_group_id'] }))
  end

  def import
    events = []
    meetup_events = Event.fetch(:events, {event_id: event_ids })
    meetup_events.each do |event|
      events << Event.new(name: event.name, url: event.url, description: event.description, start_time: event.time, meetup_id: event.id)
    end
    Event.import(events)
    flash[:success] = "#{events.count} events imported."
    redirect_to root_path
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

  private

  def event_ids
    params[:events].join(",")
  end

end
