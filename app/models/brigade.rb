class Brigade < ActiveRecord::Base
  attr_accessible :meetup_id, :name
  has_many :events
end
