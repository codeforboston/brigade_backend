class Event < ActiveRecord::Base
  attr_accessible :name, :start_time, :url, :description
  def meetup_details
    Connectors::Meetup.events.detect { |e| e.name == name && e.time.in_time_zone == start_time }
  end
end
