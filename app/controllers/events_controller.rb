class EventsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(@events = Event.all)
  end

  def show

    respond_with(@event = Event.find(params[:id]))
  end

  def new
    respond_with(@events = RMeetup::Client.fetch(:events, { group_id: Brigade.meetup_ids }))
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    events = RMeetup::Client.fetch(:events, { event_id: event_ids })
    events.each do |event|
      @event = Event.new(name: event.name, url: event.url, description: event.description, start_time: event.time, brigade_id: brigade_id(event.group["id"]))
      @event.save
      redirect_to root_path
    end

    
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
    params[:events].join(", ")
  end

  def brigade_id(group_id)
    Brigade.find_by_meetup_id(group_id).id
  end
end
