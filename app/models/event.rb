class Event < ActiveRecord::Base
  attr_accessible :name, :start_time, :url, :description
end
