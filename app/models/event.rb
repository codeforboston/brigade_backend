class Event < ActiveRecord::Base
  attr_accessible :name, :start_time, :url, :description, :meetup_id

  validates :meetup_id, uniqueness: true

  def meetup_details
    Connectors::Meetup.events.detect { |e| e.name == name && e.time.in_time_zone == start_time }
  end

  def self.fetch(type, args)
    Connectors::Meetup.fetch_events(type, args)
  end

end
